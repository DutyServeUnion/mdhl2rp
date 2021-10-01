AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("hud.lua")

include("shared.lua")

function GM:PlayerSpawn(ply)
    ply:SetMaxHealth(100)
    ply:Give("weapon_physcannon")
    ply:Give("weapon_physgun")
    ply:Give("gmod_tool")
    ply:SetupHands()
end
if(string.sub( text, 1 , 4) == "/ooc") then
    return "(OOC)" .. string.sub( text, 5)
    end

end)
