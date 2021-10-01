function hud()
    local client = LocalPlayer()

    if !client:Alive() then
        return 
    end

    draw.RoundedBox(0, 0, ScrH() - 100, 250, 100, Color(50, 50, 50, 230))
-- Health stuff
    draw.SimpleText("Health: "..client:Health(), "DermaDefaultBold", 10, ScrH() - 90, Color(255, 255, 255, 255), 0, 0)
    draw.RoundedBox(0, 10, ScrH() - 75, 100 * 2.25, 15, Color(160,8,8))
    draw.RoundedBox(0, 10, ScrH() -75, math.Clamp(client:Health(), 0, 100) * 2.25, 15, Color(235,10,10))
    draw.RoundedBox(0, 10, ScrH() - 75, math.Clamp(client:Health(), 0, 100) * 2.25, 5, Color(255, 0, 0))
-- Armor Stuff
    draw.SimpleText("Armor: "..client:Armor(), "DermaDefaultBold", 10, ScrH() - 60, Color(255, 255, 255, 255), 0, 0)
    draw.RoundedBox(0, 10, ScrH() - 40, 100 * 2.25, 15, Color(0,26,255))
    draw.RoundedBox(0, 10, ScrH() -40, math.Clamp(client:Armor(), 0, 100) * 2.25, 15, Color(0,119,255, 255))
    draw.RoundedBox(0, 10, ScrH() - 40, math.Clamp(client:Armor(), 0, 100) * 2.25, 5, Color(0, 150, 255))

    --Ammo stuff--
    draw.RoundedBox(0, 255, ScrH() - 70, 125, 70, Color(30,30,30, 230))

    if (client:GetActiveWeapon():GetPrintName() != nil) then
        draw.SimpleText(client:GetActiveWeapon():GetPrintName(), "DermaDefaultBold", 260, ScrH() - 60, Color(255,255,255, 255), 0, 0)
    end
    if (client:GetActiveWeapon():Clip1() != -1) then
        draw.SimpleText("Ammo: " .. client:GetActiveWeapon():Clip1() .. "/" .. client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType()), "DermaDefaultBold", 260, ScrH() - 40, Color(255, 255, 255, 255), 0, 0)
    else
        draw.SimpleText("Ammo: " .. client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType()), "DermaDefaultBold", 260, ScrH() - 40, Color(255, 255, 255), 0, 0)
    end

    if (client:GetAmmoCount(client:GetActiveWeapon():GetSecondaryAmmoType()) > 0) then
        draw.SimpleText("Secondary: " .. client:GetAmmoCount(client:GetActiveWeapon():GetSecondaryAmmoType()), "DermaDefaultBold", 260, ScrH() - 25, Color(255, 255, 255, 255), 0, 0)
    end

end
hook.Add("HUDPaint", "TestHud", hud)

function HideHud(name)
    for k, v in pairs({"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo"}) do 
        if name == v then
            return false
        end
    end
end
hook.Add("HUDShouldDraw", "HideDefaultHud", HideHud)

