/*
** Badges is a sub-section of the Scoreboard system, it allows certain icons to appear for users that qualify.
*/

-- Please, do not edit these as they are for people who have contributed to the gamemode, they deserve credit!!!

landis.Badges = {}

local 

local devs = {
	["STEAM_0:1:513516857"] = true -- minty
}

local testers = {
	["INSERT STEAMID"] = true, 
	["INSERT STEAMID"] = true, 
	["INSERT STEAMID"] = true, 
	["INSERT STEAMID"] = true,
	["INSERT STEAMID"] = true 
}

local smilers = {
	["INSERT STEAMID"] = true, -- nick
	["INSERT STEAMID"] = true  -- idiot swift
}

landis.Badges.Data = {
	{
		icon = "icon16/cog.png",
		desc = "This user is a developer",
		userTest = function(ply)
			return devs[ply:SteamID()]
		end
	},
	{
		icon = "icon16/shield.png",
		desc = "This user is an admin.",
		userTest = function(ply)
			return ply:IsAdmin() and not ply:IsSuperAdmin()
		end
	},
	{
		icon = "icon16/shield_add.png",
		desc = "This user is a super admin.",
		userTest = function(ply)
			return ply:IsSuperAdmin()
		end
	},
	{
		icon = "icon16/bug.png",
		desc = "This user has found critical bugs or helped test the gamemode a lot.",
		userTest = function(ply)
			return testers[ply:SteamID()]
		end
	},
	{
		icon = "materials/badges/smile.png",
		desc = "                 :)                 ",
		userTest = function(ply)
			return smilers[ply:SteamID()]
		end
	}
}
