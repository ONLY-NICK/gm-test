include("shared.lua")

function ENT:Draw()
	self:DrawModel()

	local pos =  self:GetPos() + ( self:GetAngles():Up() * 3 )
	local ang = self:GetAngles()
	local value = self:GetValue()

	surface.SetFont("HudHintTextSmall")
	local Width = surface.GetTextSize(value)

	cam.Start3D2D(pos + ang:Up(), ang, 0.2)
		draw.WordBox(0, -Width * 0.5, -7, value .. " Т", "HudHintTextSmall", Color(0,0,0,200), Color(255,255,255,255) )
	cam.End3D2D()
end