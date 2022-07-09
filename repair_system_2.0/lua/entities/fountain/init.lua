AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )  
include( "shared.lua" )

function ENT:Initialize()
self:SetModel( "models/unioncity2/props_fastfood/soda_fountain.mdl" )
self:SetAngles(Angle(0,90,0))
self:PhysicsInit( SOLID_VPHYSICS )     
self:SetMoveType( MOVETYPE_VPHYSICS )   
self:SetSolid( SOLID_VPHYSICS )         
self:SetUseType(SIMPLE_USE)
local phys = self:GetPhysicsObject()
if (phys:IsValid()) then
phys:Wake()
end
self.repair = false
self.hitsneeded = math.random( 0,5 ) 
end


local buysodacooldown = 0

function ENT:Use(ply,activator)
	if self.repair == false then
    DarkRP.notify(ply, 1, 6, "Fountain is out of order!")
	end

if self.repair == true then
	if activator:IsPlayer() then
		if CurTime() < buysodacooldown then return DarkRP.notify(activator, 3, 6, "Fountain is Stocking!") end
   local soda = ents.Create("soda_can")
      soda:SetPos(self:GetPos()+Vector(0,40,20))
      soda:SetAngles(self:GetAngles())
      soda:Spawn()
      soda:Activate()
			buysodacooldown = CurTime() + 100


		end
	end



end

function ENT:OnTakeDamage(dmg,ply)

	 local player = dmg:GetAttacker()
	 local moneyaddedforrepair = math.random( 200,650 ) 

if( player:IsPlayer() and self.repair == false and IsValid(player:GetActiveWeapon()) and player:GetActiveWeapon():GetClass() == "repair_tool") then

if(self.hitsneeded >= 99) then return; end 
 
	self.hitsneeded = self.hitsneeded - dmg:GetDamage(); 
 
	if(self.hitsneeded >= 99) then 
		self.repair = true
			until_restore_fonte = CurTime() + 800
			DarkRP.notify(player, 3, 6, "You repaired a vending machine! You got Payed $"..moneyaddedforrepair)
			player:addMoney(moneyaddedforrepair)

end

else
end

end

local sparktime = 0
local sparks_sounds_table = {"ambient/energy/spark1.wav","ambient/energy/spark2.wav","ambient/energy/spark3.wav","ambient/energy/spark4.wav","ambient/energy/spark5.wav","ambient/energy/spark6.wav"}





function ENT:Think()




local precents = self.hitsneeded ---- it takes the hits needed and does the % formula to get precent hit

if self.repair == false then
self:SetNWBool( "repair_state_font", false )
self:SetNWString('repair_precent_fonts',precents.. "% Repaired...")
end

if self.repair == true then
self:SetNWBool( "repair_state_font", true )
end

if self.repair == true then
if CurTime() < until_restore_fonte then return end
self.hitsneeded = math.random(  0,5  )
self.repair = false
self:SetNWBool( "repair_state_font", false )
end
 

if self.hitsneeded >= 100 then
	self.hitsneeded = 0
	self.repair = true
end

if self.repair == false then
if CurTime() < sparktime then return end
self:EmitSound(Sound(table.Random(sparks_sounds_table)))
sparktime = CurTime() + 2.5
end



end 



	