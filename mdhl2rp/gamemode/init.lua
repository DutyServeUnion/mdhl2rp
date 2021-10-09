AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("hud.lua")
AddCSLuaFile("f4menu.lua")

include("shared.lua")


function GM:PlayerSpawn(ply)
    ply:SetMaxHealth(100)
    ply:Give("weapon_physcannon")
    ply:Give("weapon_physgun")
    ply:Give("gmod_tool")
    ply:SetupHands()
end

util.AddNetworkString("F4Menu")
function GM:ShowSpare2(ply)
   if (open == false) then
       open = true
   else
    open = false 
   end
   
    net.Start("F4Menu")
    net.WriteBit(open)
    net.Broadcast()
end