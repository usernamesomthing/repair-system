AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )

function ENT:Initialize()
self:SetModel( "models/props_c17/FurnitureSink001a.mdl" )
self:PhysicsInit( SOLID_VPHYSICS )     
self:SetMoveType( MOVETYPE_VPHYSICS )   
self:SetSolid( SOLID_VPHYSICS )         
self:SetUseType(SIMPLE_USE)
local phys = self:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end
self.repair = false
self.hitsneeded = math.random( 0,15 ) 
end


function ENT:OnTakeDamage(dmg,ply)

	 local player = dmg:GetAttacker()
	 local moneyaddedforrepair = math.random( 200,500 ) 

if( player:IsPlayer() and self.repair == false and IsValid(player:GetActiveWeapon()) and player:GetActiveWeapon():GetClass() == "repair_tool") then

if(self.hitsneeded >= 99) then return; end 
 
	self.hitsneeded = self.hitsneeded - dmg:GetDamage(); 
 
	if(self.hitsneeded >= 99) then 
		self.repair = true
			until_restore_sink = CurTime() + 480
			DarkRP.notify(player, 3, 6, "You repaired a sink! You got Payed $"..moneyaddedforrepair)
			player:addMoney(moneyaddedforrepair)

end

else
end

end




function ENT:Think()




local precents = self.hitsneeded ---- it takes the hits needed and does the % formula to get precent hit

if self.repair == false then
self:SetNWBool( "repair_state_sink", false )
self:SetNWString('repair_precent_sink',precents.. "% Repaired...")
end

if self.repair == true then
self:SetNWBool( "repair_state_sink", true )
end

if self.repair == true then
if CurTime() < until_restore_sink then return end
self.hitsneeded = math.random(  0,15  )
self.repair = false
self:SetNWBool( "repair_state_sink", false )
end
 

if self.hitsneeded >= 100 then
	self.hitsneeded = 0
	self.repair = true
end





end 



	