AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel("props_combine\Combine_Dispenser.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

    self:SetUseType(SIMPLE_USE)

    local phys = self:GetPhysicsObject()

    if (IsValid(phys)) then
        phys:Wake()
    end
end

function ENT:SpawnFunction(ply, tr, ClassName)
    if (!tr.Hit) then return end

    local SpawnPos = ply:GetShootPos() + ply:GetForward() * 80

    local ent = ents.Create(ClassName)
    ent:SetPos(SpawnPos)
    ent:Spawn()
    ent:Activate()
end

function ENT:Use(activator, caller)
    local ammoType = activator:GetActiveWeapon():GetPrimaryAmmoType()

    activator:GiveAmmo(5, ammoType, true)
end

function ENT:Think()

end

function ENT:OnTakeDamage(damage)
    self:SetHealth(self:Health() - damage:GetDamage())

    if(self:Health()) <= 0 then 
        self:Remove()
    end
end