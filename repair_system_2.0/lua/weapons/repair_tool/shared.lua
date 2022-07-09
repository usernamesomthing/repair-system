AddCSLuaFile("shared.lua")

SWEP.PrintName = "Repair Tool"
SWEP.Author = "Sharky"
SWEP.Purpose = "Used to repair equipment."
SWEP.Instructions = "Left click to start repairing."

SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.ViewModel = "models/weapons/c_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.DrawCrosshair 		= false

SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.Slot = 4
SWEP.SlotPos = 1		

SWEP.Primary.Ammo = "none"
SWEP.Primary.Damage = -50

SWEP.Secondary.Ammo = "none"


	

function SWEP:PrimaryAttack() 
	local tgt = self.Owner:GetEyeTrace()
 self:GetOwner():LagCompensation(true)
  local spos = self:GetOwner():GetShootPos()
  local sdest = spos + (self:GetOwner():GetAimVector() * 70)
  local kmins = Vector(1,1,1) * -10
  local kmaxs = Vector(1,1,1) * 10
  local tr = util.TraceHull({start=spos, endpos=sdest, filter=self:GetOwner(), mask=MASK_SHOT_HULL, mins=kmins, maxs=kmaxs})
  if not IsValid(tr.Entity) then
    tr = util.TraceLine({start=spos, endpos=sdest, filter=self:GetOwner(), mask=MASK_SHOT_HULL})
  end

local hitEnt = tr.Entity
  if IsValid(hitEnt) then
    if hitEnt:GetClass() == "electrical_panal" or hitEnt:GetClass() == "vending_machine" or hitEnt:GetClass() == "sink" or hitEnt:GetClass() == "heater" or hitEnt:GetClass() == "pipe" or hitEnt:GetClass() == "washing_machine" or hitEnt:GetClass() == "computer" or hitEnt:GetClass() == "fan" or hitEnt:GetClass() == "toliet" or hitEnt:GetClass() == "gen" or hitEnt:GetClass() == "console_machine" or hitEnt:GetClass() == "fountain" or hitEnt:GetClass() == "cel_fan" then
 	  self.Weapon:SendWeaponAnim(ACT_VM_MISSCENTER)
  self.Owner:SetAnimation(PLAYER_ATTACK1)

		local repairsoundlist = {"physics/metal/metal_box_impact_soft1.wav","physics/metal/metal_box_impact_soft2.wav","physics/metal/metal_box_impact_soft3.wav"}

	    self:EmitSound(Sound(table.Random(repairsoundlist)))


 if SERVER and tr.Hit and tr.HitNonWorld and IsValid(hitEnt) then
    local dmg = DamageInfo()
    dmg:SetDamage(self.Primary.Damage)
    dmg:SetAttacker(self:GetOwner())
    dmg:SetInflictor(self.Weapon or self)
    dmg:SetDamageForce(self:GetOwner():GetAimVector() * 25)
    dmg:SetDamagePosition(self:GetOwner():GetPos())
    dmg:SetDamageType(DMG_SLASH)

    hitEnt:DispatchTraceAttack(dmg, spos + (self:GetOwner():GetAimVector() * 3), sdest)
  end
  self:GetOwner():LagCompensation(false)
end    
end


self:SetNextPrimaryFire( CurTime() + 0.7 )
end
     
	

function SWEP:SecondaryAttack()

	end