----------------------------------------------------------------------
-- VoidCheatSheet — In-game raid boss cheat sheets
-- Shows mechanics, role tips, and TL;DR for current boss
-- Auto-shows on ENCOUNTER_START, manual via /cs or /cheatsheet
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

----------------------------------------------------------------------
-- Role icons
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

----------------------------------------------------------------------
-- Frame
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

    -- Resize handle (bottom-right corner)
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
        -- Save size
        local w, h = f:GetSize()
        VoidCheatSheetDB.size = { w = w, h = h }
        -- Reflow text to new width
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
-- Build cheat sheet text
----------------------------------------------------------------------
local function BuildCheatText(boss, playerRole)
    local lines = {}
    local function L(s) lines[#lines + 1] = s end

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

    -- Add Priority
    if boss.addPriority then
        L(C_CYAN .. "== ADD PRIORITY ==|r")
        L(C_WHITE .. boss.addPriority .. "|r")
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

    return table.concat(lines, "\n")
end

----------------------------------------------------------------------
-- Show cheat sheet for a boss
----------------------------------------------------------------------
local function ShowBoss(boss)
    local f = CreateCheatFrame()

    -- Detect player role
    local playerRole = "dps"
    pcall(function()
        local spec = GetSpecialization()
        if spec then
            local role = GetSpecializationRole(spec)
            if role == "TANK" then playerRole = "tank"
            elseif role == "HEALER" then playerRole = "healer"
            else playerRole = "dps" end
        end
    end)

    f.title:SetText(C_CYAN .. boss.name .. "|r")
    f.content:SetText(BuildCheatText(boss, playerRole))

    -- Update child height for scrolling
    local textHeight = f.content:GetStringHeight() or 400
    f.child:SetHeight(textHeight + 20)

    f:Show()
end

----------------------------------------------------------------------
-- Find boss by name (fuzzy)
----------------------------------------------------------------------
local function FindBoss(search)
    if not search or search == "" then return nil end
    search = search:lower():gsub("%s+", "")

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
-- Find raid by name (fuzzy)
----------------------------------------------------------------------
local function FindRaid(search)
    if not search or search == "" then return nil end
    search = search:lower()
    for _, raid in ipairs(D.raids) do
        if raid.name:lower():find(search, 1, true) then
            return raid
        end
    end
    return nil
end

----------------------------------------------------------------------
-- Show all bosses for a specific raid
----------------------------------------------------------------------
local function ShowRaid(raid)
    local f = CreateCheatFrame()

    local playerRole = "dps"
    pcall(function()
        local spec = GetSpecialization()
        if spec then
            local role = GetSpecializationRole(spec)
            if role == "TANK" then playerRole = "tank"
            elseif role == "HEALER" then playerRole = "healer"
            else playerRole = "dps" end
        end
    end)

    f.title:SetText(C_CYAN .. raid.name .. "|r")

    local lines = {}
    local function L(s) lines[#lines + 1] = s end

    for _, boss in ipairs(raid.bosses) do
        L(C_CYAN .. "==============================|r")
        L(C_CYAN .. "Boss " .. boss.order .. ": " .. boss.name .. "|r")
        L(C_CYAN .. "==============================|r")
        L("")
        L(BuildCheatText(boss, playerRole))
        L("")
        L("")
    end

    f.content:SetText(table.concat(lines, "\n"))
    local textHeight = f.content:GetStringHeight() or 400
    f.child:SetHeight(textHeight + 20)
    f:Show()
end

----------------------------------------------------------------------
-- Show boss list
----------------------------------------------------------------------
local function ShowBossList()
    local f = CreateCheatFrame()
    f.title:SetText(C_CYAN .. "VoidCheatSheet — Boss List|r")

    local lines = {}
    local function L(s) lines[#lines + 1] = s end

    L(C_GOLD .. "Click a boss below or use /cs <boss name>|r")
    L("")

    for _, raid in ipairs(D.raids) do
        L(C_CYAN .. "== " .. raid.name .. " ==|r")
        for _, boss in ipairs(raid.bosses) do
            L("  " .. C_ORANGE .. boss.order .. ". " .. boss.name .. "|r")
            L("    " .. C_DIM .. boss.tldr .. "|r")
        end
        L("")
    end

    L(C_DIM .. "Usage: /cs averzian — show specific boss|r")
    L(C_DIM .. "Usage: /cs — show this list|r")
    L(C_DIM .. "Auto-shows on boss pull if data exists.|r")

    f.content:SetText(table.concat(lines, "\n"))
    local textHeight = f.content:GetStringHeight() or 400
    f.child:SetHeight(textHeight + 20)
    f:Show()
end

----------------------------------------------------------------------
-- Auto-show on encounter start
----------------------------------------------------------------------
local ef = CreateFrame("Frame")
ef:RegisterEvent("ADDON_LOADED")
ef:SetScript("OnEvent", function(_, event, arg1, arg2)
    if event == "ADDON_LOADED" and arg1 == ADDON_NAME then
        VoidCheatSheetDB = VoidCheatSheetDB or {}
        print(C_CYAN .. "VoidCheatSheet|r loaded. " .. C_DIM .. "/cs <boss> or /cheatsheet|r")
        return
    end

    -- No auto-popup on boss pull — use /cs <boss> to read before pulling
end)

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
        return
    end

    if msg == "reset" then
        VoidCheatSheetDB.position = nil
        if frame then
            frame:ClearAllPoints()
            frame:SetPoint("RIGHT", UIParent, "RIGHT", -20, 0)
        end
        print(C_CYAN .. "VoidCheatSheet|r position reset.")
        return
    end

    -- Check for raid name first
    local raid = FindRaid(msg)
    if raid then
        ShowRaid(raid)
        return
    end

    -- Then check for boss name
    local boss = FindBoss(msg)
    if boss then
        ShowBoss(boss)
    else
        print(C_CYAN .. "VoidCheatSheet:|r Not found: " .. msg)
        print(C_DIM .. "Raids: /cs voidspire, /cs dreamrift, /cs queldanas|r")
        print(C_DIM .. "Bosses: /cs averzian, /cs vorasius, /cs salhadaar, /cs vaelgor, /cs vanguard, /cs cosmos|r")
    end
end
