----------------------------------------------------------------------
-- VoidCheatSheet — In-game boss & dungeon cheat sheets
-- Shows mechanics, role tips, and TL;DR for raids, M+ dungeons, delves
-- Auto-shows on target or encounter start, manual via /cs
----------------------------------------------------------------------

local ADDON_NAME = "VoidCheatSheet"
local FONT = STANDARD_TEXT_FONT
local D = VoidCheatSheetData

VoidCheatSheetDB = VoidCheatSheetDB or {}

----------------------------------------------------------------------
-- Colors
----------------------------------------------------------------------
local C_CYAN = "|cFF00C7FF"
local C_GOLD = "|cFFFFD100"
local C_GREEN = "|cFF00FF00"
local C_RED = "|cFFFF4444"
local C_BLUE = "|cFF5599FF"
local C_ORANGE = "|cFFFF9900"
local C_DIM = "|cFF8C8C9E"
local C_WHITE = "|cFFFFFFFF"
local C_PURPLE = "|cFFB48EF7"
local C_YELLOW = "|cFFFFFF00"

----------------------------------------------------------------------
-- Role detection
----------------------------------------------------------------------
local ROLE_COLORS = {
    tank = C_BLUE,
    healer = C_GREEN,
    dps = C_RED,
}
local ROLE_LABELS = {
    tank = "TANK",
    healer = "HEALER",
    dps = "DPS",
}

local function GetPlayerRole()
    local role = "dps"
    pcall(function()
        local spec = GetSpecialization()
        if spec then
            local r = GetSpecializationRole(spec)
            if r == "TANK" then role = "tank"
            elseif r == "HEALER" then role = "healer"
            else role = "dps" end
        end
    end)
    return role
end

----------------------------------------------------------------------
-- Boss portrait + tank swap helpers
----------------------------------------------------------------------
local portraitCache = {}  -- [encounterID] = "texturePath"

local function GetBossPortraitIcon(boss)
    if not boss or not boss.encounterID then return nil end
    local eid = boss.encounterID
    if portraitCache[eid] ~= nil then
        return portraitCache[eid] or nil  -- may be cached as false
    end

    local iconImage
    local ok = pcall(function()
        if EJ_SelectInstance and boss.instanceID then
            pcall(EJ_SelectInstance, boss.instanceID)
        end
        if EJ_SelectEncounter then
            pcall(EJ_SelectEncounter, eid)
        end
        local _, _, _, _, img = EJ_GetCreatureInfo(1, eid)
        iconImage = img
    end)

    portraitCache[eid] = iconImage or false
    if ok and iconImage and iconImage ~= "" then
        return iconImage
    end
    return nil
end

local function SetBossPortrait(hostFrame, boss)
    if not hostFrame or not hostFrame.portrait then return false end
    local icon = boss and GetBossPortraitIcon(boss)
    if icon then
        hostFrame.portrait:SetTexture(icon)
        hostFrame.portrait:Show()
        if hostFrame.title and hostFrame._titleAnchorPortrait then
            local a = hostFrame._titleAnchorPortrait
            hostFrame.title:ClearAllPoints()
            hostFrame.title:SetPoint(a.point, a.x, a.y)
        end
        return true
    else
        hostFrame.portrait:Hide()
        if hostFrame.title and hostFrame._titleAnchor then
            local a = hostFrame._titleAnchor
            hostFrame.title:ClearAllPoints()
            hostFrame.title:SetPoint(a.point, a.x, a.y)
        end
        return false
    end
end

local TS_TRIGGER_LABELS = {
    stacks   = "STACKS",
    cast     = "PER CAST",
    rotation = "ROTATION",
    mechanic = "MECHANIC",
}

local function FormatTankSwapLine(ts, compact)
    if not ts then return nil end
    local tag = TS_TRIGGER_LABELS[ts.trigger] or "SWAP"
    local head
    if ts.trigger == "stacks" and ts.stacks then
        head = "TANK SWAP (" .. tag .. "): " .. ts.stacks .. " stacks of " .. (ts.debuff or "?")
    elseif ts.debuff then
        head = "TANK SWAP (" .. tag .. "): " .. ts.debuff
    else
        head = "TANK SWAP (" .. tag .. ")"
    end
    if compact then
        return "|cFFFF4444" .. head .. "|r"
    end
    if ts.note then
        return "|cFFFF4444" .. head .. "|r\n  |cFFC7C7D0" .. ts.note .. "|r"
    end
    return "|cFFFF4444" .. head .. "|r"
end

----------------------------------------------------------------------
-- Main Frame (full panel)
----------------------------------------------------------------------
local frame

