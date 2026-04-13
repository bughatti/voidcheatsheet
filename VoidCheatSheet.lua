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

    -- Title
    local title = f:CreateFontString(nil, "OVERLAY")
    title:SetFont(FONT, 14, "OUTLINE")
    title:SetPoint("TOPLEFT", 12, -8)
    title:SetTextColor(0, 0.78, 1)
    f.title = title

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
    f:SetPoint("TOP", UIParent, "TOP", 300, -80)
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

    -- Title
    local title = f:CreateFontString(nil, "OVERLAY")
    title:SetFont(FONT, 12, "OUTLINE")
    title:SetPoint("TOPLEFT", 8, -6)
    title:SetTextColor(0, 0.78, 1)
    f.title = title

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

    f.title:SetText(typeTag .. C_CYAN .. boss.name .. "|r")

    -- Build compact body: TL;DR + role tip
    local lines = {}
    lines[#lines + 1] = C_GOLD .. "TL;DR:|r " .. C_WHITE .. boss.tldr .. "|r"
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
    local f = CreateCheatFrame()
    local playerRole = GetPlayerRole()

    f.currentBoss = boss
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
-- Show all bosses for an instance (raid, dungeon, or delve)
----------------------------------------------------------------------
local function ShowInstance(inst, instType)
    local f = CreateCheatFrame()
    local playerRole = GetPlayerRole()

    local typeTag = ""
    if instType == "dungeon" then
        typeTag = C_ORANGE .. "[M+] " .. "|r"
    elseif instType == "delve" then
        typeTag = C_PURPLE .. "[Delve] " .. "|r"
    end

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
        for _, boss in ipairs(bossList) do
            L(C_CYAN .. "==============================|r")
            L(C_CYAN .. "Boss " .. (boss.order or "") .. ": " .. boss.name .. "|r")
            L(C_CYAN .. "==============================|r")
            L("")
            L(BuildCheatText(boss, playerRole))
            L("")
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
    f.title:SetText(C_CYAN .. "VoidCheatSheet — Content Guide|r")
    f.currentBoss = nil

    local lines = {}
    local function L(s) lines[#lines + 1] = s end

    L(C_GOLD .. "Use /cs <name> to view details|r")
    L("")

    -- Raids
    if D.raids and #D.raids > 0 then
        L(C_RED .. "== RAIDS ==|r")
        for _, raid in ipairs(D.raids) do
            L(C_CYAN .. "  " .. raid.name .. "|r")
            for _, boss in ipairs(raid.bosses) do
                L("    " .. C_ORANGE .. boss.order .. ". " .. boss.name .. "|r")
                L("      " .. C_DIM .. boss.tldr .. "|r")
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

    -- Method 2: Zone-based detection (for instanced content where names are tainted)
    if not boss then
        local instanceName = GetInstanceInfo()
        if instanceName and D.byInstanceBoss then
            -- In a known instance — check if target is elite/boss type
            local classification = UnitClassification(unit) or ""
            local ok2, isElite = pcall(function()
                return classification == "elite" or classification == "boss"
                    or classification == "worldboss" or classification == "rareelite"
            end)
            if ok2 and isElite then
                local instBosses = D.byInstanceBoss[instanceName]
                if instBosses and #instBosses > 0 then
                    -- Show the first boss in the instance as the tooltip
                    -- User can click to see full instance panel
                    boss = instBosses[1]
                end
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

    -- Hide tooltip if showing
    if tooltipFrame then tooltipFrame:Hide() end

    -- Try to find this boss and show full panel
    if autoPopupEnabled and encounterName then
        local boss = FindBoss(encounterName)
        if boss then
            ShowBoss(boss)
        end
    end
end

local function OnEncounterEnd()
    inEncounter = false
    -- Auto-hide the full panel after encounter ends
    if frame and frame:IsShown() then
        C_Timer.After(5, function()
            if not inEncounter and frame and frame:IsShown() then
                -- Don't auto-hide if user manually opened it
            end
        end)
    end
end

----------------------------------------------------------------------
-- Event handler
----------------------------------------------------------------------
local ef = CreateFrame("Frame")
ef:RegisterEvent("ADDON_LOADED")
ef:RegisterEvent("PLAYER_TARGET_CHANGED")
ef:RegisterEvent("ENCOUNTER_START")
ef:RegisterEvent("ENCOUNTER_END")
ef:SetScript("OnEvent", function(_, event, arg1, arg2, arg3, arg4, arg5)
    if event == "ADDON_LOADED" and arg1 == ADDON_NAME then
        VoidCheatSheetDB = VoidCheatSheetDB or {}
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
        OnEncounterStart(arg1, arg2)
        return
    end

    if event == "ENCOUNTER_END" then
        OnEncounterEnd()
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
            tooltipFrame:SetPoint("TOP", UIParent, "TOP", 300, -80)
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
