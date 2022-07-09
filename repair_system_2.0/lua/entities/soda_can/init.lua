AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" ) --- includes diffrent files included with this entity

function ENT:Initialize() --- function that gives physics, model, and basic options
self.Entity:SetModel( "models/props_junk/popcan01a.mdl" )
self.Entity:PhysicsInit( SOLID_VPHYSICS )     
self.Entity:SetMoveType( MOVETYPE_VPHYSICS )   
self.Entity:SetSolid( SOLID_VPHYSICS )
self.Entity:DrawShadow(false)  --- makes shawdows with the entity false to save preformence        
self.Entity:SetUseType(SIMPLE_USE)
local phys = self.Entity:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end
end

function ENT:Use(ply) --- use function on use then do this
	self:EmitSound( "player/pl_drown1.wav" )
	ply:ChatPrint( "You drank a cold soda!" )
	self:Remove()
end