local function CreateCheatFrame()
    if frame then return frame end

    local f = CreateFrame("Frame", "VoidCheatSheetFrame", UIParent, "BackdropTemplate")
    f:SetSize(420, 500)
    f:SetPoint("RIGHT", UIParent, "RIGHT", -20, 0)
    f:SetFrameStrata("HIGH")
    f:SetBackdrop({ bgFile = "Interface\\Buttons\\WHITE8X8", edgeFile = "Interface\\Buttons\\WHITE8X8", edgeSize = 1 })
    f:SetBackdropColor(0.05, 0.05, 0.07, 0.95)
    f:SetBackdropBorderColor(0, 0.78, 1, 0.4)
    f:SetMovable(true)
    f:SetResizable(true)
    f:SetResizeBounds(250, 200, 800, 900)
    f:SetClampedToScreen(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        local point, _, relPoint, x, y = self:GetPoint(1)
        VoidCheatSheetDB.position = { point = point, relPoint = relPoint, x = x, y = y }
    end)

    -- Resize handle
    local resizeBtn = CreateFrame("Button", nil, f)
    resizeBtn:SetSize(16, 16)
    resizeBtn:SetPoint("BOTTOMRIGHT", -2, 2)
    resizeBtn:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
    resizeBtn:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
    resizeBtn:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
    resizeBtn:SetScript("OnMouseDown", function()
        f:StartSizing("BOTTOMRIGHT")
    end)
    resizeBtn:SetScript("OnMouseUp", function()
        f:StopMovingOrSizing()
        local w, h = f:GetSize()
        VoidCheatSheetDB.size = { w = w, h = h }
        if f.child then f.child:SetWidth(f.scroll:GetWidth() - 4) end
        if f.content then
            f.content:SetWidth(f.scroll:GetWidth() - 12)
            local textHeight = f.content:GetStringHeight() or 400
            f.child:SetHeight(textHeight + 20)
        end
    end)

    -- Restore position and size
    if VoidCheatSheetDB.position then
        f:ClearAllPoints()
        f:SetPoint(VoidCheatSheetDB.position.point, UIParent, VoidCheatSheetDB.position.relPoint,
            VoidCheatSheetDB.position.x, VoidCheatSheetDB.position.y)
    end
    if VoidCheatSheetDB.size then
        f:SetSize(VoidCheatSheetDB.size.w, VoidCheatSheetDB.size.h)
    end

    -- Close button
    local close = CreateFrame("Button", nil, f)
    close:SetSize(20, 20)
    close:SetPoint("TOPRIGHT", -4, -4)
    close:SetNormalFontObject(GameFontNormal)
    local closeTxt = close:CreateFontString(nil, "OVERLAY")
    closeTxt:SetFont(FONT, 14, "OUTLINE")
    closeTxt:SetText("|cFFFF4444x|r")
    closeTxt:SetAllPoints()
    close:SetScript("OnClick", function() f:Hide() end)

    -- Share button (post TL;DR to party/raid chat)
    local shareBtn = CreateFrame("Button", nil, f)
    shareBtn:SetSize(50, 18)
    shareBtn:SetPoint("TOPRIGHT", -28, -5)
    local shareBg = shareBtn:CreateTexture(nil, "BACKGROUND")
    shareBg:SetAllPoints()
    shareBg:SetColorTexture(0, 0.5, 0.7, 0.3)
    local shareTxt = shareBtn:CreateFontString(nil, "OVERLAY")
    shareTxt:SetFont(FONT, 10, "OUTLINE")
    shareTxt:SetText(C_CYAN .. "Share|r")
    shareTxt:SetAllPoints()
    shareBtn:SetScript("OnClick", function()
        if f.currentBoss then
            local channel = IsInRaid() and "RAID" or IsInGroup() and "PARTY" or nil
            if channel then
                local boss = f.currentBoss
                SendChatMessage("[VoidCheatSheet] " .. boss.name, channel)
                SendChatMessage("TL;DR: " .. boss.tldr:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""), channel)
                local role = GetPlayerRole()
                local tip = boss[role]
                if tip then
                    SendChatMessage(ROLE_LABELS[role] .. ": " .. tip:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""), channel)
                end
                print(C_CYAN .. "VoidCheatSheet:|r Shared to " .. channel)
            else
                print(C_CYAN .. "VoidCheatSheet:|r Must be in a group to share.")
            end
        end
    end)
    shareBtn:SetScript("OnEnter", function(self)
        shareBg:SetColorTexture(0, 0.6, 0.8, 0.5)
        GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
        GameTooltip:SetText("Post boss TL;DR + role tip to party/raid chat")
        GameTooltip:Show()
    end)
    shareBtn:SetScript("OnLeave", function()
        shareBg:SetColorTexture(0, 0.5, 0.7, 0.3)
        GameTooltip:Hide()
    end)

    -- Boss portrait (optional, set via SetBossPortrait)
    local portrait = f:CreateTexture(nil, "ARTWORK")
    portrait:SetSize(40, 40)
    portrait:SetPoint("TOPLEFT", 8, -4)
    portrait:Hide()
    f.portrait = portrait

    -- Title
    local title = f:CreateFontString(nil, "OVERLAY")
    title:SetFont(FONT, 14, "OUTLINE")
    title:SetPoint("TOPLEFT", 12, -8)
    title:SetTextColor(0, 0.78, 1)
    f.title = title
    f._titleAnchor = { point = "TOPLEFT", x = 12, y = -8 }
    f._titleAnchorPortrait = { point = "TOPLEFT", x = 54, y = -8 }

    -- Scroll frame
    local sf = CreateFrame("ScrollFrame", nil, f)
    sf:SetPoint("TOPLEFT", 8, -28)
    sf:SetPoint("BOTTOMRIGHT", -8, 8)
    sf:EnableMouseWheel(true)

    local child = CreateFrame("Frame", nil, sf)
    child:SetWidth(sf:GetWidth() or 400)
    sf:SetScrollChild(child)

    sf:SetScript("OnMouseWheel", function(self, delta)
        local cur = self:GetVerticalScroll()
        local mx = self:GetVerticalScrollRange()
        self:SetVerticalScroll(math.max(0, math.min(mx, cur - delta * 30)))
    end)

    -- Scroll indicator
    local sInd = sf:CreateTexture(nil, "OVERLAY")
    sInd:SetWidth(3)
    sInd:SetColorTexture(1, 1, 1, 0.12)
    sInd:SetPoint("TOPRIGHT", 0, 0)
    sInd:SetHeight(20)
    sInd:Hide()
    sf:SetScript("OnScrollRangeChanged", function()
        local mx = sf:GetVerticalScrollRange()
        if mx <= 0 then sInd:Hide(); return end
        sInd:Show()
        local sh = sf:GetHeight()
        local ch = child:GetHeight()
        if ch <= 0 then ch = 1 end
        local ih = math.max(15, (sh / ch) * sh)
        sInd:SetHeight(ih)
    end)

    f.scroll = sf
    f.child = child
    f.content = child:CreateFontString(nil, "OVERLAY")
    f.content:SetFont(FONT, 11, "")
    f.content:SetPoint("TOPLEFT", 4, -4)
    f.content:SetWidth(390)
    f.content:SetJustifyH("LEFT")
    f.content:SetWordWrap(true)
    f.content:SetSpacing(3)

    -- Reflow text on show and resize
    local function ReflowText()
        local scrollW = sf:GetWidth()
        if scrollW <= 0 then scrollW = 400 end
        child:SetWidth(scrollW - 4)
        f.content:SetWidth(scrollW - 12)
        local textHeight = f.content:GetStringHeight() or 400
        child:SetHeight(textHeight + 20)
    end

    f:SetScript("OnShow", ReflowText)
    f:SetScript("OnSizeChanged", function()
        C_Timer.After(0.05, ReflowText)
    end)
    f.ReflowText = ReflowText

    tinsert(UISpecialFrames, "VoidCheatSheetFrame")
    f:Hide()
    frame = f
    return f
end

