AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("hud.lua")

include("shared.lua")

util.AddNetworkString("F4Menu")
function GM:ShowSpare2(ply)
	net.Start("F4Menu")
	net.Broadcast()
end

/*---------------------------------------------------------------------------
Loading modules
---------------------------------------------------------------------------*/
local fol = GM.FolderName .. "/gamemode/modules/"
local files, folders = file.Find(fol .. "*", "LUA")

sv_count = 0
sh_count = 0
cl_count = 0

for k, v in pairs(files) do
    if string.GetExtensionFromFilename(v) ~= "lua" then continue end
    include(fol .. v)
end

for _, folder in SortedPairs(folders, true) do
    if folder == "." or folder == ".." then continue end

    for _, File in SortedPairs(file.Find(fol .. folder .. "/sh_*.lua", "LUA"), true) do
        AddCSLuaFile(fol .. folder .. "/" .. File)
        if File == "sh_interface.lua" then continue end
        include(fol .. folder .. "/" .. File)
        sh_count = sh_count + 1
    end

    for _, File in SortedPairs(file.Find(fol .. folder .. "/sv_*.lua", "LUA"), true) do
        if File == "sv_interface.lua" then continue end
        include(fol .. folder .. "/" .. File)
        sv_count = sv_count + 1
    end

    for _, File in SortedPairs(file.Find(fol .. folder .. "/cl_*.lua", "LUA"), true) do
        if File == "cl_interface.lua" then continue end
        AddCSLuaFile(fol .. folder .. "/" .. File)
        cl_count = cl_count + 1
    end
end

print("------------Подсчёт Модулей------------")
print("Клиентский(CL): " .. cl_count)
print("Общих(SH): " .. sh_count)
print("Серверных(SV): " .. sv_count)
print("Всего загружено: " .. sv_count + sh_count + cl_count )
print("-----------Загрузка Завершена----------")