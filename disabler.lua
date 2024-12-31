local mt = getrawmetatable(game)
local oldindex = mt.__index
setreadonly(mt,false)

local anticheatRemotes = {
        "BANREMOTE", "PERMAIDBAN", "KICKREMOTE", "BR_KICKPC", "BR_KICKMOBILE",
        "OneMoreTime", "CHECKER_1", "TeleportDetect", "CHECKER", "GUI_CHECK",
        "checkingSPEED", "PERMA-BAN", "PERMABAN", "BreathingHAMON", "JJARC",
        "TakePoisonDamage", "FORCEFIELD", "Christmas_Sock", "VirusCough",
        "Symbiote", "Symbioted", "RequestAFKDisplay"
}

local fireHook
fireHook = hookmetamethod(game, "__namecall", function(self, ...)
	local method, arg = getnamecallmethod(), {...}
	return (method == "FireServer" and table.find(anticheatRemotes, arg[2])) and nil or fireHook(self, ...)
end)

local remoteNames = {"MainEvent", "Bullets", "Remote", "MAINEVENT"}
for _, remote in ipairs(game.ReplicatedStorage:GetDescendants()) do
	if remote:IsA("RemoteEvent") and table.find(remoteNames, remote.Name) then
		return remote
	end
end


mt.__index = function(indexed,property)
	if indexed == "Humanoid" and property == "WalkSpeed" then
		return 16
	end
	return oldindex(indexed,property)
end

setreadonly(mt,true)

mt.__index = function(indexed,property)
	if indexed == "Humanoid" and property == "JumpPower" then
		return 50
	end
	return oldindex(indexed,property)
end

setreadonly(mt,true)
