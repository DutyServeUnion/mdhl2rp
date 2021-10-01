include("shared.lua")
include("hud.lua")

Hook.Add("OnPlayerChat", "UNIQUEIDENT" , function( ply, atr , bteam, bdead))

  if (str = "/print") then
    print("HEYYYY")
    return true
  end 
