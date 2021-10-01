AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("hud.lua")

function GM:PlayerinitialSpawn(ply)
    if(ply:GetNWInt("plyLvl") <=0) then
        ply:SetNWint("playLvl", 1)
    end
end
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


    attacker:SetNWint("playerExp", attacker:GetNWInt) + 100)
    attacker:SetNWInt("plaerLvl", attacker:GetNWInt) +1)
end

function GM:PlayerDeath(victim, inflictor, attacker)
    

    attacker:SetNWInt ("playerMoney", attacker:GetNWInt("playerMoney") + 100)

    attacker:SetNWint("playerExp", attacker:GetNWInt("playerExp") +100)
    attacker:SetNWint("playeLvl") attacker:GetNWInt(playerLvL) + 1)
end