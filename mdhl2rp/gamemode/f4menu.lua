local Menu

net.Receive("F4Menu", function()
    if (Menu == nil) then
        Menu = vgui.Create("DFrame")
        Menu:SetSize(700,700)
        Menu:SetPos(ScrW() / 2 - 250, ScrH() / 2 -250)
        Menu:SetTitle("Roleplay Menu")
        Menu:SetDraggable(true)
        Menu:ShowCloseButton(false)
        Menu:SetDeleteOnClose(false)
        Menu.Paint = function()
            surface.SetDrawColor(60, 60, 60, 255)
            surface.DrawRect(0, 0, Menu:GetWide(), Menu:GetTall())

            surface.SetDrawColor(40,40,40,255)
            surface.DrawRect(0,24, Menu:GetWide(), 1)
        end
    end 

    addButtons(Menu)

    if (net.ReadBit() == 0) then
        Menu:Hide()
        gui.EnableScreenClicker(false)
    else
        Menu:Show()
        gui.EnableScreenClicker(true)
    end
end)

function addButtons(Menu)
    local button = vgui.Create("DButton")
    button:SetParent(Menu)
    button:SetText("")
    button:SetSize(100,100)
    button:SetPos(0,25)
    button.Paint = function()
        surface.SetDrawColor(50, 50, 50, 255)
        surface.DrawRect(0,0, button:GetWide(), button:GetTall())

        surface.SetDrawColor(40,40,40,255)
        surface.DrawRect(0, 49, button:GetWide(), 1)
        surface.DrawRect(99, 0, 1, button:GetTall())

        draw.DrawText("Jobs", "DermaDefaultBold", button:GetWide() / 2, 17, Color(255,255,255, 255), 1)
    end

    local button2 = vgui.Create("DButton")
    button2:SetParent(Menu)
    button2:SetText("")
    button2:SetSize(100,50)
    button2:SetPos(0,85)
    button2.Paint = function()
        surface.SetDrawColor(50, 50, 50, 255)
        surface.DrawRect(0,0, button2:GetWide(), button2:GetTall())

        surface.SetDrawColor(40,40,40,255)
        surface.DrawRect(0, 49, button2:GetWide(), 1)
        surface.DrawRect(99, 0, 1, button2:GetTall())

        draw.DrawText("Rules", "DermaDefaultBold", button2:GetWide() / 2, 17, Color(255,255,255, 255), 1)
    end
end

function GM:RulesTab()
	local RulesTab = vgui.Create("DPanelList")
	RulesTab:EnableVerticalScrollbar( true )
	function RulesTab:Update()
		self:Clear(true)
	end
local html = vgui.Create( "HTML", RulesTab )
html:Dock( FILL )
html:OpenURL( "https://docs.google.com/document/d/1CxHzwQjKFr6AKQOxJhLtcM5k5sVMSlvoaL2FbYuF9AM" )


	RulesTab:Update()
	return RulesTab
end

