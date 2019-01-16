AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("hud.lua")

include("shared.lua")

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

function GM:OnNPCKilled(npc, attacker, inflictor)
	attacker:SetNWInt("Money",attacker:GetNWInt("money") + 100)
	attacker:SetNWInt("EXP",attacker:GetNWInt("EXP") + 100)

	LevelCheck(attacker)
end

function GM:PlayerDeath(victim, attacker, inflictor)
	victim:SendLua("local tab = {Color(155,255,155), [[Игрок "..victim:Nick().." погиб!]] } chat.AddText(unpack(tab))")
end

function LevelCheck(ply)
	local nextlevelexp = (ply:GetNWInt("LVL")*500)*2.5
	local curExp = ply:GetNWInt("EXP")
	local curLVL = ply:GetNWInt("LVL")

	if (curExp > nextlevelexp) then
		curExp = curExp - nextlevelexp
		ply:SetNWInt("EXP",curExp)
		ply:SetNWInt("LVL",curLVL+1)
	end
end

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