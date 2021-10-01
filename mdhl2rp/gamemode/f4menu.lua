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
        end
    end

    if (net.ReadBit() == 0) then
        Menu:Hide()
        gui.EnableScreenClicker(false)
    else
        Menu:Show()
        gui.EnableScreenClicker(true)
    end
end)