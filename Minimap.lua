----------------------------------------------------------------------
-- VoidCheatSheet Minimap — standardized minimap button.
-- Global name VoidCheatSheetMinimapBtn so VoidHubBundle discovers it.
--
-- Click behavior:
--   Left  -> VoidCheatSheet_Toggle()  (opens boss list or closes panels)
--   Right -> /cs marks  (list saved boss positions in chat)
----------------------------------------------------------------------

local btn

local function PositionButton(b)
    VoidCheatSheetDB = VoidCheatSheetDB or {}
    local angle = math.rad(VoidCheatSheetDB.minimapAngle or 250)
    local radius = (Minimap:GetWidth() / 2) + 6
    b:ClearAllPoints()
    b:SetPoint("CENTER", Minimap, "CENTER", radius * math.cos(angle), radius * math.sin(angle))
end

local function CreateMinimapButton()
    if btn then return btn end
    if _G.VoidCheatSheetMinimapBtn then btn = _G.VoidCheatSheetMinimapBtn; return btn end
    if not Minimap then return end

    btn = CreateFrame("Button", "VoidCheatSheetMinimapBtn", Minimap)
    btn:SetSize(28, 28)
    btn:SetFrameStrata("MEDIUM")
    btn:SetFrameLevel((Minimap:GetFrameLevel() or 1) + 10)

    local icon = btn:CreateTexture(nil, "BACKGROUND")
    icon:SetSize(20, 20)
    icon:SetPoint("CENTER")
    icon:SetTexture("Interface\\Icons\\INV_Misc_Book_09")
    icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)

    local border = btn:CreateTexture(nil, "OVERLAY")
    border:SetSize(54, 54)
    border:SetPoint("TOPLEFT", -2, 2)
    border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")

    btn:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    btn:SetScript("OnClick", function(_, button)
        if button == "RightButton" then
            if SlashCmdList and SlashCmdList["VOIDCHEATSHEET"] then
                SlashCmdList["VOIDCHEATSHEET"]("marks")
            end
        else
            if VoidCheatSheet_Toggle then VoidCheatSheet_Toggle() end
        end
    end)

    btn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:SetText("|cff00c7ffVoidCheatSheet|r", 1, 1, 1)
        GameTooltip:AddLine("Boss & dungeon strategy notes", 0.85, 0.85, 0.85)
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine("Left-click: toggle panel", 0.85, 0.85, 0.85)
        GameTooltip:AddLine("Right-click: list saved marks", 0.85, 0.85, 0.85)
        GameTooltip:AddLine("Drag: reposition around minimap", 0.7, 0.7, 0.7)
        GameTooltip:Show()
    end)
    btn:SetScript("OnLeave", function() GameTooltip:Hide() end)

    btn:SetMovable(true)
    btn:RegisterForDrag("LeftButton")
    btn:SetScript("OnDragStart", function(self) self._dragging = true end)
    btn:SetScript("OnDragStop",  function(self) self._dragging = false end)
    btn:SetScript("OnUpdate", function(self)
        if self._dragging then
            local mx, my = Minimap:GetCenter()
            local scale = Minimap:GetEffectiveScale()
            local px, py = GetCursorPosition()
            if not mx or not px or not scale then return end
            px = px / scale; py = py / scale
            VoidCheatSheetDB = VoidCheatSheetDB or {}
            VoidCheatSheetDB.minimapAngle = math.deg(math.atan2(py - my, px - mx))
            PositionButton(self)
        end
    end)

    PositionButton(btn)
    return btn
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
    CreateMinimapButton()
    VoidCheatSheetDB = VoidCheatSheetDB or {}
    if btn and VoidCheatSheetDB.minimapHidden then btn:Hide() end
end)
