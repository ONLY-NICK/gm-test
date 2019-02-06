function GM:PlayerDisconnected(ply)
	ply:SetPData("LVL",ply:GetNWInt("LVL"))
	ply:SetPData("EXP",ply:GetNWInt("EXP"))
	ply:SetPData("Money",ply:GetNWInt("Money"))
end

function GM:ShutDown()
	for k, v in pairs(player.GetAll()) do
	v:SetPData("LVL",v:GetNWInt("LVL"))
	v:SetPData("EXP",v:GetNWInt("EXP"))
	v:SetPData("Money",v:GetNWInt("Money"))
	end
end