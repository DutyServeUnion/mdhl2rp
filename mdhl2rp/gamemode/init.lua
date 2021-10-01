AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("hud.lua")

include("shared.lua")

local open = false

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
function GM:PlayerCanSeePlayersChat( text , teamOnly, listener , speaker)
    local dist = listener:GetPos() :Distance ( speaker:GetPos() )

    if ( dist <= 200 ) then
            print ("People are able to listen")
        return true 
    end
    print("People cannot listen")
    return false 


end

-- this entire part is just if you want to enable VCs.

--function GM:PlayerCanHearPlayersVoice(listener, speaker)
  --  return ( listener:GetPos() :Distance ( speaker:GetPos() ) < 200
--end

function GM:OnNPCKilled(npc, attacker, inflictor)
    -- add money
    -- add exp and check for lvl up
    attacker:SetNWInt ("playerMoney", attacker:GetNWInt("playerMoney") + 100)

end

function GM:PlayerDeath(victim, inflictor, attacker)
    

    attacker:SetNWInt ("playerMoney", attacker:GetNWInt("playerMoney") + 100)

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