----------------------------------------------------------------------
-- Compact tooltip frame (auto-popup on target)
----------------------------------------------------------------------
local tooltipFrame

local function CreateTooltipFrame()
    if tooltipFrame then return tooltipFrame end

    local f = CreateFrame("Frame", "VoidCheatSheetTooltip", UIParent, "BackdropTemplate")
    f:SetSize(300, 120)
    f:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -20, -200)
    f:SetFrameStrata("HIGH")
    f:SetBackdrop({ bgFile = "Interface\\Buttons\\WHITE8X8", edgeFile = "Interface\\Buttons\\WHITE8X8", edgeSize = 1 })
    f:SetBackdropColor(0.05, 0.05, 0.07, 0.92)
    f:SetBackdropBorderColor(0, 0.78, 1, 0.5)
    f:SetMovable(true)
    f:SetClampedToScreen(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        local point, _, relPoint, x, y = self:GetPoint(1)
        VoidCheatSheetDB.tooltipPos = { point = point, relPoint = relPoint, x = x, y = y }
    end)

    -- Restore tooltip position
    if VoidCheatSheetDB.tooltipPos then
        f:ClearAllPoints()
        f:SetPoint(VoidCheatSheetDB.tooltipPos.point, UIParent, VoidCheatSheetDB.tooltipPos.relPoint,
            VoidCheatSheetDB.tooltipPos.x, VoidCheatSheetDB.tooltipPos.y)
    end

    -- Boss portrait (optional)
    local portrait = f:CreateTexture(nil, "ARTWORK")
    portrait:SetSize(28, 28)
    portrait:SetPoint("TOPLEFT", 6, -4)
    portrait:Hide()
    f.portrait = portrait

    -- Title
    local title = f:CreateFontString(nil, "OVERLAY")
    title:SetFont(FONT, 12, "OUTLINE")
    title:SetPoint("TOPLEFT", 8, -6)
    title:SetTextColor(0, 0.78, 1)
    f.title = title
    f._titleAnchor = { point = "TOPLEFT", x = 8, y = -6 }
    f._titleAnchorPortrait = { point = "TOPLEFT", x = 40, y = -6 }

    -- "Click for full" hint
    local hint = f:CreateFontString(nil, "OVERLAY")
    hint:SetFont(FONT, 9, "")
    hint:SetPoint("TOPRIGHT", -6, -7)
    hint:SetText(C_DIM .. "click for full|r")
    f.hint = hint

    -- Body
    local body = f:CreateFontString(nil, "OVERLAY")
    body:SetFont(FONT, 10, "")
    body:SetPoint("TOPLEFT", 8, -22)
    body:SetPoint("BOTTOMRIGHT", -8, 6)
    body:SetJustifyH("LEFT")
    body:SetJustifyV("TOP")
    body:SetWordWrap(true)
    body:SetSpacing(2)
    f.body = body

    f:SetScript("OnMouseDown", function()
        -- Click to expand to full panel
        if f.currentBoss then
            ShowBoss(f.currentBoss)
            f:Hide()
        end
    end)

    f:Hide()
    tooltipFrame = f
    return f
end

