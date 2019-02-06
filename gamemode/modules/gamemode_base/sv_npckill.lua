function GM:OnNPCKilled(npc, attacker, inflictor)
	attacker:SetNWInt("Money",attacker:GetNWInt("money") + 100)
	attacker:SetNWInt("EXP",attacker:GetNWInt("EXP") + 100)

	LevelCheck(attacker)
end