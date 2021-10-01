local Menu

net.Receive("F4Menu", function()
    if (Menu == nil) then
        Menu = vgui.Create("DFrame")
        Menu:SetSize(500,500)
        Menu:SetPos(ScrW() / 2 - 250, ScrH() / 2 - 250)
        Menu:SetTitle("Roleplay Menu")
        Menu:SetDraggable(true)
        Menu:ShowCloseButton(false)
        Menu:SetDeleteOnClose(false)
        Menu.Paint = function()
            surface.SetDrawColor(60, 60, 60, 255)
            surface.DrawRect(0, 0, Menu:GetWide(), Menu:GetTall())

            surface.SetDrawColor(40, 40, 40, 255)
            surface.DrawRect(0,24,Menu:GetWide(), 1)
        end
    end

    addButtons()

    if (net.ReadBit() == 0) then
        Menu:Hide()
        gui.EnableScreenClicker(false)
    else
        Menu:Show()
        gui.EnableScreenClicker(true)
    end
end)

function addButtons(Menu)
    local playerButton = vgui.Create("DButton")
    playerButton:SetParent(Menu)
    playerButton:SetText("")
    playerButton:SetSize(100,50)
    playerButton:SetPos(0,25)
    playerButton.Paint = function()
        --Color of entire button
        surface.SetDrawColor(50,50,50,255)
        surface.DrawRect(0,0,playerButton:GetWide(), playerButton():GetTall())

        --Draw Bottom and right borders
        surface.SetDrawColor(40,40,40,255)
        surface.DrawRect(0, 49, playerButton():GetWide(), 1)
        surface.DrawRect(99, 0, 1, playerButton():GetTall())
        -- Draw Text
        draw.DrawText("Player","DermaDefaultBold",playerButton():GetWide() / 2, 17, Color(255,255,255,255), 1)
    end
end