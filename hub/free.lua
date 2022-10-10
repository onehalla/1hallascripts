--# selene: allow(unused_variable)
local function Get(n)
	return loadstring(game:HttpGetAsync(n, true))()
end

local function Git(n)
	if not getgenv()["cach"] then
		getgenv()["cach"] = {}
	end
	if getgenv().cach[n] then
		warn("Cach Found : ", n)
		return getgenv().cach[n]
	end
	local Data = loadstring(
		game:HttpGetAsync("https://raw.githubusercontent.com/onehalla/1hallahub_utils/main/" .. tostring(n), true)
	)()
	getgenv().cach[n] = Data
	return Data
end
--[[
local Maid = Git("Maid.lua")
local Signal = Git("GoodSignal.lua")

local Library = Git("ui.lua")

Library:LoadingScreen()
]]
local Promise = Git("Promise.lua")

local tw = task.wait
local PrettyPrint = getgenv().P or print
local LocalPlayer = game.Players.LocalPlayer

local CharacterClass = {}
CharacterClass.__index = function(self, i)
	local PlayerCharacter = LocalPlayer.Character
	local Root = PlayerCharacter:FindFirstChild("HumanoidRootPart")

	local function CheckIfAlive()
		if not PlayerCharacter.Humanoid then
			return false
		end
		if not Root then
			return false
		end
		if Root.CFrame == nil then
			return false
		end
		if not PlayerCharacter.Humanoid.Health then
			return false
		end
		if PlayerCharacter.Humanoid.Health <= 0 then
			return false
		end
		return true
	end

	if not Root or not PlayerCharacter or not CheckIfAlive() then
		return nil
	end

	local props = {
		CFrame = Root.CFrame,
		Position = Root.Position,
		Alive = CheckIfAlive(),
		Dead = not CheckIfAlive(),
	}
	return props[i]
end
CharacterClass.__newindex = function(self, v, i)
	if v == "CFrame" then
		if not self.Dead and i ~= nil then
			pcall(function()
				LocalPlayer.Character.HumanoidRootPart.CFrame = i
			end)
		end
	elseif v == "Position" then
		if not self.Dead and i ~= nil then
			pcall(function()
				LocalPlayer.Character.HumanoidRootPart.Position = i
			end)
		end
	end
end
function CharacterClass.new()
	local self = {}
	return setmetatable(self, CharacterClass)
end
function CharacterClass:Sucide()
	pcall(function()
		LocalPlayer.Humanoid.Health = 0
	end)
end

function CharacterClass:TweenTeleport(Position) end
_G.Test = false

local Character = CharacterClass.new()
_G.Test = false
repeat
	tw(0.1)
	if Character.Alive then
		Character.CFrame = Character.CFrame * CFrame.new(0, 5, 0)
	end
until not _G.Test
warn("BRUH HE IS DEAD")
PrettyPrint(Character)
