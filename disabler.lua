local mt = getrawmetatable(game)
local oldindex = mt.__index
setreadonly(mt,false)

local __namecall
__namecall = hookmetamethod(game, "__namecall", function(...)
  local args = {...}
  local self = args[1]
	local method = getnamecallmethod()
	local caller = getcallingscript()

	if (method == "FireServer" and self == MainEvent and tablefind(Flags, args[2])) then
    return
	end

	if (not checkcaller() and getfenv(2).crash) then
		hookfunction(getfenv(2).crash, function()
			warn("Game Attempted To Crash, Evaded") 
		end)
	end

	-- //
	return __namecall(...)
end)

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
