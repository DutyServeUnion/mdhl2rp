if SERVER then
	util.AddNetworkString("outOfChar")
end

if CLIENT then
	net.Receive("outOfChar", function()
		local message = net.ReadString()
		chat.AddText(Color(255, 0, 0),"[OOC] ",message)
	end)
end

landis.chat.RegisterCommand("/ooc",{
	RequireAlive    = false,
	RequireArgs     = true,
	PermissionLevel = PERMISSION_LEVEL_USER,
	HelpDescription = "Talk in OOC chat.",
	onRun  = function(self,ply,args)
		if ply:IsLeadAdmin() then
			net.Start("outOfChar")
				net.WriteString(table.concat(args," "))
			net.Broadcast()
		end
	end
})