local function ShowTooltip(boss)
    -- Hide full panel when showing tooltip
    if frame and frame:IsShown() then frame:Hide() end

    local f = CreateTooltipFrame()
    f.currentBoss = boss

    local playerRole = GetPlayerRole()
    local typeTag = ""
    if boss.contentType == "dungeon" then
        typeTag = C_ORANGE .. "[M+] " .. "|r"
    elseif boss.contentType == "delve" then
        typeTag = C_PURPLE .. "[Delve] " .. "|r"
    else
        typeTag = C_RED .. "[Raid] " .. "|r"
    end

    SetBossPortrait(f, boss)
    f.title:SetText(typeTag .. C_CYAN .. boss.name .. "|r")

    -- Build compact body: TL;DR + tank swap (if tank) + role tip
    local lines = {}
    lines[#lines + 1] = C_GOLD .. "TL;DR:|r " .. C_WHITE .. boss.tldr .. "|r"
    if boss.tankSwap then
        local ts = FormatTankSwapLine(boss.tankSwap, (playerRole ~= "tank"))
        if ts then
            lines[#lines + 1] = ts
        end
    end
    lines[#lines + 1] = ""
    local tip = boss[playerRole]
    if tip then
        local color = ROLE_COLORS[playerRole]
        local label = ROLE_LABELS[playerRole]
        lines[#lines + 1] = C_GREEN .. ">>> " .. "|r" .. color .. label .. ":|r " .. C_WHITE .. tip .. "|r"
    end

    f.body:SetText(table.concat(lines, "\n"))

    -- Auto-size height to content
    local textHeight = f.body:GetStringHeight() or 60
    f:SetHeight(textHeight + 32)

    f:Show()
    return f
end

----------------------------------------------------------------------
-- Build cheat sheet text (full panel)
----------------------------------------------------------------------
local function BuildCheatText(boss, playerRole)
    local lines = {}
    local function L(s) lines[#lines + 1] = s end

    -- Content type badge
    if boss.contentType == "dungeon" then
        L(C_ORANGE .. "[MYTHIC+ DUNGEON]|r")
    elseif boss.contentType == "delve" then
        L(C_PURPLE .. "[DELVE]|r")
    end

    -- Type + TL;DR
    if boss.bossType then
        L(C_DIM .. "Type: " .. boss.bossType .. "|r")
    end
    L(C_GOLD .. "TL;DR:|r " .. C_WHITE .. boss.tldr .. "|r")
    L("")

    -- Tank swap callout (prominent)
    if boss.tankSwap then
        local ts = FormatTankSwapLine(boss.tankSwap, false)
        if ts then
            L(ts)
            L("")
        end
    end

    -- Bloodlust timing
    if boss.bloodlust then
        L(C_RED .. "BLOODLUST:|r " .. C_WHITE .. boss.bloodlust .. "|r")
        L("")
    end

    -- Phases
    if boss.phases and #boss.phases > 0 then
        L(C_CYAN .. "== PHASES ==|r")
        for _, phase in ipairs(boss.phases) do
            L(C_GOLD .. phase.name .. ":|r " .. C_WHITE .. phase.desc .. "|r")
        end
        L("")
    end

    -- Abilities
    if boss.abilities and #boss.abilities > 0 then
        L(C_CYAN .. "== MECHANICS ==|r")
        for _, ability in ipairs(boss.abilities) do
            L(C_ORANGE .. ability.name .. "|r")
            L("  " .. C_DIM .. ability.desc .. "|r")
        end
        L("")
    end

    -- Trash (dungeon-specific)
    if boss.trash then
        L(C_RED .. "== DANGEROUS TRASH ==|r")
        L(C_WHITE .. boss.trash .. "|r")
        L("")
    end

    -- Add Priority
    if boss.addPriority then
        L(C_CYAN .. "== ADD PRIORITY ==|r")
        L(C_WHITE .. boss.addPriority .. "|r")
        L("")
    end

    -- Companion tip (delve-specific)
    if boss.companion then
        L(C_PURPLE .. "== COMPANION ==|r")
        L(C_WHITE .. boss.companion .. "|r")
        L("")
    end

    -- Role-specific tips (highlight player's role)
    L(C_CYAN .. "== ROLE TIPS ==|r")
    local roles = { "tank", "healer", "dps" }
    for _, role in ipairs(roles) do
        local color = ROLE_COLORS[role]
        local label = ROLE_LABELS[role]
        local tip = boss[role]
        if tip then
            local prefix = ""
            if role == playerRole then
                prefix = C_GREEN .. ">>> " .. "|r"
            end
            L(prefix .. color .. label .. ":|r " .. C_WHITE .. tip .. "|r")
            L("")
        end
    end

    -- Positioning
    if boss.positioning then
        L(C_CYAN .. "== POSITIONING ==|r")
        L(C_WHITE .. boss.positioning .. "|r")
        L("")
    end

    -- Common Wipe Causes
    if boss.wipes then
        L(C_RED .. "== COMMON WIPES ==|r")
        L(C_WHITE .. boss.wipes .. "|r")
        L("")
    end

    -- Heroic differences
    if boss.heroic then
        L(C_ORANGE .. "== HEROIC ==|r")
        L(C_WHITE .. boss.heroic .. "|r")
        L("")
    end

    -- Mythic differences
    if boss.mythic then
        L(C_RED .. "== MYTHIC ==|r")
        L(C_WHITE .. boss.mythic .. "|r")
        L("")
    end

    -- Tyrannical note (dungeon-specific)
    if boss.tyrannical then
        L(C_YELLOW .. "== TYRANNICAL ==|r")
        L(C_WHITE .. boss.tyrannical .. "|r")
        L("")
    end

    return table.concat(lines, "\n")
end

----------------------------------------------------------------------
-- Show cheat sheet for a boss (full panel)
----------------------------------------------------------------------
function ShowBoss(boss)
    -- Hide tooltip when showing full panel
    if tooltipFrame and tooltipFrame:IsShown() then tooltipFrame:Hide() end

    local f = CreateCheatFrame()
    local playerRole = GetPlayerRole()

    f.currentBoss = boss
    SetBossPortrait(f, boss)
    f.title:SetText(C_CYAN .. boss.name .. "|r")
    f.content:SetText(BuildCheatText(boss, playerRole))

    local textHeight = f.content:GetStringHeight() or 400
    f.child:SetHeight(textHeight + 20)
    f.scroll:SetVerticalScroll(0)

    f:Show()
end

----------------------------------------------------------------------
-- Find boss by name (fuzzy) — searches all content types
----------------------------------------------------------------------
-- Case-sensitive exact match (for tainted strings from UnitName/tooltip)
-- Tainted strings can be used as table keys if the key already exists (tested)
-- But :lower() and :gsub() crash on tainted strings
local function FindBossExact(search)
    if not search or not D.byExactName then return nil end
    -- Direct table lookup — works even with tainted strings if the key exists
    return D.byExactName[search]
end

-- Case-insensitive fuzzy match (for clean strings from slash commands)
local function FindBoss(search)
    if not search or search == "" then return nil end
    search = search:lower():gsub("%s+", "")

    if not D.byName then return nil end

    -- Exact match first
    if D.byName[search] then return D.byName[search] end

    -- Partial match
    for key, boss in pairs(D.byName) do
        if key:find(search, 1, true) then
            return boss
        end
    end
    return nil
end

----------------------------------------------------------------------
-- Find instance by name (fuzzy) — raids, dungeons, delves
----------------------------------------------------------------------
local function FindInstance(search)
    if not search or search == "" then return nil end
    search = search:lower()

    -- Search raids
    if D.raids then
        for _, raid in ipairs(D.raids) do
            if raid.name:lower():find(search, 1, true) then
                return raid, "raid"
            end
        end
    end

    -- Search dungeons
    if D.dungeons then
        for _, dng in ipairs(D.dungeons) do
            if dng.name:lower():find(search, 1, true) then
                return dng, "dungeon"
            end
        end
    end

    -- Search delves
    if D.delves then
        for _, delve in ipairs(D.delves) do
            if delve.name:lower():find(search, 1, true) then
                return delve, "delve"
            end
        end
    end

    return nil, nil
end

----------------------------------------------------------------------
-- Killed boss tracking (raid lockout awareness)
-- Keyed by encounterID; value = unix timestamp when entry expires.
----------------------------------------------------------------------
local function SecondsUntilWeeklyReset()
    if C_DateAndTime and C_DateAndTime.GetSecondsUntilWeeklyReset then
        local s = C_DateAndTime.GetSecondsUntilWeeklyReset()
        if s and s > 0 then return s end
    end
    return 604800
end

local function PurgeExpiredKills()
    VoidCheatSheetDB.killed = VoidCheatSheetDB.killed or {}
    local now = time()
    for eid, expiry in pairs(VoidCheatSheetDB.killed) do
        if type(expiry) ~= "number" or expiry <= now then
            VoidCheatSheetDB.killed[eid] = nil
        end
    end
end

local function IsBossKilled(boss)
    if not boss or not boss.encounterID then return false end
    VoidCheatSheetDB.killed = VoidCheatSheetDB.killed or {}
    local expiry = VoidCheatSheetDB.killed[boss.encounterID]
    if not expiry then return false end
    if expiry <= time() then
        VoidCheatSheetDB.killed[boss.encounterID] = nil
        return false
    end
    return true
end

local function MarkBossKilled(encounterID)
    if not encounterID then return end
    VoidCheatSheetDB.killed = VoidCheatSheetDB.killed or {}
    VoidCheatSheetDB.killed[encounterID] = time() + SecondsUntilWeeklyReset()
end

local function SyncKillsFromLockouts()
    PurgeExpiredKills()
    local n = GetNumSavedInstances and GetNumSavedInstances() or 0
    if n <= 0 then return end
    for i = 1, n do
        local ok, _, _, _, _, locked, _, _, _, _, _, numEnc = pcall(GetSavedInstanceInfo, i)
        if ok and locked and numEnc and numEnc > 0 then
            for j = 1, numEnc do
                local infoOk, bossName, _, isKilled = pcall(GetSavedInstanceEncounterInfo, i, j)
                if infoOk and isKilled and bossName then
                    local boss = D.byExactName and D.byExactName[bossName]
                    if boss and boss.encounterID then
                        MarkBossKilled(boss.encounterID)
                    end
                end
            end
        end
    end
end

----------------------------------------------------------------------
-- Show all bosses for an instance (raid, dungeon, or delve)
----------------------------------------------------------------------
local function ShowInstance(inst, instType)
    -- Hide tooltip when showing full panel
    if tooltipFrame and tooltipFrame:IsShown() then tooltipFrame:Hide() end

    local f = CreateCheatFrame()
    local playerRole = GetPlayerRole()

    local typeTag = ""
    if instType == "dungeon" then
        typeTag = C_ORANGE .. "[M+] " .. "|r"
    elseif instType == "delve" then
        typeTag = C_PURPLE .. "[Delve] " .. "|r"
    end

    SetBossPortrait(f, nil)
    f.title:SetText(typeTag .. C_CYAN .. inst.name .. "|r")
    f.currentBoss = nil

    local lines = {}
    local function L(s) lines[#lines + 1] = s end

    -- Instance-level trash notes
    if inst.trashNotes then
        L(C_RED .. "== KEY TRASH ==|r")
        L(C_WHITE .. inst.trashNotes .. "|r")
        L("")
    end

    local bossList = inst.bosses or inst.encounters
    if bossList then
        if instType == "raid" then PurgeExpiredKills() end
        local killedBosses = {}
        for _, boss in ipairs(bossList) do
            if instType == "raid" and IsBossKilled(boss) then
                killedBosses[#killedBosses + 1] = boss
            else
                L(C_CYAN .. "==============================|r")
                L(C_CYAN .. "Boss " .. (boss.order or "") .. ": " .. boss.name .. "|r")
                L(C_CYAN .. "==============================|r")
                L("")
                L(BuildCheatText(boss, playerRole))
                L("")
                L("")
            end
        end
        if #killedBosses > 0 then
            L(C_DIM .. "--- Already killed this week ---|r")
            for _, boss in ipairs(killedBosses) do
                L(C_DIM .. "  ✓ " .. (boss.order or "") .. ". " .. boss.name .. "|r")
            end
            L("")
        end
    end

    f.content:SetText(table.concat(lines, "\n"))
    local textHeight = f.content:GetStringHeight() or 400
    f.child:SetHeight(textHeight + 20)
    f.scroll:SetVerticalScroll(0)
    f:Show()
end

----------------------------------------------------------------------
-- Show boss/dungeon/delve list
----------------------------------------------------------------------
local function ShowBossList()
    local f = CreateCheatFrame()
    SetBossPortrait(f, nil)
    f.title:SetText(C_CYAN .. "VoidCheatSheet — Content Guide|r")
    f.currentBoss = nil

    local lines = {}
    local function L(s) lines[#lines + 1] = s end

    L(C_GOLD .. "Use /cs <name> to view details|r")
    L("")

    -- Raids
    if D.raids and #D.raids > 0 then
        PurgeExpiredKills()
        L(C_RED .. "== RAIDS ==|r")
        for _, raid in ipairs(D.raids) do
            local killedCount, totalCount = 0, #raid.bosses
            for _, b in ipairs(raid.bosses) do
                if IsBossKilled(b) then killedCount = killedCount + 1 end
            end
            local lockTag = ""
            if killedCount > 0 then
                lockTag = "  " .. C_DIM .. "(" .. killedCount .. "/" .. totalCount .. " this week)|r"
            end
            L(C_CYAN .. "  " .. raid.name .. "|r" .. lockTag)
            for _, boss in ipairs(raid.bosses) do
                if IsBossKilled(boss) then
                    L("    " .. C_DIM .. "✓ " .. boss.order .. ". " .. boss.name .. "  (killed this week)|r")
                else
                    L("    " .. C_ORANGE .. boss.order .. ". " .. boss.name .. "|r")
                    L("      " .. C_DIM .. boss.tldr .. "|r")
                end
            end
            L("")
        end
    end

    -- Dungeons
    if D.dungeons and #D.dungeons > 0 then
        L(C_ORANGE .. "== MYTHIC+ DUNGEONS ==|r")
        for _, dng in ipairs(D.dungeons) do
            L(C_CYAN .. "  " .. dng.name .. "|r")
            local bossList = dng.bosses or dng.encounters
            if bossList then
                for _, boss in ipairs(bossList) do
                    L("    " .. C_ORANGE .. boss.order .. ". " .. boss.name .. "|r")
                    L("      " .. C_DIM .. boss.tldr .. "|r")
                end
            end
            L("")
        end
    end

    -- Delves
    if D.delves and #D.delves > 0 then
        L(C_PURPLE .. "== DELVES ==|r")
        for _, delve in ipairs(D.delves) do
            L(C_CYAN .. "  " .. delve.name .. "|r")
            local bossList = delve.bosses or delve.encounters
            if bossList then
                for _, boss in ipairs(bossList) do
                    L("    " .. C_PURPLE .. boss.order .. ". " .. boss.name .. "|r")
                    L("      " .. C_DIM .. boss.tldr .. "|r")
                end
            end
            L("")
        end
    end

    L("")
    L(C_DIM .. "Usage: /cs <boss> — show specific boss|r")
    L(C_DIM .. "Usage: /cs <dungeon> — show dungeon guide|r")
    L(C_DIM .. "Usage: /cs share — post current boss to chat|r")
    L(C_DIM .. "Usage: /cs popup on|off — toggle auto-popup|r")
    L(C_DIM .. "Auto-shows when targeting a boss.|r")

    f.content:SetText(table.concat(lines, "\n"))
    local textHeight = f.content:GetStringHeight() or 400
    f.child:SetHeight(textHeight + 20)
    f.scroll:SetVerticalScroll(0)
    f:Show()
end

----------------------------------------------------------------------
-- Auto-popup on target / encounter start
----------------------------------------------------------------------
local inEncounter = false
local autoPopupEnabled = true
local tooltipHideTimer = nil

local function OnTargetChanged()
    if not autoPopupEnabled then return end

    -- Don't auto-popup during active encounters (DBM/BigWigs handle combat)
    if inEncounter then return end

    local unit = "target"
    if not UnitExists(unit) then
        -- Target cleared — hide tooltip after short delay
        if tooltipFrame and tooltipFrame:IsShown() then
            if tooltipHideTimer then tooltipHideTimer:Cancel() end
            tooltipHideTimer = C_Timer.NewTimer(2, function()
                if tooltipFrame and not UnitExists("target") then
                    tooltipFrame:Hide()
                end
            end)
        end
        return
    end

    -- Only show for NPCs (not players)
    if UnitIsPlayer(unit) then return end

    -- WoW 12.0: ALL enemy unit data is tainted (name, GUID, tooltip text).
    -- Can't read, compare, or use any string from enemy units.
    -- Solution: detect boss by INSTANCE/ZONE (clean) + unit classification.
    -- When player is in a known instance and targets an elite/boss, show that instance's boss data.
    local boss = nil

    -- Method 1: Try UnitName with pcall (works for friendly/neutral NPCs, outdoor bosses)
    local rawName = UnitName(unit)
    if rawName then
        local ok, result = pcall(FindBoss, rawName)
        if ok and result then
            boss = result
        end
    end

    -- Method 2: NPC ID from GUID (works if GUID isn't tainted)
    if not boss then
        local guidOk, guid = pcall(UnitGUID, unit)
        if guidOk and guid then
            local parseOk, npcID = pcall(function()
                local id = select(6, strsplit("-", guid))
                return tonumber(id)
            end)
            if parseOk and npcID and D.byNpcID then
                boss = D.byNpcID[npcID]
            end
        end
    end

    -- Method 3: Proximity-based detection
    -- Check hardcoded D.bossPositions + user-saved VoidCheatSheetDB.bossPositions
    if not boss then
        local mapID = C_Map.GetBestMapForUnit("player")
        if mapID then
            local pos = C_Map.GetPlayerMapPosition(mapID, "player")
            if pos then
                local px, py = pos:GetXY()
                local closest, closestDist = nil, 0.05  -- ~5% map distance threshold

                -- Check hardcoded positions
                if D.bossPositions then
                    for bossName, bpos in pairs(D.bossPositions) do
                        if bpos.mapID == mapID then
                            local dx = px - bpos.x
                            local dy = py - bpos.y
                            local dist = math.sqrt(dx * dx + dy * dy)
                            if dist < closestDist then
                                closestDist = dist
                                closest = D.byExactName[bossName]
                            end
                        end
                    end
                end

                -- Check user-saved positions (from /cs mark)
                if VoidCheatSheetDB.bossPositions then
                    for bossName, bpos in pairs(VoidCheatSheetDB.bossPositions) do
                        if bpos.mapID == mapID then
                            local dx = px - bpos.x
                            local dy = py - bpos.y
                            local dist = math.sqrt(dx * dx + dy * dy)
                            if dist < closestDist then
                                closestDist = dist
                                closest = D.byExactName[bossName]
                            end
                        end
                    end
                end

                if closest then boss = closest end
            end
        end
    end

    -- Method 4: Zone-based detection
    if not boss then
        local instanceName = GetInstanceInfo()
        if instanceName and D.byInstanceBoss then
            local instBosses = D.byInstanceBoss[instanceName]
            if instBosses and #instBosses == 1 then
                -- Single boss (delve) — show that boss tooltip
                boss = instBosses[1]
            elseif instBosses and #instBosses > 1 then
                -- Multi-boss instance — show full instance panel
                local inst, instType = FindInstance(instanceName)
                if inst then
                    ShowInstance(inst, instType)
                end
                return
            end
        end
    end

    if not boss then return end

    -- Cancel any pending hide
    if tooltipHideTimer then tooltipHideTimer:Cancel() end

    -- Show compact tooltip
    local ok2, err2 = pcall(ShowTooltip, boss)
    if not ok2 then
        print(C_RED .. "[VoidCheatSheet] ShowTooltip error: " .. tostring(err2) .. "|r")
    end
end

local function OnEncounterStart(encounterID, encounterName)
    inEncounter = true

    -- Hide both tooltip and full panel
    if tooltipFrame then tooltipFrame:Hide() end
    if frame then frame:Hide() end

    if not autoPopupEnabled then return end

    local boss = nil

    -- Try encounterID lookup first (always clean)
    if encounterID and D.byEncounterID then
        boss = D.byEncounterID[encounterID]
    end

    -- Try encounterName (may be tainted in 12.0)
    if not boss and encounterName then
        local ok, result = pcall(FindBoss, encounterName)
        if ok and result then
            boss = result
        end
    end

    if boss then
        ShowTooltip(boss)
    end
end

local function OnEncounterEnd(encounterID, encounterName, difficultyID, groupSize, success)
    inEncounter = false

    -- Mark raid boss killed on success (any difficulty)
    local killed = (success == 1) or (success == true)
    if killed and encounterID and D.byEncounterID and D.byEncounterID[encounterID] then
        MarkBossKilled(encounterID)
    end

    -- Hide tooltip after encounter ends
    if tooltipFrame and tooltipFrame:IsShown() then
        C_Timer.After(3, function()
            if not inEncounter and tooltipFrame then
                tooltipFrame:Hide()
            end
        end)
    end
end

----------------------------------------------------------------------
-- Event handler
----------------------------------------------------------------------
local ef = CreateFrame("Frame")
ef:RegisterEvent("ADDON_LOADED")
ef:RegisterEvent("PLAYER_ENTERING_WORLD")
ef:RegisterEvent("PLAYER_TARGET_CHANGED")
ef:RegisterEvent("ENCOUNTER_START")
ef:RegisterEvent("ENCOUNTER_END")
ef:RegisterEvent("UPDATE_INSTANCE_INFO")
ef:RegisterEvent("BOSS_KILL")
ef:SetScript("OnEvent", function(_, event, arg1, arg2, arg3, arg4, arg5)
    if event == "ADDON_LOADED" and arg1 == ADDON_NAME then
        VoidCheatSheetDB = VoidCheatSheetDB or {}
        VoidCheatSheetDB.killed = VoidCheatSheetDB.killed or {}
        PurgeExpiredKills()
        if VoidCheatSheetDB.autoPopup == false then
            autoPopupEnabled = false
        end
        local count = 0
        if D.raids then for _, r in ipairs(D.raids) do count = count + #r.bosses end end
        if D.dungeons then for _, d in ipairs(D.dungeons) do count = count + #(d.bosses or d.encounters or {}) end end
        if D.delves then for _, d in ipairs(D.delves) do count = count + #(d.bosses or d.encounters or {}) end end
        local nameCount = 0
        if D.byName then for _ in pairs(D.byName) do nameCount = nameCount + 1 end end
        print(C_CYAN .. "VoidCheatSheet|r loaded — " .. count .. " encounters, " .. nameCount .. " name lookups. " .. C_DIM .. "/cs or /cheatsheet|r")
        print(C_DIM .. "  Raids: " .. (D.raids and #D.raids or 0) .. ", Dungeons: " .. (D.dungeons and #D.dungeons or 0) .. ", Delves: " .. (D.delves and #D.delves or 0) .. "|r")
        return
    end

    if event == "PLAYER_TARGET_CHANGED" then
        local ok, err = pcall(OnTargetChanged)
        if not ok then
            print(C_RED .. "[VoidCheatSheet] Target error: " .. tostring(err) .. "|r")
        end
        return
    end

    if event == "ENCOUNTER_START" then
        local ok, err = pcall(OnEncounterStart, arg1, arg2)
        if not ok then
            print(C_RED .. "[VoidCheatSheet] Encounter error: " .. tostring(err) .. "|r")
        end
        return
    end

    if event == "ENCOUNTER_END" then
        -- args: encounterID, encounterName, difficultyID, groupSize, success
        OnEncounterEnd(arg1, arg2, arg3, arg4, arg5)
        return
    end

    if event == "BOSS_KILL" then
        -- Backup signal (arg1 = encounterID on recent clients)
        if arg1 and D.byEncounterID and D.byEncounterID[arg1] then
            MarkBossKilled(arg1)
        end
        return
    end

    if event == "PLAYER_ENTERING_WORLD" or event == "UPDATE_INSTANCE_INFO" then
        if RequestRaidInfo then RequestRaidInfo() end
        -- Slight delay: PLAYER_ENTERING_WORLD often fires before lockout data is ready
        C_Timer.After(2, function()
            local ok, err = pcall(SyncKillsFromLockouts)
            if not ok then
                print(C_RED .. "[VoidCheatSheet] Lockout sync error: " .. tostring(err) .. "|r")
            end
        end)
        return
    end
end)

----------------------------------------------------------------------
-- Share to chat
----------------------------------------------------------------------
local function ShareBossToChat(boss)
    local channel = IsInRaid() and "RAID" or IsInGroup() and "PARTY" or nil
    if not channel then
        print(C_CYAN .. "VoidCheatSheet:|r Must be in a group to share.")
        return
    end

    local role = GetPlayerRole()
    SendChatMessage("[VoidCheatSheet] " .. boss.name, channel)
    SendChatMessage("TL;DR: " .. boss.tldr:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""), channel)

    if boss.bloodlust then
        SendChatMessage("Bloodlust: " .. boss.bloodlust:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""), channel)
    end

    -- Share all role tips
    for _, r in ipairs({"tank", "healer", "dps"}) do
        local tip = boss[r]
        if tip then
            SendChatMessage(ROLE_LABELS[r] .. ": " .. tip:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""), channel)
        end
    end

    print(C_CYAN .. "VoidCheatSheet:|r Shared " .. boss.name .. " to " .. channel)
end

----------------------------------------------------------------------
-- Slash commands
----------------------------------------------------------------------
SLASH_VOIDCHEATSHEET1 = "/cs"
SLASH_VOIDCHEATSHEET2 = "/cheatsheet"
SlashCmdList["VOIDCHEATSHEET"] = function(msg)
    msg = strtrim(msg):lower()

    if msg == "" then
        ShowBossList()
        return
    end

    if msg == "hide" or msg == "close" then
        if frame then frame:Hide() end
        if tooltipFrame then tooltipFrame:Hide() end
        return
    end

    if msg == "reset" then
        VoidCheatSheetDB.position = nil
        VoidCheatSheetDB.tooltipPos = nil
        VoidCheatSheetDB.size = nil
        if frame then
            frame:ClearAllPoints()
            frame:SetPoint("RIGHT", UIParent, "RIGHT", -20, 0)
            frame:SetSize(420, 500)
        end
        if tooltipFrame then
            tooltipFrame:ClearAllPoints()
            tooltipFrame:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -20, -200)
        end
        print(C_CYAN .. "VoidCheatSheet|r position/size reset.")
        return
    end

    if msg == "popup on" then
        autoPopupEnabled = true
        VoidCheatSheetDB.autoPopup = true
        print(C_CYAN .. "VoidCheatSheet:|r Auto-popup " .. C_GREEN .. "enabled|r")
        return
    end

    if msg == "popup off" then
        autoPopupEnabled = false
        VoidCheatSheetDB.autoPopup = false
        print(C_CYAN .. "VoidCheatSheet:|r Auto-popup " .. C_RED .. "disabled|r")
        return
    end

    -- /cs mark <bossname> — record current position as a boss location
    if msg:find("^mark ") then
        local bossSearch = msg:sub(6)
        local boss = FindBoss(bossSearch)
        if not boss then
            print(C_CYAN .. "VoidCheatSheet:|r Boss not found: " .. bossSearch)
            return
        end
        local mapID = C_Map.GetBestMapForUnit("player")
        if not mapID then
            print(C_RED .. "VoidCheatSheet:|r Can't get map ID.")
            return
        end
        local pos = C_Map.GetPlayerMapPosition(mapID, "player")
        if not pos then
            print(C_RED .. "VoidCheatSheet:|r Can't get position (not on a map).")
            return
        end
        local x, y = pos:GetXY()
        local instanceName = GetInstanceInfo()

        VoidCheatSheetDB.bossPositions = VoidCheatSheetDB.bossPositions or {}
        VoidCheatSheetDB.bossPositions[boss.name] = {
            mapID = mapID,
            x = x,
            y = y,
            instance = instanceName,
        }
        print(C_GREEN .. "VoidCheatSheet:|r Marked " .. C_CYAN .. boss.name .. "|r at " .. format("%.1f, %.1f", x * 100, y * 100) .. " (map " .. mapID .. ", " .. (instanceName or "?") .. ")")
        return
    end

    -- /cs marks — list all saved boss positions
    if msg == "marks" then
        VoidCheatSheetDB.bossPositions = VoidCheatSheetDB.bossPositions or {}
        local count = 0
        for name, pos in pairs(VoidCheatSheetDB.bossPositions) do
            print(C_CYAN .. name .. "|r — " .. format("%.1f, %.1f", pos.x * 100, pos.y * 100) .. " (map " .. pos.mapID .. ")")
            count = count + 1
        end
        if count == 0 then
            print(C_DIM .. "No boss positions marked. Use /cs mark <bossname> while near a boss.|r")
        end
        return
    end

    -- /cs scan — detect nearest boss by proximity and show tooltip
    if msg == "scan" then
        local mapID = C_Map.GetBestMapForUnit("player")
        if not mapID then
            print(C_CYAN .. "VoidCheatSheet:|r Can't get map position.")
            return
        end
        local pos = C_Map.GetPlayerMapPosition(mapID, "player")
        if not pos then
            print(C_CYAN .. "VoidCheatSheet:|r Can't get position on this map.")
            return
        end
        local px, py = pos:GetXY()
        local closest, closestDist, closestName = nil, 999, nil

        -- Check hardcoded + user-saved positions
        local allPositions = {}
        if D.bossPositions then
            for k, v in pairs(D.bossPositions) do allPositions[k] = v end
        end
        if VoidCheatSheetDB.bossPositions then
            for k, v in pairs(VoidCheatSheetDB.bossPositions) do allPositions[k] = v end
        end

        for bossName, bpos in pairs(allPositions) do
            if bpos.mapID == mapID then
                local dx = px - bpos.x
                local dy = py - bpos.y
                local dist = math.sqrt(dx * dx + dy * dy)
                if dist < closestDist then
                    closestDist = dist
                    closest = D.byExactName[bossName]
                    closestName = bossName
                end
            end
        end

        if closest and closestDist < 0.15 then
            print(C_CYAN .. "VoidCheatSheet:|r Nearest boss: " .. C_GREEN .. closestName .. "|r (" .. format("%.0f%%", closestDist * 100) .. " away)")
            ShowTooltip(closest)
        else
            -- No proximity match — show instance guide instead
            local instanceName = GetInstanceInfo()
            if instanceName then
                local inst, instType = FindInstance(instanceName)
                if inst then
                    print(C_CYAN .. "VoidCheatSheet:|r No boss nearby (map " .. mapID .. "). Showing instance guide.")
                    ShowInstance(inst, instType)
                    return
                end
            end
            print(C_CYAN .. "VoidCheatSheet:|r No boss positions for this map (ID: " .. mapID .. "). Use /cs mark <boss> to save positions.")
        end
        return
    end

    -- /cs killed — list bosses marked killed this week
    if msg == "killed" or msg == "locks" or msg == "lockouts" then
        PurgeExpiredKills()
        VoidCheatSheetDB.killed = VoidCheatSheetDB.killed or {}
        local count = 0
        local now = time()
        for eid, expiry in pairs(VoidCheatSheetDB.killed) do
            local boss = D.byEncounterID and D.byEncounterID[eid]
            local name = (boss and boss.name) or ("encounterID " .. tostring(eid))
            local hoursLeft = math.max(0, math.floor((expiry - now) / 3600))
            print(C_DIM .. "  ✓ |r" .. C_CYAN .. name .. "|r " .. C_DIM .. "(resets in " .. hoursLeft .. "h)|r")
            count = count + 1
        end
        if count == 0 then
            print(C_CYAN .. "VoidCheatSheet:|r No bosses marked killed this week.")
        else
            print(C_CYAN .. "VoidCheatSheet:|r " .. count .. " boss(es) killed this week. " .. C_DIM .. "/cs unkill to clear.|r")
        end
        return
    end

    -- /cs unkill — clear all killed markers
    if msg == "unkill" or msg == "clearkilled" then
        VoidCheatSheetDB.killed = {}
        print(C_CYAN .. "VoidCheatSheet:|r Cleared all killed-boss markers.")
        return
    end

    -- /cs sync — re-sync killed list from server lockout data
    if msg == "sync" then
        if RequestRaidInfo then RequestRaidInfo() end
        C_Timer.After(1, function()
            local ok, err = pcall(SyncKillsFromLockouts)
            if ok then
                print(C_CYAN .. "VoidCheatSheet:|r Synced killed bosses from lockouts.")
            else
                print(C_RED .. "VoidCheatSheet sync error: " .. tostring(err) .. "|r")
            end
        end)
        return
    end

    if msg == "share" then
        local boss = frame and frame.currentBoss
        if not boss and tooltipFrame then boss = tooltipFrame.currentBoss end
        if boss then
            ShareBossToChat(boss)
        else
            print(C_CYAN .. "VoidCheatSheet:|r No boss selected. Use /cs <boss> first.")
        end
        return
    end

    -- Check for instance name first (raids, dungeons, delves)
    local inst, instType = FindInstance(msg)
    if inst then
        ShowInstance(inst, instType)
        return
    end

    -- Then check for boss name
    local boss = FindBoss(msg)
    if boss then
        ShowBoss(boss)
    else
        print(C_CYAN .. "VoidCheatSheet:|r Not found: " .. msg)
        print(C_DIM .. "Raids: /cs voidspire, /cs dreamrift, /cs queldanas|r")
        if D.dungeons and #D.dungeons > 0 then
            local names = {}
            for _, d in ipairs(D.dungeons) do names[#names + 1] = d.name:lower():gsub("%s+", "") end
            print(C_DIM .. "Dungeons: /cs " .. table.concat(names, ", /cs ") .. "|r")
        end
        if D.delves and #D.delves > 0 then
            print(C_DIM .. "Delves: /cs delves|r")
        end
    end
end
