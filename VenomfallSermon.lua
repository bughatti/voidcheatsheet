----------------------------------------------------------------------
-- VenomfallSermon — memory-game pad for Azta'rec's "Sermon of Ula'tek"
-- (Venomfall Deeps nemesis).
--
-- Drop four world markers before the pull, always the same way: Diamond
-- in the door quadrant, then around to the left: X, Star, Circle. Each
-- warned wave, tap the marker that is SAFE (click or keybind).
--
-- Timing comes from the boss himself (verified against the combat log):
--   * Sermon of Ula'tek is a CHANNEL on boss1 -> new Sermon, start recording.
--   * The blind repeat starts exactly 3.5s x waves after the channel starts,
--     one "Echo of Ula'tek" cast per wave (lands 3.0s in, one every 3.26s).
--     The whole replay is scheduled from the channel start: each marker shows
--     big, mid-screen, pulsing, with the next one small beside it, and a
--     click sound on every switch. No text to read mid-run.
-- spellIDs are secret in 12.x, but the cast/channel events still fire.
--
--   Marker L-click / key : record safe marker
--   Marker R-click       : undo last recorded wave
--   Alt+drag             : move        Minimap Shift+click : show/test
----------------------------------------------------------------------
if (select(4, GetBuildInfo()) or 0) < 100000 then return end -- retail only

local BTN      = 34
local GAP      = 4
local BIG      = 110      -- the centre-screen "run here" icon
local FONT     = STANDARD_TEXT_FONT

-- Door first, then around to the left. Values = raid target icon index.
local QUADS = { "DOOR", "LEFT", "FAR", "RIGHT" }
local ICON  = { DOOR = 3, LEFT = 7, FAR = 1, RIGHT = 2 }   -- Diamond, X, Star, Circle
local WAVES = { 3, 4, 5 }   -- warned waves in Sermon 1, 2, 3

local function IconTex(q) return "Interface\\TargetingFrame\\UI-RaidTargetingIcon_" .. ICON[q] end
local function Inline(q, size) return "|T" .. IconTex(q) .. ":" .. size .. ":" .. size .. "|t" end

local seq, mode, step = {}, "rec", 0   -- mode: "rec" | "go" | "done"
local sermon = 0                       -- current Sermon of this pull (1..3)
local inEncounter = false
local simToken = 0
local armed = false                    -- a Sermon (or dry run) is waiting for its Echoes
local pad, buttons, strip, counter
local big, bigTex, nextTex
local testShown = false

local function sec(v) return issecretvalue and issecretvalue(v) end
local function InVenomfall()
    local name = GetInstanceInfo()
    if sec(name) or type(name) ~= "string" then return false end
    return name:find("Venomfall", 1, true) ~= nil
end

