include("shared.lua")

	surface.CreateFont( "Repair_font", {
    font = "Roboto",
    size = 50,
    weight = 650,
    shadow = true,
    antialias = false,
});










function ENT:Draw()
	self:DrawModel()

  local lp = LocalPlayer()
if (self:GetPos():DistToSqr(lp:GetPos()) > 300*300) then return end
 if RPExtraTeams[lp:Team()].name ~= "Technician" then return end

	local Pos = self:GetPos()
	local Ang = Angle( 0, 0, 12)
if self:GetNWBool( "repair_state_elec_pan") == false then

	Ang:RotateAroundAxis(Ang:Forward(), 90)
	local TextAng = Ang
	TextAng:RotateAroundAxis(TextAng:Right(), -90)
	cam.Start3D2D(Pos + Ang:Right() * -40, Angle(0, LocalPlayer():EyeAngles().y-90, 90), 0.1)
		draw.WordBox(.9, -50, 0, self:GetNWString('repair_precent_elec_pan'), "Repair_font", Color(0, 0, 0, 155), Color(255,255,255,255))
	cam.End3D2D()
end
end




function ENT:ShowSparks()
if self:GetNWBool( "repair_state_elec_pan") == false then
  local effectdata = EffectData()
  effectdata:SetOrigin(self:GetPos())
  effectdata:SetMagnitude(1)
  effectdata:SetScale(1)
  effectdata:SetRadius(1)
  util.Effect("Sparks", effectdata)
end
end



function ENT:Think()

    self:ShowSparks()
  
  self:SetNextClientThink( CurTime() + 0.5 )
  return true
end