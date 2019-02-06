function GM:PlayerSpawn(ply)
	ply:SetGravity(0.80)
	ply:SetMaxHealth(100)
	ply:SetRunSpeed(300)
	ply:SetWalkSpeed(200)
	ply:Give("weapon_physcannon")
	ply:Give("weapon_physgun")
	ply:Give("gmod_tool")
	ply:SetupHands()
end

function GM:PlayerInitialSpawn(ply)
	ply:SendLua("local tab = {Color(155,255,155), [[Игрок "..ply:Nick().." использует новый гейммод!]] } chat.AddText(unpack(tab))")

	if (ply:GetPData("LVL")==nil) then
		ply:SetNWInt("LVL",1)
	else
		ply:SetNWInt("LVL",ply:GetPData("LVL"))
	end

	if (ply:GetPData("EXP")==nil) then
		ply:SetNWInt("EXP",1)
	else
		ply:SetNWInt("EXP",ply:GetPData("EXP"))
	end

	if (ply:GetPData("Money")==nil) then
		ply:SetNWInt("Money",1)
	else
		ply:SetNWInt("Money",ply:GetPData("Money"))
	end
end

function GM:PlayerDeath(victim, attacker, inflictor)
	victim:SendLua("local tab = {Color(155,255,155), [[Игрок "..victim:Nick().." погиб!]] } chat.AddText(unpack(tab))")
end