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