local function Paint()
    if not pad then return end
    local target = (mode == "go") and seq[step] or nil
    for _, q in ipairs(QUADS) do
        local b = buttons[q]
        b.icon:SetAlpha((mode == "go" and q ~= target) and 0.35 or 1)
        b.glow:SetShown(q == target)
    end
    local parts = {}
    for i, s in ipairs(seq) do
        parts[#parts + 1] = (mode == "go" and i < step) and "|cFF555555-|r" or Inline(s, 16)
    end
    strip:SetText(table.concat(parts, " "))
    counter:SetText((mode == "go" and "|cFFFFD100" or "|cFFFF4444") .. #seq .. "|r")

    if target then
        bigTex:SetTexture(IconTex(target))
        local nxt = seq[step + 1]
        if nxt then nextTex:SetTexture(IconTex(nxt)); nextTex:Show() else nextTex:Hide() end
        big:Show()
    else
        big:Hide()
    end
end


----------------------------------------------------------------------
-- Timing (combat log, 5 Sermons across 3 pulls, all within 0.01s):
--   Echo #1 starts exactly WAVE x N seconds after the Sermon channel starts
--   (N = warned waves: 3, 4, 5). Echo i starts ECHO_GAP after Echo i-1 and
--   lands ECHO_LAND into its cast. So the whole replay is known the moment
--   the Sermon starts; nothing waits on later events.
----------------------------------------------------------------------
local WAVE       = 3.5
local ECHO_GAP   = 3.26
local ECHO_LAND  = 3.0
local sermonT0   = nil   -- GetTime() the Sermon channel started

local function Waves() return math.max(WAVES[math.min(math.max(sermon, 1), #WAVES)], #seq) end
local function EchoOne() return sermonT0 and (sermonT0 + WAVE * Waves()) end

-- Which replay step is live right now: marker i from Echo i's start until it
-- lands, then straight on to i+1 (which is already casting).
local function StepAt(now)
    local t1 = EchoOne()
    if not t1 or now < t1 then return 0 end
    local k = now - t1
    if k < ECHO_LAND then return 1 end
    return 2 + math.floor((k - ECHO_LAND) / ECHO_GAP)
end

-- Boss started a Sermon channel: fresh recording, start the clock.
local function OnSermonStart()
    if armed and mode == "rec" then return end
    wipe(seq); mode, step = "rec", 0
    sermon = sermon + 1
    simToken = simToken + 1
    armed = true
    sermonT0 = GetTime()
    Paint()
end

-- A boss cast near the predicted Echo #1 pins the clock to the real thing.
local function OnEchoStart()
    local t1 = EchoOne()
    if armed and t1 and math.abs(GetTime() - t1) < 1.5 then
        sermonT0 = sermonT0 + (GetTime() - t1)
    end
end

local function Tick()
    if not armed and mode ~= "go" then return end
    local i = StepAt(GetTime())
    if i == 0 then return end
    if #seq == 0 then armed = false; return end
    if i > #seq then
        mode, armed = "done", false
        if not inEncounter then sermon = sermon + 1 end   -- dry run: next one is longer
        Paint()
    elseif i ~= step then
        if mode ~= "go" then
            mode = "go"
            PlaySound(SOUNDKIT and SOUNDKIT.RAID_WARNING or 8959)
        else
            PlaySound(SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or 856)
        end
        step = i
        Paint()
    end
end

local function Reset()
    wipe(seq); mode, step = "rec", 0
    simToken = simToken + 1
    armed, sermonT0 = false, nil
    Paint()
end

local function Press(q, button)
    if not ICON[q] then return end
    if button == "RightButton" then
        if mode == "rec" then table.remove(seq); Paint() end
        return
    end
    if mode == "done" then wipe(seq); mode, step = "rec", 0 end   -- next Sermon
    if mode ~= "rec" then return end
    -- Dry run (no boss): pretend the Sermon started half a wave before the
    -- first tap, so the replay lands on the same clock as the real fight.
    if not inEncounter and not armed then
        armed = true
        sermonT0 = GetTime() - WAVE / 2
        if sermon < 1 then sermon = 1 end
    end
    seq[#seq + 1] = q
    PlaySound(SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or 856)
    Paint()
end

-- Keybinds (Bindings.xml): one tap while running, no mouse aiming.
function VoidCheatSheet_SermonKey(q)
    if not (pad and pad:IsShown()) then return end
    if q == "RESET" then Reset() return end
    if q == "HUB" then return end   -- replay is automatic now
    Press(q, "LeftButton")
end

BINDING_HEADER_VOIDCHEATSHEET = "VoidCheatSheet"
BINDING_NAME_VOIDCS_SERMON_DOOR  = "Sermon: Diamond (door)"
BINDING_NAME_VOIDCS_SERMON_LEFT  = "Sermon: X (left)"
BINDING_NAME_VOIDCS_SERMON_FAR   = "Sermon: Star (far wall)"
BINDING_NAME_VOIDCS_SERMON_RIGHT = "Sermon: Circle (right)"
BINDING_NAME_VOIDCS_SERMON_GO    = "Sermon: (unused, replay is automatic)"
BINDING_NAME_VOIDCS_SERMON_RESET = "Sermon: Reset this Sermon"

local function StartDrag() if IsAltKeyDown() then pad:StartMoving() end end
local function StopDrag()
    pad:StopMovingOrSizing()
    local point, _, relPoint, x, y = pad:GetPoint()
    VoidCheatSheetDB.sermonPos = { point = point, relPoint = relPoint, x = x, y = y }
end

local function CreateBig()
    big = CreateFrame("Frame", nil, UIParent)
    big:SetSize(BIG, BIG)
    big:SetPoint("CENTER", UIParent, "CENTER", 0, 140)
    big:SetFrameStrata("HIGH")
    big:EnableMouse(false)
    bigTex = big:CreateTexture(nil, "OVERLAY")
    bigTex:SetAllPoints()
    nextTex = big:CreateTexture(nil, "OVERLAY")
    nextTex:SetSize(BIG * 0.4, BIG * 0.4)
    nextTex:SetPoint("LEFT", big, "RIGHT", 10, 0)
    nextTex:SetAlpha(0.5)
    big:Hide()
    big:SetScript("OnUpdate", function()
        bigTex:SetAlpha(0.45 + 0.55 * math.abs(math.sin(GetTime() * 4)))
    end)
end

local function Create()
    if pad then return pad end
    CreateBig()
    local width = BTN * 4 + GAP * 3
    pad = CreateFrame("Frame", "VoidCheatSheetSermonPad", UIParent, "BackdropTemplate")
    pad:SetSize(width + 12, BTN + 36)
    pad:SetFrameStrata("HIGH")
    pad:SetClampedToScreen(true)
    pad:SetMovable(true)
    pad:EnableMouse(true)
    pad:RegisterForDrag("LeftButton")
    pad:SetScript("OnDragStart", StartDrag)
    pad:SetScript("OnDragStop", StopDrag)
    pad:SetBackdrop({ bgFile = "Interface\\Buttons\\WHITE8X8", edgeFile = "Interface\\Buttons\\WHITE8X8", edgeSize = 1 })
    pad:SetBackdropColor(0, 0, 0, 0.2)
    pad:SetBackdropBorderColor(0, 0.78, 1, 0.2)
    local p = VoidCheatSheetDB.sermonPos
    if p then
        pad:SetPoint(p.point, UIParent, p.relPoint, p.x, p.y)
    else
        pad:SetPoint("CENTER", UIParent, "CENTER", 260, -60)
    end

    -- Recorded order (small icons) + tap counter.
    strip = pad:CreateFontString(nil, "OVERLAY")
    strip:SetFont(FONT, 12, "OUTLINE")
    strip:SetPoint("TOPLEFT", 6, -5)
    counter = pad:CreateFontString(nil, "OVERLAY")
    counter:SetFont(FONT, 12, "OUTLINE")
    counter:SetPoint("TOPRIGHT", -6, -6)

    buttons = {}
    for i, q in ipairs(QUADS) do
        local b = CreateFrame("Button", nil, pad)
        b:SetSize(BTN, BTN)
        b:SetPoint("BOTTOMLEFT", pad, "BOTTOMLEFT", 6 + (i - 1) * (BTN + GAP), 6)
        b:RegisterForClicks("LeftButtonUp", "RightButtonUp")
        b:RegisterForDrag("LeftButton")
        b:SetScript("OnDragStart", StartDrag)
        b:SetScript("OnDragStop", StopDrag)
        b:SetScript("OnClick", function(_, button) Press(q, button) end)
        b.icon = b:CreateTexture(nil, "ARTWORK")
        b.icon:SetAllPoints()
        b.icon:SetTexture(IconTex(q))
        b.glow = b:CreateTexture(nil, "BACKGROUND")
        b.glow:SetPoint("TOPLEFT", -3, 3)
        b.glow:SetPoint("BOTTOMRIGHT", 3, -3)
        b.glow:SetColorTexture(1, 0.82, 0.1, 0.8)
        b.glow:Hide()
        local hl = b:CreateTexture(nil, "HIGHLIGHT")
        hl:SetAllPoints()
        hl:SetColorTexture(1, 1, 1, 0.15)
        buttons[q] = b
    end

    -- The replay clock runs whenever the pad is up.
    pad:SetScript("OnUpdate", Tick)

    pad:Hide()
    Paint()
    return pad
end

local boss = CreateFrame("Frame")
boss:SetScript("OnEvent", function(_, event)
    if not pad then return end
    if event == "UNIT_SPELLCAST_CHANNEL_START" then
        OnSermonStart()
    elseif event == "UNIT_SPELLCAST_START" then
        OnEchoStart()
    end
end)

local function Refresh()
    local inVF = InVenomfall()
    local want = testShown or inVF
    if want then Create():Show() elseif pad then pad:Hide(); big:Hide() end
    if inVF then
        boss:RegisterUnitEvent("UNIT_SPELLCAST_CHANNEL_START", "boss1")
        boss:RegisterUnitEvent("UNIT_SPELLCAST_START", "boss1")
    else
        boss:UnregisterAllEvents()
    end
end

-- Minimap Shift+click: show the pad anywhere to dry-run it (3, 4, 5 taps).
function VoidCheatSheet_ToggleSermonWheel()
    testShown = not (pad and pad:IsShown())
    if testShown then sermon = 0 end
    Refresh()
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("ZONE_CHANGED_NEW_AREA")
f:RegisterEvent("ENCOUNTER_START")
f:RegisterEvent("ENCOUNTER_END")
f:SetScript("OnEvent", function(_, event)
    VoidCheatSheetDB = VoidCheatSheetDB or {}
    if event == "ENCOUNTER_START" or event == "ENCOUNTER_END" then
        -- New pull (or wipe/kill): nothing recorded, Sermon count back to 0.
        inEncounter = (event == "ENCOUNTER_START")
        sermon = 0
        if pad then Reset() end
        return
    end
    VoidCheatSheetDB.vfRec = nil     -- retired passive recorder data
    VoidCheatSheetDB.sermonLog = nil -- retired debug trail
    Refresh()
end)
