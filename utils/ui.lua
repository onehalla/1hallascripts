--[[
  ห้ามนำไปใช้โดยไม่ได้รับอนุญาติเด็ดขาด, ui ชุดนี้สร้างขึ้
]]

local a = _Data or {}
local b = a.Banner or "10590477428"
local c = a.Dev or false
local d = a.Name or "1halla hub"
local e = a.Invite or "Free Scripts"
local f = a.Info or "discord.gg/CAdzMB87Fj"
local function g(h)
	local h = tostring(h)
	local i = "    "
	return i .. h:gsub("\n", "\n" .. i)
end
local j = "vahallalib"
local k = "Children"
local l = "OnCreate"
local m = {
	["Default"] = {
		MainColor = Color3.fromRGB(80, 255, 176),
		AccentColor = Color3.fromRGB(85, 255, 127),
		FontColor = Color3.fromRGB(255, 255, 255),
		Gradient = true,
		BackgroundColor = Color3.fromRGB(40, 40, 40),
		LeftBarColor = Color3.fromRGB(30, 30, 30),
		TopbarColor = Color3.fromRGB(20, 20, 20),
		ContainerBackground = Color3.fromRGB(100, 100, 100),
		TabContainerColor = Color3.fromRGB(30, 30, 30),
		SectionFrameColor = Color3.fromRGB(80, 255, 176),
		SliderBackgroundColor = Color3.fromRGB(30, 30, 30),
		DropdownBackgroundColor = Color3.fromRGB(60, 60, 60),
		ToggleBackgroundColor_Off = Color3.fromRGB(255, 83, 120),
		ToggleBackgroundColor_On = Color3.fromRGB(80, 255, 176),
		ToggleDotColor_Off = Color3.fromRGB(255, 255, 255),
		ToggleDotColor_On = Color3.fromRGB(30, 30, 30),
		ButtonTextColor = Color3.fromRGB(0, 0, 0),
	},
}
local n = Color3.fromRGB(255, 255, 255)
local o = m.Default
local function p(q)
	return o[q] or m["Default"][q]
end
local r = ColorSequence.new({ ColorSequenceKeypoint.new(0, o.MainColor), ColorSequenceKeypoint.new(1, o.MainColor) })
local s = ColorSequence.new({ ColorSequenceKeypoint.new(0, o.MainColor), ColorSequenceKeypoint.new(1, o.AccentColor) })
local t = {}
local u = {}
function AddtoThemeGradient(v)
	table.insert(u, v)
end
function AddtoTheme(v, q, w)
	table.insert(t, { Instance = v, Property = q, Link = w })
end
function GetThemeNameByThemeObject(v)
	for x, y in pairs(m) do
		if y == v then
			return tostring(x)
		end
	end
	return "Default"
end
local z = game.Players.LocalPlayer
local A = z:GetMouse()
local B = game:GetService("HttpService")
local C = game:GetService("TweenService")
local D = game:GetService("UserInputService")
local E
local F
local G
local H
local I
local J
local K
local L
local M
local N
do
	function N(h)
		return h:gsub("%s+", "_"):lower()
	end
	function L(O, P, Q)
		local R = Q or 0
		local S = function()
			local T = O.AbsoluteContentSize.Y
			P.CanvasSize = UDim2.fromOffset(0, T + R)
		end
		S()
		O:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(S)
	end
	function M(O, P)
		local U = function()
			local T = O.AbsoluteContentSize.Y
			local V = Frame.Size
			P.Size = UDim2.new(1, 0, 0, T + 10)
		end
		U()
		O:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(U)
	end
	function I(v)
		local D = game:GetService("UserInputService")
		local W = v
		local X
		local Y
		local Z
		local _
		local function a0(a1)
			local a2 = a1.Position - Z
			local a3 = UDim2.new(_.X.Scale, _.X.Offset + a2.X, _.Y.Scale, _.Y.Offset + a2.Y)
			local E = game:GetService("TweenService")
				:Create(W, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { Position = a3 })
			E:Play()
			wait(1)
		end
		W.InputBegan:Connect(function(a1)
			if
				a1.UserInputType == Enum.UserInputType.MouseButton1
				or a1.UserInputType == Enum.UserInputType.Touch and not library.drag
			then
				X = true
				Z = a1.Position
				_ = W.Position
				a1.Changed:Connect(function()
					if a1.UserInputState == Enum.UserInputState.End then
						X = false
					end
				end)
			end
		end)
		W.InputChanged:Connect(function(a1)
			if
				a1.UserInputType == Enum.UserInputType.MouseMovement
				or a1.UserInputType == Enum.UserInputType.Touch and not library.drag
			then
				Y = a1
			end
		end)
		D.InputChanged:Connect(function(a1)
			if a1 == Y and X then
				a0(a1)
			end
		end)
	end
	function E(v, a4, a5, a6, a7, a8)
		local a9 = typeof(a8) == "function" and a8 or function() end
		local aa = typeof(a5) == "EnumItem" and a5 or Enum.EasingStyle[a5]
		local ab = typeof(a6) == "EnumItem" and a6 or Enum.EasingDirection[a6]
		local ac = C:Create(v, TweenInfo.new(a4, aa, ab), a7)
		ac:Play()
		ac.Completed:Connect(function()
			a9()
		end)
		return ac
	end
	function G(ad, a4, a5, a6, a8)
		for x, y in pairs(ad) do
			E(x, a4, a5, a6, {}, a8)
		end
	end
	function H(ae, q, af)
		local af = typeof(af) == "table" and af or {}
		local ag = typeof(q) == "table" and q or {}
		local ah = Instance.new(ae)
		for x, y in pairs(ag) do
			if x ~= "Time" then
				ah[x] = y
			end
		end
		local ai = ag["Time"] or nil
		if ai then
			game.Debris:AddItem(ah, ai)
		end
		for aj, y in pairs(af) do
			if typeof(y) == "function" then
				local ak = pcall(y)
				if typeof(ak) == "Instance" then
					ak.Parent = ah
				end
			elseif typeof(y) == "Instance" then
				y.Parent = ah
			end
		end
		return ah
	end
	function F(ae)
		return function(q)
			local al = {}
			local am = {}
			for x, y in pairs(q) do
				if x ~= k and x ~= l then
					al[x] = y
				else
					if x ~= l then
						for R, an in pairs(y) do
							am[R] = an
						end
					end
				end
			end
			local ao = H(ae, al, am)
			if typeof(q[l]) == "function" then
				q[l](ao)
			end
			return ao
		end
	end
	function K(v)
		task.spawn(function()
			local ap = Instance.new("ImageLabel")
			ap.Name = "Circle"
			ap.Parent = v
			ap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ap.BackgroundTransparency = 1.000
			ap.ZIndex = 100
			ap.Image = "rbxassetid://6082206725"
			ap.ImageColor3 = Color3.fromRGB(255, 255, 255)
			ap.ImageTransparency = 0.4
			local aq, ar = A.X - ap.AbsolutePosition.X, A.Y - ap.AbsolutePosition.Y
			ap.Position = UDim2.new(0, aq, 0, ar)
			local Size = 0
			if v.AbsoluteSize.X > v.AbsoluteSize.Y then
				Size = v.AbsoluteSize.X * 1.5
			elseif v.AbsoluteSize.X < v.AbsoluteSize.Y then
				Size = v.AbsoluteSize.Y * 1.5
			elseif v.AbsoluteSize.X == v.AbsoluteSize.Y then
				Size = v.AbsoluteSize.X * 1.5
			end
			C:Create(ap, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
				Size = UDim2.new(0, Size, 0, Size),
				Position = UDim2.new(0.5, -Size / 2, 0.5, -Size / 2),
				ImageTransparency = 1,
			}):Play()
			C:Create(ap, TweenInfo.new(0.3, Enum.EasingStyle.Linear), { ImageTransparency = 1 }):Play()
			wait(0.3)
			ap:Destroy()
		end)
		do
			local ap = Instance.new("ImageLabel")
			ap.Name = "Circle"
			ap.Parent = v
			ap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ap.BackgroundTransparency = 1.000
			ap.ZIndex = 100
			ap.Image = "rbxassetid://266543268"
			ap.ImageColor3 = Color3.fromRGB(255, 255, 255)
			ap.ImageTransparency = 0.8
			local aq, ar = A.X - ap.AbsolutePosition.X, A.Y - ap.AbsolutePosition.Y
			ap.Position = UDim2.new(0, aq, 0, ar)
			local Size = 0
			if v.AbsoluteSize.X > v.AbsoluteSize.Y then
				Size = v.AbsoluteSize.X * 1.5
			elseif v.AbsoluteSize.X < v.AbsoluteSize.Y then
				Size = v.AbsoluteSize.Y * 1.5
			elseif v.AbsoluteSize.X == v.AbsoluteSize.Y then
				Size = v.AbsoluteSize.X * 1.5
			end
			C:Create(ap, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
				Size = UDim2.new(0, Size, 0, Size),
				Position = UDim2.new(0.5, -Size / 2, 0.5, -Size / 2),
				ImageTransparency = 1,
			}):Play()
			C:Create(ap, TweenInfo.new(0.3, Enum.EasingStyle.Linear), { ImageTransparency = 1 }):Play()
			wait(0.3)
			ap:Destroy()
		end
	end
	function J(v, a9, as)
		local at = F("TextButton")({
			Parent = v,
			ZIndex = 99,
			ClipsDescendants = true,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			Text = "",
			AutoButtonColor = false,
			[k] = { F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 3) }) },
		})
		if not as then
			at.MouseEnter:Connect(function()
				E(at, 0.1, "Linear", "In", { BackgroundTransparency = 0.9 })
			end)
			at.MouseLeave:Connect(function()
				E(at, 0.1, "Linear", "In", { BackgroundTransparency = 1 })
			end)
		end
		at.MouseButton1Click:Connect(function()
			task.spawn(K, at)
			a9()
		end)
		return { Instance = at }
	end
end
do
	if c then
		if not game.CoreGui:FindFirstChild("Nigga") then
			game:GetService("RunService"):Set3dRenderingEnabled(false)
			local au = F("ScreenGui")({
				Name = "Nigga",
				Parent = game.CoreGui,
				IgnoreGuiInset = true,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
				[k] = {
					F("Frame")({
						Name = "Frame",
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundColor3 = Color3.fromRGB(100, 100, 100),
						Position = UDim2.fromScale(0.5, 0.5),
						Size = UDim2.fromScale(1, 1),
					}),
				},
			})
			for x, y in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
				if y:IsA("ScreenGui") and y.Enabled == true then
					y:SetAttribute("Visible", true)
					y.Enabled = false
				end
			end
		end
	else
		for x, y in pairs(game.CoreGui:GetChildren()) do
			if y.Name == "Nigga" then
				y:Destroy()
			end
		end
		for x, y in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
			if y:IsA("ScreenGui") and y:GetAttribute("Visible") ~= nil then
				y:SetAttribute("Visible", nil)
				y.Enabled = true
			end
		end
		game:GetService("RunService"):Set3dRenderingEnabled(true)
	end
end
local function av()
	local aw = {}
	aw.__index = aw
	aw.ClassName = "Signal"
	function aw.new()
		return setmetatable({ _bindable = Instance.new("BindableEvent"), _args = nil, _argCount = nil }, aw)
	end
	function aw:Fire(...)
		self._args = { ... }
		self._argCount = select("#", ...)
		self._bindable:Fire()
	end
	function aw:fire(...)
		return self:Fire(...)
	end
	function aw:Connect(ax)
		if not (type(ax) == "function") then
			error(("connect(%s)"):format(typeof(ax)), 2)
		end
		return self._bindable.Event:Connect(function()
			ax(unpack(self._args, 1, self._argCount))
		end)
	end
	function aw:connect(...)
		return self:Connect(...)
	end
	function aw:Wait()
		self._bindableEvent.Event:Wait()
		assert(self._argData, "Missing argument data, likely due to :TweenSize/Position corrupting.")
		return unpack(self._args, 1, self._argCount)
	end
	function aw:wait()
		return self:Wait()
	end
	function aw:Destroy()
		if self._bindable then
			self._bindable:Destroy()
			self._bindable = nil
		end
		self._args = nil
		self._argCount = nil
		setmetatable(self, nil)
	end
	function aw:destroy()
		return self:Destroy()
	end
	return aw
end
local aw = av()
local library =
	{ Name = "1halla hub", SaveConfig = { SeperatePlayer = true, MainPathName = "OneHalla_Hub" }, flags = {} }
local ay = {}
local az = {}
local aA
local aB
local function aC(...)
	local aD = { ... }
	local h = ""
	for x, y in pairs(aD) do
		h = h .. y .. "/"
	end
	return h:sub(1, -2)
end
local function aE(aF)
	return B:JSONDecode(aF)
end
local function aG(aF)
	return B:JSONEncode(aF)
end
local function aH()
	writefile(aA, B:JSONEncode(ay))
end
local function aI()
	writefile(aB, B:JSONEncode(az))
	warn("Data Saved")
end
local function aJ()
	local aK = library.SaveConfig.MainPathName
	if not isfolder(aK) then
		makefolder(aK)
	end
	return aK
end
do
	local aK = aJ()
	local aL = aC(aK, "Settings") .. ".json"
	aB = aL
	if not isfile(aL) then
		local aM = aG({ Created = os.date(), Mode = "Window" })
		writefile(aL, aM)
		warn("Created Library Setting File : ", aL)
	end
	az = B:JSONDecode(readfile(aL))
end
function library:LoadAutoSave(a1)
	local aN = a1 == "Auto" and tostring(game.GameId) or tostring(a1)
	local aK = aJ()
	local aO = string.format("%s-%d", game.Players.LocalPlayer.Name, game.Players.LocalPlayer.UserId)
	local aP = aC(aK, aO)
	if not isfolder(aP) then
		makefolder(aP)
	end
	local aQ = aC(aP, aN) .. ".json"
	aA = aQ
	local aM = aG({ Created = os.date() })
	local function aR()
		writefile(aQ, aM)
		warn("Created File : ", aQ)
	end
	if not isfile(aQ) then
		aR()
	end
	status, a = xpcall(function()
		return B:JSONDecode(readfile(aA))
	end, function()
		aR()
		return aM
	end)
	repeat
		wait()
	until a ~= nil
	ay = a
end
local aS = aw.new()
function SetTheme()
	r = ColorSequence.new({ ColorSequenceKeypoint.new(0, o.MainColor), ColorSequenceKeypoint.new(1, o.MainColor) })
	s = ColorSequence.new({ ColorSequenceKeypoint.new(0, o.MainColor), ColorSequenceKeypoint.new(1, o.AccentColor) })
	for x, y in pairs(u) do
		y.Color = o.Gradient and s or r
	end
	for x, y in pairs(t) do
		if y.Instance ~= nil and y["Property"] and o[y.Link] ~= nil then
			pcall(function()
				E(y.Instance, 0.1, "Linear", "In", { [y.Property] = o[y.Link] or m.Default[y.Link] })
			end)
		end
	end
	local aT = GetThemeNameByThemeObject(o)
	az["Theme"] = aT
	aI()
	aS:Fire()
end
function library:Clear()
	for x, y in pairs(game.CoreGui:GetChildren()) do
		if y.Name == j then
			y:Destroy()
		end
	end
end
local aU = 1
local aV
local aW
local aX
local aY = {}
local aZ = {}
local function a_()
	for x, y in pairs(aZ) do
		y:Disconnect()
	end
end
local b0 = aw.new()
local b1 = {}
local function b2(b3)
	local function b4(b5)
		b5.Size = UDim2.new(1, -5, 1, 0)
	end
	local function b6(b5)
		local b7 = b5:FindFirstChild("UIListLayout")
		local b8 = function()
			local T = b7.AbsoluteContentSize.Y
			b5.Size = UDim2.new(1, -5, 0, T + 20)
		end
		if b7 then
			b8()
			table.insert(aZ, b7:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(b8))
		end
	end
	for x, y in pairs(b1) do
		if b3 == "Full" then
			b4(y.Left)
			b4(y.Right)
		elseif b3 == "Dynamic" then
			b6(y.Left)
			b6(y.Right)
		end
	end
end
local b9 = F("ScreenGui")({
	Name = "Notification",
	Parent = game.CoreGui,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	[k] = {
		F("Frame")({
			Name = "Holder",
			AnchorPoint = Vector2.new(1, 1),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			Position = UDim2.fromScale(1, 1),
			Size = UDim2.fromScale(0.3, 1),
			[k] = {
				F("UIPadding")({
					Name = "UIPadding",
					PaddingBottom = UDim.new(0, 5),
					PaddingLeft = UDim.new(0, 5),
					PaddingRight = UDim.new(0, 5),
					PaddingTop = UDim.new(0, 5),
				}),
				F("UIListLayout")({
					Name = "UIListLayout",
					Padding = UDim.new(0, 10),
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Bottom,
				}),
			},
		}),
	},
})
local function ba(type, bb, bc, bd)
	local a4 = string.lower(type)
	local aa = {
		["default"] = { Color = p("MainColor"), Icon = "11207357159" },
		["success"] = { Color = Color3.fromRGB(85, 255, 127), Icon = "11207704092" },
		["error"] = { Color = Color3.fromRGB(255, 85, 127), Icon = "11207702613" },
		["info"] = { Color = Color3.fromRGB(85, 170, 255), Icon = "11207703333" },
		["warning"] = { Color = Color3.fromRGB(255, 170, 0), Icon = "11207704598" },
	}
	local be = aa[a4] and aa[a4].Color or aa["default"].Color
	local bf = aa[a4] and aa[a4].Icon or aa["default"].Icon
	local bg = F("Frame")({
		Parent = b9.Holder,
		Name = "Template",
		BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		Size = UDim2.new(0, 0, 0, 0),
		AnchorPoint = Vector2.new(1, 1),
		ClipsDescendants = true,
		[k] = {
			F("Frame")({
				Name = "Line",
				AnchorPoint = Vector2.new(0.5, 1),
				BackgroundColor3 = be,
				BorderSizePixel = 0,
				Position = UDim2.fromScale(0.5, 1),
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 2),
			}),
			F("TextLabel")({
				Name = "Info",
				FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
				Text = bb,
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextSize = 14,
				TextXAlignment = Enum.TextXAlignment.Left,
				AnchorPoint = Vector2.new(1, 0),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				TextTransparency = 1,
				Position = UDim2.fromScale(0.9, 0.367),
				Size = UDim2.new(0.9, -30, 0.633, -2),
			}),
			F("ImageLabel")({
				Name = "Icon",
				Image = "http://www.roblox.com/asset/?id=" .. tostring(bf),
				ImageColor3 = be,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				Position = UDim2.fromScale(0, 0.5),
				ImageTransparency = 1,
				Size = UDim2.fromOffset(30, 30),
			}),
			F("ImageLabel")({
				Name = "Close",
				Image = "http://www.roblox.com/asset/?id=11207370821",
				ImageColor3 = Color3.fromRGB(91, 91, 91),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				Position = UDim2.fromScale(1, 0.5),
				Size = UDim2.fromOffset(25, 25),
			}),
			F("TextLabel")({
				Name = "Title",
				FontFace = Font.new(
					"rbxasset://fonts/families/GothamSSm.json",
					Enum.FontWeight.Bold,
					Enum.FontStyle.Normal
				),
				TextTransparency = 1,
				Text = bc,
				TextColor3 = be,
				TextSize = 14,
				TextXAlignment = Enum.TextXAlignment.Left,
				AnchorPoint = Vector2.new(1, 0),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				Position = UDim2.fromScale(0.9, 0),
				Size = UDim2.new(0.9, -30, 0.433, -2),
			}),
		},
	})
	function Get(bh)
		return bg:WaitForChild(bh)
	end
	local bi, bj, bk, bl, bm = Get("Line"), Get("Close"), Get("Icon"), Get("Title"), Get("Info")
	local function bn()
		bl.Visible = false
		bm.Visible = false
		bj.Visible = false
		bk.Visible = false
		E(bg, 0.2, "Quad", "Out", { Size = UDim2.new(0, 0, 0, 30) }, function()
			E(bg, 0.1, "Quad", "Out", { Size = UDim2.new(0, 0, 0, 0) }, function()
				bg:Destroy()
			end)
		end)
	end
	local function bo()
		E(bg, 0.3, "Quad", "In", { Size = UDim2.new(1, 0, 0, 40) }, function()
			E(bi, 0.2, "Quad", "In", { BackgroundTransparency = 0 }, function()
				E(bi, bd, "Linear", "In", { Size = UDim2.new(0, 0, 0, 2) }, function()
					bn()
				end)
			end)
			E(bm, 0.2, "Quad", "In", { TextTransparency = 0 })
			E(bl, 0.2, "Quad", "In", { TextTransparency = 0 })
			E(bk, 0.2, "Quad", "In", { ImageTransparency = 0, Position = UDim2.fromScale(0, 0) })
		end)
	end
	bo()
	J(bj, function()
		bn()
	end)
end
function library:SendNotification(bp)
	local bc = bp or {}
	local bq = bc.type or bc.Type or bc.Status or "Default"
	local bb = bc.title or bc.Title or bc.Name or "Notification"
	local bc = bc.info or bc.Info or bc.Text or ". . ."
	local bd = bc.time or bc.lifetime or bc.delay or bc.duration or 5
	ba(bq, bc, bb, bd)
end
local br
local bs = aw.new()
local bt = {
	[1] = {
		Name = "Window",
		Icon = "rbxassetid://10965528897",
		Callback = function()
			br.Visible = true
			E(aW, 0.2, "Quad", "In", { Size = UDim2.new(0, 650, 0, 600) }, function()
				a_()
				bs:Fire("Horizontal")
				for x, y in pairs(aY) do
					y.Size = UDim2.new(0.5, -5, 1, 0)
				end
			end)
		end,
	},
	[2] = {
		Name = "Mini",
		Icon = "rbxassetid://10965554659",
		Callback = function()
			br.Visible = false
			E(aW, 0.2, "Quad", "In", { Size = UDim2.new(0, 400, 0, 450) }, function()
				a_()
				bs:Fire("Vertical")
				b2("Dynamic")
			end)
		end,
	},
	[3] = {
		Name = "Single",
		Icon = "rbxassetid://10965542161",
		Callback = function()
			br.Visible = true
			E(aW, 0.2, "Quad", "In", { Size = UDim2.new(0, 500, 0, 400) }, function()
				a_()
				bs:Fire("Vertical")
				b2("Dynamic")
			end)
		end,
	},
}
local function bu(bv)
	for x, y in pairs(bt) do
		if y.Name == bv then
			CurrentMode = y.Name
			aU = x
			aX.Image = y.Icon
			y.Callback()
			az["Mode"] = y.Name
			aI()
		end
	end
end
local function bw()
	aU = aU + 1
	if aU > #bt then
		aU = 1
	end
	bu(bt[aU].Name)
end
local bx
local CurrentMode = az["Mode"] or "Window"
function library:LoadingScreen()
	local by = F("ScreenGui")({
		Name = j,
		Parent = game.CoreGui,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		[k] = {
			F("Frame")({
				Name = "Holder",
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = Color3.fromRGB(30, 30, 30),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromOffset(352, 136),
				[l] = function(ak)
					I(ak)
				end,
				[k] = {
					F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 100) }),
					F("ImageLabel")({
						Name = "Logo",
						Image = "http://www.roblox.com/asset/?id=11219897278",
						AnchorPoint = Vector2.new(0, 0.5),
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1,
						Position = UDim2.fromScale(0, 0.5),
						Size = UDim2.fromOffset(100, 100),
					}),
					F("TextLabel")({
						Name = "Title",
						FontFace = Font.new(
							"rbxasset://fonts/families/GothamSSm.json",
							Enum.FontWeight.Bold,
							Enum.FontStyle.Normal
						),
						Text = "1halla hub",
						TextColor3 = Color3.fromRGB(80, 255, 176),
						TextScaled = true,
						TextSize = 14,
						TextWrapped = true,
						TextTransparency = 1,
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1,
						Position = UDim2.fromScale(0.304, 0.0636),
						Size = UDim2.fromOffset(228, 25),
					}),
					F("UIStroke")({ Name = "UIStroke", Color = Color3.fromRGB(81, 255, 180), Thickness = 2 }),
					F("TextLabel")({
						Name = "Credit",
						FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
						Text = "สคริปฟรีตึงๆ by 1halla#0001",
						TextColor3 = Color3.fromRGB(255, 255, 255),
						TextScaled = true,
						TextTransparency = 1,
						TextSize = 14,
						TextTransparency = 1,
						TextWrapped = true,
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1,
						Position = UDim2.fromScale(0.452, 0.243),
						Size = UDim2.fromOffset(150, 20),
					}),
					F("TextButton")({
						Name = "Execute",
						FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
						Text = " LOAD ",
						AutoButtonColor = false,
						TextColor3 = Color3.fromRGB(30, 30, 30),
						TextScaled = false,
						TextSize = 20,
						BackgroundTransparency = 1,
						TextTransparency = 1,
						TextWrapped = true,
						BackgroundColor3 = Color3.fromRGB(80, 255, 176),
						Position = UDim2.fromScale(0.284, 0.674),
						Size = UDim2.fromOffset(242, 33),
						[k] = { F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 3) }) },
					}),
					F("TextButton")({
						Name = "Discord",
						AutoButtonColor = false,
						FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
						Text = "copy discord invite",
						TextColor3 = Color3.fromRGB(255, 255, 255),
						TextScaled = false,
						TextSize = 20,
						BackgroundTransparency = 1,
						TextTransparency = 1,
						TextWrapped = true,
						BackgroundColor3 = Color3.fromRGB(60, 60, 60),
						Position = UDim2.fromScale(0.284, 0.372),
						Size = UDim2.fromOffset(242, 33),
						[k] = { F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 3) }) },
					}),
				},
			}),
		},
	})
	local bz = by:WaitForChild("Holder")
	local function Get(bh)
		return bz:WaitForChild(bh)
	end
	local bA, bB, bl, bC, bD = Get("Discord"), Get("Execute"), Get("Title"), Get("Credit"), Get("Logo")
	local bE = Get("UIStroke")
	local bF = Get("UICorner")
	local bG = false
	local function bo()
		task.spawn(function()
			while not bG do
				E(bE, 0.4, "Linear", "In", { Color = Color3.fromRGB(81, 255, 180) })
				wait(1)
				E(bE, 0.4, "Linear", "In", { Color = n })
				wait(1)
			end
		end)
		bl.Visible = false
		bC.Visible = false
		bA.Visible = false
		bB.Visible = false
		bz.Size = UDim2.fromOffset(120, 120)
		bD.Size = UDim2.fromScale(1, 1)
		local bH
		bH = J(bD, function()
			bH.Instance:Destroy()
			bG = true
			E(bF, 0.4, "Linear", "In", { CornerRadius = UDim.new(0, 3) })
			wait(0.4)
			E(bD, 0.3, "Quad", "In", { ImageTransparency = 1 }, function()
				E(bE, 0.4, "Linear", "In", { Color = Color3.fromRGB(81, 255, 180) })
				E(bz, 0.3, "Quad", "In", { Size = UDim2.fromOffset(352, 136) })
				wait(0.3)
				bD.Size = UDim2.fromOffset(100, 100), E(bD, 0.15, "Quad", "In", { ImageTransparency = 0 })
				wait(0.2)
				bl.Visible = true
				bC.Visible = true
				bA.Visible = true
				bB.Visible = true
				E(bl, 0.2, "Linear", "In", { TextTransparency = 0 })
				wait(0.1)
				E(bC, 0.2, "Linear", "In", { TextTransparency = 0.5 })
				wait(0.1)
				E(bA, 0.2, "Linear", "In", { TextTransparency = 0, BackgroundTransparency = 0 })
				wait(0.1)
				E(bB, 0.2, "Linear", "In", { TextTransparency = 0, BackgroundTransparency = 0 })
			end)
		end)
	end
	local function bj()
		E(bl, 0.2, "Linear", "In", { TextTransparency = 1 })
		wait(0.1)
		E(bC, 0.2, "Linear", "In", { TextTransparency = 1 })
		wait(0.1)
		E(bA, 0.2, "Linear", "In", { TextTransparency = 1, BackgroundTransparency = 1 })
		wait(0.1)
		E(bB, 0.2, "Linear", "In", { TextTransparency = 1, BackgroundTransparency = 1 })
		wait(0.1)
		E(bD, 0.2, "Linear", "In", { ImageTransparency = 1 })
		wait(0.1)
		E(bE, 0.2, "Linear", "In", { Transparency = 1 })
		wait(0.3)
		E(bz, 0.3, "Quad", "In", { BackgroundTransparency = 1, Size = UDim2.new(0, 0, 0, 0) }, function()
			by:Destroy()
		end)
		wait(0.3)
	end
	bo()
	J(bB, function()
		library:SendNotification({ Title = "Loading", Type = "Info", Text = "รอซักครู่" })
		bj()
		library:Init()
		library:SendNotification({
			Title = "คำเตือน",
			Type = "warning",
			Text = "เข้าดิสคอร์ดเพื่อรับสคริปเพิ่มเติม",
		})
	end)
	J(bA, function()
		setclipboard("https://discord.gg/CAdzMB87Fj")
		library:SendNotification({ Title = "Discord", Type = "Success", Text = "Invite Copied" })
		library:SendNotification({
			Title = "Discord",
			Type = "Info",
			Text = "คัดลอกลิ้งค์ Discord เรียบร้อย",
		})
	end)
end
function library:Init()
	local bI = az["Theme"] or "Default"
	if m[bI] == nil then
		bI = "Default"
	end
	o = m[bI]
	SetTheme()
	wait(0.2)
	bx.Enabled = true
	bu(CurrentMode)
end
function library:NewWindow(bJ)
	bx = F("ScreenGui")({
		Name = j,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		Parent = game.CoreGui,
		Enabled = false,
	})
	aW = F("Frame")({
		Name = "Background",
		BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Parent = bx,
		Position = UDim2.new(0.5, 0, 0.147, 0),
		AnchorPoint = Vector2.new(0.5, 0),
		Size = UDim2.new(0, 533, 0, 288),
		[k] = { F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 0) }) },
	})
	AddtoTheme(aW, "BackgroundColor3", "BackgroundColor")
	local bK = F("ScreenGui")({
		Name = j,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		Parent = game.CoreGui,
		Enabled = false,
	})
	local bL = F("ImageLabel")({
		Name = "Background",
		Image = "rbxassetid://1316045217",
		BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		BorderSizePixel = 0,
		Parent = bx,
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0),
		Size = UDim2.new(0, 533, 0, 288),
		ZIndex = -50,
		Position = aW.Position,
		ImageTransparency = 0.401,
		ImageColor3 = Color3.fromRGB(0, 0, 0),
	})
	local bM = 40
	local function bN()
		bL.Size = aW.Size + UDim2.fromOffset(bM, bM)
		bL.Position = aW.Position - UDim2.fromOffset(0, bM / 2)
	end
	bN()
	aW:GetPropertyChangedSignal("Size"):Connect(bN)
	aW:GetPropertyChangedSignal("Position"):Connect(bN)
	local bO = F("Frame")({
		Name = "SettingContainer",
		ClipsDescendants = true,
		Parent = aW,
		Visible = false,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(0, 0),
		ZIndex = 999,
		[l] = function(ak)
			AddtoTheme(ak, "BackgroundColor3", "BackgroundColor")
		end,
		[k] = {
			F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 3) }),
			F("TextLabel")({
				Name = "SettingTitle",
				FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
				Text = "Setting",
				TextColor3 = Color3.fromRGB(255, 255, 255),
				TextSize = 14,
				TextXAlignment = Enum.TextXAlignment.Left,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 24),
			}),
			F("UIPadding")({
				Name = "UIPadding",
				PaddingBottom = UDim.new(0, 3),
				PaddingLeft = UDim.new(0, 3),
				PaddingRight = UDim.new(0, 3),
				PaddingTop = UDim.new(0, 3),
			}),
			F("Frame")({
				Name = "Line",
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 0.5,
				Position = UDim2.fromOffset(0, 25),
				Size = UDim2.new(1, 0, 0, 1),
				[l] = function(ak)
					AddtoTheme(ak, "BackgroundColor3", "MainColor")
				end,
				[k] = { F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 100) }) },
			}),
			F("Frame")({
				Name = "SettingCompoents",
				AnchorPoint = Vector2.new(0.5, 0),
				BackgroundColor3 = Color3.fromRGB(30, 30, 30),
				BorderColor3 = Color3.fromRGB(53, 53, 53),
				Position = UDim2.new(0.5, 0, 0, 30),
				Size = UDim2.new(1, 0, 1, -30),
				[l] = function(ak)
					AddtoTheme(ak, "BackgroundColor3", "BackgroundColor")
				end,
				[k] = {
					F("UIListLayout")({
						Name = "UIListLayout",
						Padding = UDim.new(0, 2),
						SortOrder = Enum.SortOrder.LayoutOrder,
					}),
					F("UIPadding")({
						Name = "UIPadding",
						PaddingBottom = UDim.new(0, 3),
						PaddingLeft = UDim.new(0, 3),
						PaddingRight = UDim.new(0, 3),
						PaddingTop = UDim.new(0, 3),
					}),
				},
			}),
			F("ImageButton")({
				Name = "SettingClose",
				AnchorPoint = Vector2.new(1, 0),
				BackgroundColor3 = Color3.fromRGB(255, 85, 127),
				Position = UDim2.fromScale(1, 0),
				Size = UDim2.fromOffset(20, 20),
				AutoButtonColor = false,
				[l] = function(ak)
					AddtoTheme(ak, "BackgroundColor3", "MainColor")
					J(ak, function() end)
				end,
				[k] = { F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 3) }) },
			}),
		},
	})
	local bP = F("ImageButton")({
		Parent = aW,
		AutoButtonColor = false,
		ZIndex = 100,
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		BackgroundTransparency = 0.5,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 0, 0, 0),
		ImageTransparency = 1,
		ScaleType = Enum.ScaleType.Crop,
	})
	I(aW)
	local bQ = F("Frame")({
		Name = "LeftBar",
		Parent = aW,
		AnchorPoint = Vector2.new(0, 0.5),
		BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(0, 125, 1, 0),
		[k] = {
			F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 0) }),
			F("UIPadding")({
				Name = "UIPadding",
				PaddingBottom = UDim.new(0, 5),
				PaddingLeft = UDim.new(0, 5),
				PaddingRight = UDim.new(0, 5),
				PaddingTop = UDim.new(0, 5),
			}),
			F("ImageLabel")({
				Name = "Banner",
				Image = "http://www.roblox.com/asset/?id=" .. tostring(b),
				ScaleType = Enum.ScaleType.Crop,
				AnchorPoint = Vector2.new(0.5, 0),
				BackgroundTransparency = 1,
				Position = UDim2.new(0.5, 0, 0.0, 0),
				Size = UDim2.new(1, 0, 0, 125),
				[l] = function(ak)
					print(ak.AbsoluteSize)
					AddtoTheme(ak, "BackgroundColor3", "LeftBarColor")
				end,
				[k] = {
					F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 1) }),
					F("TextLabel")({
						Name = "ScriptName",
						Font = Enum.Font.GothamBold,
						Text = d,
						TextColor3 = Color3.fromRGB(255, 255, 255),
						TextSize = 14,
						TextXAlignment = Enum.TextXAlignment.Right,
						AnchorPoint = Vector2.new(1, 0),
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1,
						Position = UDim2.new(1, 0, 0.0811, 0),
						Size = UDim2.new(1, 0, 0, 26),
					}),
					F("UIPadding")({
						Name = "UIPadding",
						PaddingBottom = UDim.new(0, 3),
						PaddingLeft = UDim.new(0, 3),
						PaddingRight = UDim.new(0, 3),
						PaddingTop = UDim.new(0, 3),
					}),
					F("TextLabel")({
						Name = "Info",
						Font = Enum.Font.GothamBold,
						Text = f,
						TextColor3 = Color3.fromRGB(255, 255, 255),
						TextSize = 10,
						TextTransparency = 0.5,
						TextWrapped = true,
						TextXAlignment = Enum.TextXAlignment.Right,
						AnchorPoint = Vector2.new(1, 0),
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1,
						Position = UDim2.new(0.982, 0, 0.819, 0),
						Size = UDim2.new(1, 0, -0.109, 26),
					}),
					F("TextLabel")({
						Name = "Link",
						Font = Enum.Font.GothamBold,
						Text = e,
						TextColor3 = Color3.fromRGB(255, 255, 255),
						TextSize = 10,
						TextTransparency = 0.5,
						TextWrapped = true,
						TextXAlignment = Enum.TextXAlignment.Right,
						AnchorPoint = Vector2.new(1, 0),
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1,
						Position = UDim2.new(1, 0, 0.27, 0),
						Size = UDim2.new(1, 0, -0.109, 26),
					}),
				},
			}),
			F("UIListLayout")({
				Name = "ElementHandlerList",
				Padding = UDim.new(0, 3),
				Parent = ElementHandler,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
			}),
			F("Frame")({
				Name = "ScroolingFrameHolder",
				AnchorPoint = Vector2.new(0.5, 1),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				Position = UDim2.new(0.5, 0, 1, 0),
				Size = UDim2.new(1, 0, 0.7, -10),
				[k] = { F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 5) }) },
			}),
		},
	})
	AddtoTheme(bQ, "BackgroundColor3", "LeftBarColor")
	local bR = F("Frame")({
		Name = "SettingBackground",
		Parent = aW,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		Visible = false,
		ZIndex = 1000,
		BackgroundTransparency = 0.5,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, 0, 1, 0),
		[k] = {
			F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 5) }),
			F("Frame")({
				Name = "SettingModal",
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = Color3.fromRGB(30, 30, 30),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.new(0, 400, 0, 250),
				[k] = {
					F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 5) }),
					F("TextLabel")({
						Name = "Title",
						Font = Enum.Font.Gotham,
						Text = "Setting",
						TextColor3 = Color3.fromRGB(255, 255, 255),
						TextScaled = true,
						TextSize = 14,
						TextWrapped = true,
						TextXAlignment = Enum.TextXAlignment.Left,
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1,
						Size = UDim2.new(0, 200, 0, 29),
					}),
					F("UIPadding")({
						Name = "UIPadding",
						PaddingBottom = UDim.new(0, 5),
						PaddingLeft = UDim.new(0, 5),
						PaddingRight = UDim.new(0, 5),
						PaddingTop = UDim.new(0, 5),
					}),
					F("ImageButton")({
						Name = "Close",
						Image = "http://www.roblox.com/asset/?id=10965413935",
						AnchorPoint = Vector2.new(1, 0),
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1,
						Position = UDim2.new(1, 0, 0, 0),
						Size = UDim2.new(0, 30, 0, 30),
					}),
					F("TextLabel")({
						Name = "Description",
						Font = Enum.Font.Gotham,
						Text = "customize the look",
						TextColor3 = Color3.fromRGB(255, 255, 255),
						TextSize = 14,
						TextTransparency = 0.5,
						TextXAlignment = Enum.TextXAlignment.Left,
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1,
						Position = UDim2.new(0, 0, 0, 29),
						Size = UDim2.new(0, 200, 0, 18),
					}),
				},
			}),
		},
	})
	local function bS()
		bR.Visible = not bR.Visible
	end
	local bT = F("ImageButton")({
		Name = "LeftBarToggler",
		Parent = bQ.Banner,
		Image = "http://www.roblox.com/asset/?id=10978502474",
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		AutoButtonColor = false,
		BackgroundTransparency = 0.5,
		Size = UDim2.new(0, 20, 0, 20),
		[k] = { F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 4) }) },
	})
	aX = F("ImageButton")({
		Name = "WindowTypeToggler",
		Parent = bQ.Banner,
		Image = "http://www.roblox.com/asset/?id=10965446903",
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 0, 0, 23),
		Size = UDim2.new(0, 20, 0, 20),
	})
	local bU
	local bV
	J(aX, bw)
	local bW = false
	local bX = 0.15
	local bY = aw.new()
	local bZ = function()
		task.spawn(function()
			repeat
				wait()
			until bU ~= nil
			if bW then
				E(bQ, bX, "Linear", "In", { ["Size"] = UDim2.new(0, 125, 1, 0) })
				E(bU, bX, "Linear", "In", { ["Size"] = UDim2.new(1, -125, 1, -5) })
				E(bV, bX, "Linear", "In", { ["Size"] = UDim2.new(1, -125, 0, 15) })
				bT.Image = "http://www.roblox.com/asset/?id=10978502474"
				bW = false
			else
				bT.Image = "http://www.roblox.com/asset/?id=10986691394"
				E(bQ, bX, "Linear", "In", { ["Size"] = UDim2.new(0, 37, 1, 0) })
				E(bU, bX, "Linear", "In", { ["Size"] = UDim2.new(1, -37, 1, 0) })
				E(bV, bX, "Linear", "In", { ["Size"] = UDim2.new(1, -37, 0, 15) })
				bW = true
			end
			bY:Fire(not bW)
			az["LeftbarClosed"] = bW
			aI()
		end)
	end
	bY:Connect(function(b_)
		bQ.Banner.ScriptName.Visible = b_
		bQ.Banner.Info.Visible = b_
		bQ.Banner.Link.Visible = b_
		if b_ then
			bQ.Banner.ImageTransparency = 0
			bQ.Banner.Size = UDim2.new(1, 0, 0, 90)
			bQ.ScroolingFrameHolder.Size = UDim2.new(1, 0, 0.7, -10)
		else
			bQ.Banner.Size = UDim2.new(1, 0, 0.2, 0)
			bQ.ScroolingFrameHolder.Size = UDim2.new(1, 0, 0.77, 0)
			bQ.Banner.ImageTransparency = 1
		end
	end)
	az["LeftbarClosed"] = az["LeftbarClosed"] or false
	local c0 = az["LeftbarClosed"] or false
	aI()
	if c0 then
		bZ()
	end
	bY:Fire(not c0)
	J(bT, bZ)
	J(bR.SettingModal.Close, bS)
	local c1 = F("ScrollingFrame")({
		Parent = bQ.ScroolingFrameHolder,
		Name = "ScrollingFrame",
		ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
		ScrollBarThickness = 2,
		Active = true,
		AnchorPoint = Vector2.new(0.5, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		[k] = {
			F("UIListLayout")({
				Name = "UIListLayout",
				Padding = UDim.new(0, 0),
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
			}),
			F("UIPadding")({
				Name = "UIPadding",
				PaddingBottom = UDim.new(0, 5),
				PaddingLeft = UDim.new(0, 5),
				PaddingRight = UDim.new(0, 5),
				PaddingTop = UDim.new(0, 5),
			}),
		},
	})
	L(c1.UIListLayout, c1, 10)
	bV = F("Frame")({
		Name = "Topbar",
		Parent = aW,
		AnchorPoint = Vector2.new(1, 0),
		BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		BorderSizePixel = 0,
		Position = UDim2.new(1, 0, 0, 0),
		Size = UDim2.new(1, -125, 0, 15),
		[k] = {
			F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 3) }),
			F("Frame")({
				Name = "TwoHolder",
				AnchorPoint = Vector2.new(1, 0.5),
				AutomaticSize = Enum.AutomaticSize.X,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				Position = UDim2.new(1, -50, 0.5, 0),
				Size = UDim2.fromScale(0, 1),
				[k] = {
					F("UIListLayout")({
						Name = "UIListLayout",
						Padding = UDim.new(0, 10),
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder,
					}),
					F("TextLabel")({
						Name = "Theme",
						FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
						Text = "Theme",
						TextColor3 = Color3.fromRGB(255, 255, 255),
						TextSize = 14,
						Active = true,
						TextTransparency = 0.5,
						AnchorPoint = Vector2.new(1, 0.5),
						AutomaticSize = Enum.AutomaticSize.X,
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1,
						Position = UDim2.new(1, -200, 0.5, 0),
						Size = UDim2.fromScale(0, 1),
					}),
					F("TextLabel")({
						Name = "ToggleUI",
						FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
						Text = "[ Left Control ]",
						TextColor3 = Color3.fromRGB(255, 255, 255),
						TextSize = 14,
						Active = true,
						TextTransparency = 0.5,
						AnchorPoint = Vector2.new(1, 0.5),
						AutomaticSize = Enum.AutomaticSize.X,
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1,
						Position = UDim2.new(1, -50, 0.5, 0),
						Size = UDim2.fromScale(0, 1),
					}),
				},
			}),
			F("ImageButton")({
				Name = "Minimize",
				Image = "http://www.roblox.com/asset/?id=10965565068",
				AnchorPoint = Vector2.new(1, 0),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				Position = UDim2.new(1, -22, 0, -3),
				Size = UDim2.new(0, 20, 0, 20),
			}),
			F("ImageButton")({
				Name = "CloseAll",
				Image = "http://www.roblox.com/asset/?id=10965413935",
				AnchorPoint = Vector2.new(1, 0),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				Position = UDim2.new(1, 0, 0, -3),
				Size = UDim2.new(0, 20, 0, 20),
			}),
		},
	})
	AddtoTheme(bV, "BackgroundColor3", "TopbarColor")
	local c2 = bV:WaitForChild("CloseAll")
	J(c2, function()
		bx:Destroy()
	end)
	local c3 = bV:WaitForChild("TwoHolder")
	br = c3:WaitForChild("ToggleUI")
	local c4 = false
	local c5 = bV:WaitForChild("Minimize")
	local c6 = aW.Size
	local c7 = false
	local c8 = bV.Size
	J(c5, function()
		if c7 then
			return
		end
		c7 = true
		delay(0.6, function()
			c7 = false
		end)
		if c4 then
			c4 = false
			E(aW, 0.2, "Linear", "In", { Size = c6 })
			wait(0.2)
			E(bV, 0.2, "Linear", "In", { Size = c8 }, function()
				bQ.Visible = true
				E(bL, 0.2, "Linear", "In", { ImageTransparency = 0.401 })
			end)
		else
			c8 = bV.Size
			c6 = aW.Size
			c4 = true
			bQ.Visible = false
			E(bL, 0.2, "Linear", "In", { ImageTransparency = 1 })
			E(aW, 0.2, "Linear", "In", { Size = UDim2.new(c6.X.Scale, c6.X.Offset, 0, 18) })
			wait(0.25)
			E(bV, 0.2, "Linear", "In", { Size = UDim2.new(1, 0, 0, 15) })
		end
	end)
	local c9 = az["UIToggleKey"] or Enum.KeyCode["RightControl"].Name
	br.Text = string.format("[ %s ]", c9)
	local ca = false
	J(br, function()
		ca = true
		br.Text = "Press Any Key"
		E(br, 0.2, "Linear", "In", { TextColor3 = o.MainColor })
		local cb
		cb = D.InputBegan:Connect(function(a1, cc)
			if not cc and a1.UserInputType == Enum.UserInputType.Keyboard then
				cb:Disconnect()
				c9 = a1.KeyCode.Name
				az["UIToggleKey"] = c9
				br.Text = string.format("[ %s ]", c9)
				aI()
				wait(0.1)
				E(br, 0.2, "Linear", "In", { TextColor3 = n })
				ca = false
			end
		end)
	end)
	local cd = c3:WaitForChild("Theme")
	local ce = bO:WaitForChild("SettingClose")
	local cf = bO:WaitForChild("SettingCompoents")
	J(ce, function()
		E(bP, 0.2, "Linear", "In", { ImageTransparency = 1, BackgroundTransparency = 1 })
		E(bO, 0.2, "Quad", "In", { Size = UDim2.new(0, 0, 0, 0) }, function()
			bO.Visible = true
			bP.Visible = false
		end)
	end)
	function MakeSettingDropdown(cg, ch, ci)
		local cj = F("Frame")({
			Name = "Dropdown",
			Parent = cf,
			BackgroundColor3 = Color3.fromRGB(50, 50, 50),
			BorderColor3 = Color3.fromRGB(50, 50, 50),
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 25),
			[l] = function(ak)
				AddtoTheme(ak, "BackgroundColor3", "DropdownBackgroundColor")
			end,
			[k] = {
				F("TextLabel")({
					Name = "Title",
					FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
					Text = cg,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextSize = 14,
					TextXAlignment = Enum.TextXAlignment.Left,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					Size = UDim2.new(1, -30, 1, 0),
				}),
				F("UIPadding")({ Name = "UIPadding", PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5) }),
				F("ImageButton")({
					Name = "Down",
					Image = "rbxassetid://10934039279",
					AnchorPoint = Vector2.new(1, 0.5),
					BackgroundColor3 = n,
					BackgroundTransparency = 1,
					Position = UDim2.fromScale(1, 0.5),
					Size = UDim2.fromOffset(20, 20),
					[k] = {
						F("UIGradient")({
							Color = o.Gradient and s or r,
							[l] = function(ak)
								AddtoThemeGradient(ak)
							end,
						}),
						F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 3) }),
					},
				}),
			},
		})
		local ck = F("Frame")({
			Name = "DropdownContainer",
			Parent = cf,
			Visible = false,
			ClipsDescendants = true,
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = Color3.fromRGB(50, 50, 50),
			BorderColor3 = Color3.fromRGB(50, 50, 50),
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 25),
			[k] = {
				F("UIPadding")({
					Name = "UIPadding",
					PaddingBottom = UDim.new(0, 3),
					PaddingLeft = UDim.new(0, 3),
					PaddingRight = UDim.new(0, 3),
					PaddingTop = UDim.new(0, 3),
				}),
				F("UIListLayout")({
					Name = "UIListLayout",
					Padding = UDim.new(0, 1),
					SortOrder = Enum.SortOrder.LayoutOrder,
				}),
			},
		})
		local cl = ck:WaitForChild("UIListLayout")
		repeat
			wait()
		until ck ~= nil
		for x, y in pairs(ch) do
			local cm = F("TextButton")({
				Name = "BTN",
				ClipsDescendants = true,
				Parent = ck,
				FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
				Text = tostring(y),
				TextColor3 = Color3.fromRGB(0, 0, 0),
				TextSize = 14,
				TextTransparency = 0.5,
				BackgroundColor3 = n,
				Size = UDim2.new(1, 0, 0, 16),
				[l] = function(cn)
					cn.MouseButton1Click:Connect(function()
						ci(cn.Text)
					end)
				end,
				[k] = {
					F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 2) }),
					F("UIGradient")({
						Color = o.Gradient and s or r,
						[l] = function(ak)
							AddtoThemeGradient(ak)
						end,
					}),
				},
			})
		end
		J(cj, function()
			ck.Visible = not ck.Visible
		end)
	end
	function MakeSettingToggle()
		local co = F("Frame")({
			Name = "Toggle",
			BackgroundColor3 = Color3.fromRGB(50, 50, 50),
			BorderColor3 = Color3.fromRGB(50, 50, 50),
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 25),
			[k] = {
				F("TextLabel")({
					Name = "Title",
					FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
					Text = "Auto Save Enabled",
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextSize = 14,
					TextXAlignment = Enum.TextXAlignment.Left,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					Size = UDim2.new(1, -30, 1, 0),
				}),
				F("UIPadding")({ Name = "UIPadding", PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5) }),
				F("ImageButton")({
					Name = "Switch",
					AnchorPoint = Vector2.new(1, 0.5),
					BackgroundColor3 = Color3.fromRGB(255, 85, 127),
					Position = UDim2.fromScale(1, 0.5),
					Size = UDim2.fromOffset(20, 20),
					[k] = { F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 3) }) },
				}),
			},
		})
	end
	local cp = {}
	for x, y in pairs(m) do
		table.insert(cp, tostring(x))
	end
	MakeSettingDropdown("Library Theme", cp, function(R)
		o = m[R]
		SetTheme()
	end)
	local cq = false
	J(cd, function()
		bP.Visible = true
		bO.Visible = true
		bP.Size = UDim2.new(1, 0, 1, 0)
		bP.BackgroundTransparency = 1
		E(bP, 0.2, "Linear", "In", { BackgroundTransparency = 0.5 })
		E(bO, 0.2, "Quad", "In", { Size = UDim2.new(0.7, 0, 0.7, 0) })
	end)
	local bo = true
	local cr = aW.Size
	local cs = false
	D.InputBegan:Connect(function(a1, cc)
		if cs then
			return
		end
		if not cc and not ca then
			if a1.KeyCode.Name == c9 then
				cs = true
				delay(0.2, function()
					cs = false
				end)
				if bo then
					bo = false
					cr = aW.Size
					E(aW, 0.2, "Quad", "In", { Size = UDim2.new(0, cr.X.Offset, 0, 0) })
					E(bL, 0.2, "Linear", "In", { ImageTransparency = 1 })
				else
					E(aW, 0.2, "Quad", "Out", { Size = cr }, function()
						E(bL, 0.2, "Linear", "In", { ImageTransparency = 0.401 })
					end)
					bo = true
				end
			end
		end
	end)
	local ct = F("TextLabel")({
		Name = "TextLabel",
		Parent = bV,
		Font = Enum.Font.Gotham,
		Text = "Tab",
		TextColor3 = Color3.fromRGB(255, 255, 255),
		TextSize = 13,
		TextTransparency = 0.5,
		AnchorPoint = Vector2.new(0, 0),
		Position = UDim2.new(0, 0, 0, 0),
		TextXAlignment = Enum.TextXAlignment.Left,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		[k] = { F("UIPadding")({ Name = "UIPadding", PaddingLeft = UDim.new(0, 10) }) },
	})
	bU = F("ImageLabel")({
		Name = "PagesHolder",
		Parent = aW,
		Active = true,
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		ClipsDescendants = true,
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, 0, 0, 17),
		Selectable = true,
		Size = UDim2.new(1, -125, 1, -5),
		SelectionGroup = true,
		[k] = {
			F("UIPadding")({
				Name = "UIPadding",
				PaddingBottom = UDim.new(0, 5),
				PaddingLeft = UDim.new(0, 5),
				PaddingRight = UDim.new(0, 5),
				PaddingTop = UDim.new(0, 5),
			}),
		},
	})
	AddtoTheme(bU, "BackgroundColor3", "BackgroundColor")
	local cu = F("UIPageLayout")({
		Name = "PageController",
		EasingDirection = Enum.EasingDirection.Out,
		EasingStyle = Enum.EasingStyle.Quad,
		Padding = UDim.new(0, 10),
		Parent = bU,
		TweenTime = 0.2,
		FillDirection = Enum.FillDirection.Vertical,
		SortOrder = Enum.SortOrder.LayoutOrder,
		GamepadInputEnabled = false,
		ScrollWheelInputEnabled = false,
		TouchInputEnabled = false,
	})
	local cv = { ["list"] = {} }
	local cw = aw.new()
	cw:Connect(function(cx)
		for x, y in next, cv.list do
			if y.Name == cx then
				ct.Text = string.format("#%s", y.Name)
				cu:JumpTo(y.Container)
				E(y.Mini_Button, 0.2, "Quad", "Out", { BackgroundTransparency = 0.401 })
				E(y.Mini_Button.Icon, 0.2, "Quad", "Out", {})
				E(y.Button, 0.2, "Quad", "Out", { BackgroundTransparency = 1 })
				E(y.Button.LeftLine, 0.2, "Quad", "Out", { Size = UDim2.new(0, 1, 0.7, 0) })
				Size =
					UDim2.new(0, 1, 0.8, 0), E(y.Icon, 0.1, "Linear", "Out", { Rotation = 25 }, function()
						E(y.Icon, 0.1, "Linear", "Out", { Rotation = 0 })
					end)
			else
				E(y.Mini_Button, 0.2, "Quad", "Out", { BackgroundTransparency = 1 })
				E(y.Mini_Button.Icon, 0.2, "Quad", "Out", { ImageColor3 = Color3.fromRGB(255, 255, 255) })
				E(y.Button.LeftLine, 0.2, "Quad", "Out", { Size = UDim2.new(0, 1, 0, 0) })
				E(y.Button, 0.2, "Quad", "Out", { BackgroundTransparency = 1 })
			end
		end
	end)
	function cv:NewTab(cy)
		local cz = cy.Name or "Tab"
		local cA = cy.Icon or ""
		local cB = F("Frame")({
			Name = "Tab_Switch",
			Parent = c1,
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundColor3 = Color3.fromRGB(200, 200, 200),
			Position = UDim2.new(0.5, 0, 0, 0),
			Size = UDim2.new(1, 0, 0, 30),
			BorderSizePixel = 0,
			BackgroundTransparency = 0.5,
			[k] = {
				F("Frame")({
					Name = "LeftLine",
					Size = UDim2.new(0, 1, 0, 0),
					Position = UDim2.new(0, 0, 0.5, 0),
					BorderSizePixel = 0,
					AnchorPoint = Vector2.new(0, 0.5),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					[k] = {
						F("UIGradient")({
							Color = o.Gradient and s or r,
							[l] = function(ak)
								AddtoThemeGradient(ak)
							end,
							Rotation = 90,
						}),
					},
				}),
				F("TextLabel")({
					Name = "Title",
					Font = Enum.Font.Gotham,
					Text = cz,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextSize = 13,
					AnchorPoint = Vector2.new(1, 0.5),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					Position = UDim2.new(0.943, 0, 0.5, 0),
					Size = UDim2.new(0.564, 0, 1, 0),
				}),
				F("ImageLabel")({
					Name = "Icon",
					Image = "http://www.roblox.com/asset/?id=" .. tostring(cA),
					BackgroundColor3 = Color3.fromRGB(0, 170, 255),
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 25, 0, 25),
					Position = UDim2.new(0, 5, 0.5, 0),
					AnchorPoint = Vector2.new(0, 0.5),
				}),
				F("UIStroke")({ Name = "UIStroke", Transparency = 1, Color = Color3.fromRGB(255, 255, 255) }),
				F("UIPadding")({ Name = "UIPadding" }),
			},
		})
		local cC = F("Frame")({
			Name = "Tab_Switch",
			Parent = c1,
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundColor3 = Color3.fromRGB(200, 200, 200),
			Position = UDim2.new(0.5, 0, 0, 0),
			Size = UDim2.new(0, 30, 0, 30),
			BorderSizePixel = 0,
			Visible = false,
			BackgroundTransparency = 1,
			[k] = {
				F("ImageLabel")({
					Name = "Icon",
					Image = "http://www.roblox.com/asset/?id=" .. tostring(cA),
					BackgroundColor3 = Color3.fromRGB(0, 170, 255),
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
				}),
			},
		})
		aV = F("ScrollingFrame")({
			Name = "Tab_Container",
			ScrollBarThickness = 0,
			BorderSizePixel = 0,
			CanvasSize = UDim2.new(0, 0, 0, 0),
			Parent = bU,
			AnchorPoint = Vector2.new(1, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			Position = UDim2.new(1, 0, 0.5, 0),
			Size = UDim2.new(1, 0, 1, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			[k] = {
				F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 5) }),
				F("UIPadding")({
					Name = "UIPadding",
					PaddingBottom = UDim.new(0, 5),
					PaddingLeft = UDim.new(0, 5),
					PaddingRight = UDim.new(0, 5),
					PaddingTop = UDim.new(0, 5),
				}),
				F("UIListLayout")({
					Name = "UIListLayout",
					Padding = UDim.new(0, 15),
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
				}),
			},
		})
		local cD = aV:WaitForChild("UIListLayout")
		L(cD, aV)
		bs:Connect(function(R)
			if R == "Vertical" then
				cD.FillDirection = Enum.FillDirection.Vertical
			else
				cD.FillDirection = Enum.FillDirection.Horizontal
			end
		end)
		J(cB, function()
			cw:Fire(cz)
		end)
		J(cC, function()
			cw:Fire(cz)
		end)
		cv["list"][#cv["list"] + 1] = {
			["Name"] = cz,
			["Icon"] = cB.Icon,
			["Title"] = cB.Title,
			["Button"] = cB,
			["Mini_Button"] = cC,
			["Container"] = aV,
		}
		local cE = { Name = cz }
		function cE:Select()
			cw:Fire(cz)
		end
		AddtoTheme(aV, "BackgroundColor3", "TabContainerColor")
		local cF
		local cG
		cF = F("ScrollingFrame")({
			Parent = aV,
			Size = UDim2.new(0.5, -5, 1, 0),
			Position = UDim2.new(0, 0),
			AnchorPoint = Vector2.new(0, 0),
			BackgroundTransparency = 1,
			ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
			ScrollBarThickness = 0,
			BorderSizePixel = 0,
			[k] = {
				F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 5) }),
				F("UIPadding")({
					Name = "UIPadding",
					PaddingBottom = UDim.new(0, 3),
					PaddingLeft = UDim.new(0, 3),
					PaddingRight = UDim.new(0, 3),
					PaddingTop = UDim.new(0, 3),
				}),
				F("UIListLayout")({
					Name = "UIListLayout",
					Padding = UDim.new(0, 17),
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
				}),
			},
		})
		cG = cF:Clone()
		cG.Parent = aV
		cG.Size = UDim2.new(0.5, -5, 1, 0)
		cG.Position = UDim2.new(1, 0)
		cG.AnchorPoint = Vector2.new(1, 0)
		table.insert(aY, cG)
		table.insert(aY, cF)
		table.insert(b1, { Left = cF, Right = cG })
		L(cF.UIListLayout, cF, 20)
		L(cG.UIListLayout, cG, 20)
		bY:Connect(function(b_)
			if b_ == false then
				cB.Visible = false
				cC.Visible = true
			else
				cB.Visible = true
				cC.Visible = false
			end
		end)
		function cE:NewSection(cH)
			local cI = cH["Name"] or "Section"
			local cJ = cH["Side"] or "Left"
			local cK = F("Frame")({
				Name = "MainSection",
				Parent = cJ == "Left" and cF or cG,
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				Position = UDim2.new(0.5, 0, 0, 0),
				Size = UDim2.new(1, 0, 0, 0),
				AnchorPoint = Vector2.new(0.5, 0),
				[k] = {
					F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 3) }),
					F("UIPadding")({
						Name = "UIPadding",
						PaddingBottom = UDim.new(0, 5),
						PaddingLeft = UDim.new(0, 5),
						PaddingRight = UDim.new(0, 5),
						PaddingTop = UDim.new(0, 5),
					}),
					F("UIStroke")({
						Name = "UIStroke",
						Transparency = 0.4,
						Color = o.MainColor,
						[l] = function(ak)
							AddtoTheme(ak, "Color", "SectionFrameColor")
						end,
					}),
					F("Frame")({
						Name = "SecrtionTitle",
						AutomaticSize = Enum.AutomaticSize.X,
						BackgroundColor3 = Color3.fromRGB(30, 30, 30),
						BackgroundTransparency = 0,
						BorderSizePixel = 0,
						Position = UDim2.new(0, 1, 0, -15),
						Size = UDim2.new(0, 0, 0, 25),
						[l] = function(ak)
							AddtoTheme(ak, "BackgroundColor3", "TabContainerColor")
						end,
						[k] = {
							F("TextLabel")({
								Name = "SecrtionTitle",
								Font = Enum.Font.Gotham,
								Text = cI,
								TextColor3 = o.SectionFrameColor,
								TextSize = 16,
								TextXAlignment = Enum.TextXAlignment.Left,
								AutomaticSize = Enum.AutomaticSize.X,
								BackgroundColor3 = Color3.f,
								BackgroundTransparency = 1,
								BorderSizePixel = 0,
								Position = UDim2.new(0, 0, 0, 0),
								Size = UDim2.new(1, 0, 1, 0),
								[l] = function(ak)
									AddtoTheme(ak, "TextColor3", "SectionFrameColor")
								end,
								[k] = {
									F("UIPadding")({
										Name = "UIPadding",
										PaddingBottom = UDim.new(0, 5),
										PaddingLeft = UDim.new(0, 5),
										PaddingRight = UDim.new(0, 5),
										PaddingTop = UDim.new(0, 5),
									}),
								},
							}),
						},
					}),
				},
			})
			AddtoTheme(cK, "BackgroundColor3", "TabContainerColor")
			local ElementHandler = F("Frame")({
				Name = "ElementHandler",
				Parent = cK,
				AnchorPoint = Vector2.new(0.5, 1),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UDim2.new(0.5, 0, 1, 0),
				Size = UDim2.new(1, 0, 1, -7),
				[k] = {},
			})
			local cL = F("UIListLayout")({
				Name = "ElementHandlerList",
				Padding = UDim.new(0, 3),
				Parent = ElementHandler,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
			})
			local cM = function()
				local T = cL.AbsoluteContentSize.Y
				cK.Size = UDim2.new(1, 0, 0, T + 20)
			end
			cM()
			cL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(cM)
			local cN = { flags = {} }
			function cN:Label(cO)
				local cP = cO or "TextLabel"
				local cQ = F("TextLabel")({
					Name = "TextLabel",
					Parent = ElementHandler,
					FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
					Text = cP,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextSize = 13,
					TextWrapped = true,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 25),
				})
				local cR = {}
				setmetatable(cR, {
					__newindex = function(a4, x, y)
						if x == "Text" then
							cQ.Text = tostring(y)
						end
					end,
				})
				return cR
			end
			function cN:Divider(cO)
				local cP = cO or "TextLabel"
				local cQ = F("Frame")({
					Name = "Divider",
					BackgroundColor3 = Color3.fromRGB(30, 30, 30),
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 20),
					Parent = ElementHandler,
					[l] = function(ak)
						AddtoTheme(ak, "BackgroundColor3", "TabContainerColor")
					end,
					[k] = {
						F("TextLabel")({
							Name = "Title",
							FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
							Text = cP,
							TextColor3 = Color3.fromRGB(255, 255, 255),
							TextSize = 13,
							TextWrapped = true,
							AnchorPoint = Vector2.new(0.5, 0.5),
							AutomaticSize = Enum.AutomaticSize.X,
							BackgroundColor3 = Color3.fromRGB(30, 30, 30),
							BorderSizePixel = 0,
							Position = UDim2.fromScale(0.5, 0.5),
							Size = UDim2.fromOffset(0, 25),
							[l] = function(ak)
								AddtoTheme(ak, "BackgroundColor3", "TabContainerColor")
							end,
							[k] = {
								F("UIPadding")({
									Name = "UIPadding",
									PaddingLeft = UDim.new(0, 5),
									PaddingRight = UDim.new(0, 5),
								}),
							},
						}),
						F("Frame")({
							Name = "Line",
							AnchorPoint = Vector2.new(0.5, 0.5),
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.5,
							BorderSizePixel = 0,
							Position = UDim2.fromScale(0.5, 0.5),
							Size = UDim2.new(1, 0, 0, 1),
							ZIndex = -1,
						}),
					},
				})
			end
			function cN:Toggle(cS)
				local cT = cS["Name"] or "Toggle"
				local cU = cS["AutoSave"] or false
				local cV = cS["Callback"] or function() end
				local cW = cS["Flag"] or N(cT)
				local cX = cS["des"] or cS["Info"] or nil
				local cY = cS["Icon"] or nil
				local cZ = F("Frame")({
					Name = "ToggleContainer",
					Parent = ElementHandler,
					BackgroundColor3 = Color3.fromRGB(15, 15, 15),
					Size = UDim2.new(1, 0, 0, cX and 30 or 20),
					BackgroundTransparency = 1,
					ZIndex = 10,
					[k] = {
						F("Frame")({
							Name = "ToggleClickArea",
							AnchorPoint = Vector2.new(0, 0),
							BackgroundTransparency = 1,
							Position = UDim2.new(0, 0, 0, 0),
							Size = UDim2.new(1, 0, 0, 20),
						}),
						F("Frame")({
							Name = "LeftSide",
							AnchorPoint = Vector2.new(0, 0.5),
							Position = UDim2.new(0, 0, 0.5, 0),
							Size = UDim2.new(0.8, 0, 1, 0),
							BackgroundTransparency = 1,
							BackgroundColor3 = Color3.fromRGB(0, 255, 0),
							[k] = {
								F("UIListLayout")({
									Name = "LeftSideList",
									Padding = UDim.new(0, 0),
									HorizontalAlignment = Enum.HorizontalAlignment.Left,
									VerticalAlignment = Enum.VerticalAlignment.Top,
									FillDirection = Enum.FillDirection.Vertical,
									SortOrder = Enum.SortOrder.LayoutOrder,
								}),
								F("Frame")({
									Name = "Toggle_Title_Holder",
									Position = UDim2.new(0, 0, 0, 0),
									AnchorPoint = Vector2.new(0, 0.5),
									Size = UDim2.new(0.8, 0, 0, 20),
									BackgroundTransparency = 1,
									[k] = {
										F("ImageLabel")({
											Size = UDim2.new(0, 15, 0, 15),
											AnchorPoint = Vector2.new(0, 0.5),
											Position = UDim2.new(0, 0, 0.5, 0),
											Image = "http://www.roblox.com/asset/?id=" .. tostring(cY),
											Visible = cY ~= nil,
											BackgroundTransparency = 1,
										}),
										F("TextLabel")({
											Name = "Toggle_Title",
											Font = Enum.Font.Gotham,
											Text = cT,
											TextColor3 = Color3.fromRGB(255, 255, 255),
											TextSize = 13,
											TextTransparency = 0.3,
											TextXAlignment = Enum.TextXAlignment.Left,
											BackgroundColor3 = Color3.fromRGB(255, 255, 255),
											BackgroundTransparency = 1,
											AnchorPoint = Vector2.new(0, 0),
											Position = UDim2.new(0, 0, 0, 0),
											Size = UDim2.new(1, 0, 1, 0),
											[k] = {
												F("UIPadding")({
													Name = "UIPadding",
													PaddingLeft = UDim.new(0, cY ~= nil and 20 or 3),
												}),
											},
										}),
									},
								}),
								F("TextLabel")({
									Name = "Toggle_Description",
									Font = Enum.Font.Gotham,
									Text = g(cX),
									TextColor3 = Color3.fromRGB(255, 255, 255),
									TextSize = 12,
									TextWrapped = true,
									ClipsDescendants = true,
									Visible = true,
									AnchorPoint = Vector2.new(0, 1),
									Position = UDim2.new(0, 0, 1, 0),
									TextTransparency = 0.5,
									TextXAlignment = Enum.TextXAlignment.Left,
									BackgroundColor3 = Color3.fromRGB(255, 255, 255),
									BackgroundTransparency = 1,
									Size = UDim2.new(1, 0, 0, 0),
									[k] = {
										F("Frame")({
											Size = UDim2.new(0, 2, 1, 0),
											AnchorPoint = Vector2.new(0, 0),
											Position = UDim2.new(0, 0),
											BackgroundColor3 = o.MainColor,
											[k] = {
												F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 3) }),
											},
											[l] = function(ak)
												AddtoTheme(ak, "BackgroundColor3", "MainColor")
											end,
										}),
										F("UIPadding")({ Name = "UIPadding", PaddingLeft = UDim.new(0, 5) }),
									},
								}),
							},
						}),
						F("Frame")({
							Name = "RightSide",
							BackgroundTransparency = 1,
							AnchorPoint = Vector2.new(1, 0.5),
							Position = UDim2.new(1, 0, 0.5, 0),
							Size = UDim2.new(0.2, 0, 1, 0),
							BackgroundColor3 = Color3.fromRGB(255, 0, 0),
							[k] = {
								F("ImageLabel")({
									Name = "Toggle_Outline",
									Parent = Toggle_Container,
									Image = "",
									AnchorPoint = Vector2.new(1, 0),
									BackgroundColor3 = o.ToggleBackgroundColor,
									ZIndex = 1000,
									Visible = true,
									BackgroundTransparency = 0,
									Position = UDim2.new(0.966, 0, 0, 0),
									Size = UDim2.new(0, 30, 0, 20),
									[l] = function(ak)
										AddtoTheme(ak, "BackgroundColor3", "ToggleBackgroundColor")
									end,
									[k] = {
										F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 5) }),
										F("UIPadding")({
											Name = "UIPadding",
											PaddingBottom = UDim.new(0, 3),
											PaddingLeft = UDim.new(0, 3),
											PaddingRight = UDim.new(0, 3),
											PaddingTop = UDim.new(0, 3),
										}),
										F("ImageLabel")({
											Name = "Checkmark",
											Image = "",
											AnchorPoint = Vector2.new(0, 0.5),
											BackgroundColor3 = n,
											BackgroundTransparency = 0,
											ImageColor3 = Color3.fromRGB(0, 0, 0),
											ImageTransparency = 1,
											ZIndex = 999,
											Position = UDim2.new(0, 0, 0.5, 0),
											Size = UDim2.new(0, 15, 0, 15),
											[k] = {
												F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 5) }),
												F("UIStroke")({
													Name = "UIStroke",
													ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
													Color = Color3.fromRGB(0, 0, 0),
													Thickness = 1,
													Transparency = 1,
												}),
											},
										}),
									},
								}),
								F("ImageButton")({
									Name = "Toggle_Des",
									Parent = Toggle_Container,
									Image = "http://www.roblox.com/asset/?id=11197746366",
									AnchorPoint = Vector2.new(1, 0),
									BackgroundColor3 = o.MainColor,
									ZIndex = 1000,
									ImageTransparency = 0.5,
									Visible = cX ~= nil,
									AnchorPoint = Vector2.new(1, 0),
									BackgroundTransparency = 1,
									ScaleType = Enum.ScaleType.Stretch,
									Position = UDim2.new(1, -35, 0, 0),
									Size = UDim2.new(0, 20, 0, 20),
									[k] = {},
								}),
							},
						}),
						F("UIStroke")({
							Name = "UIStroke",
							ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
							Color = o.MainColor,
							Thickness = 1,
							Transparency = 1,
						}),
						F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 3) }),
					},
				})
				F("Frame")({
					Name = "BRUH",
					Visible = cX ~= nil,
					Parent = ElementHandler,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 5),
				})
				local c_ = F("Frame")({
					Parent = ElementHandler,
					Size = UDim2.new(1, 0, 0, 50),
					Visible = false,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
				})
				local d0 = F("TextLabel")({
					Name = "Toggle_Description_Test",
					Font = Enum.Font.Gotham,
					Text = tostring(cX),
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextSize = 12,
					Parent = c_,
					TextWrapped = true,
					ClipsDescendants = true,
					AutomaticSize = Enum.AutomaticSize.Y,
					Visible = true,
					AnchorPoint = Vector2.new(0, 1),
					Position = UDim2.new(0, 0, 1, 0),
					TextTransparency = 0.5,
					TextXAlignment = Enum.TextXAlignment.Left,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 0.5,
					Size = UDim2.new(1, 0, 0, 0),
					[k] = { F("UIPadding")({ Name = "UIPadding", PaddingLeft = UDim.new(0, 3) }) },
				})
				local d1 = cZ:WaitForChild("LeftSide")
				local d2 = cZ:WaitForChild("RightSide")
				local d3 = cZ:WaitForChild("ToggleClickArea")
				local d4 = d1:WaitForChild("LeftSideList")
				local d5 = function()
					local T = d4.AbsoluteContentSize.Y
					cZ.Size = UDim2.new(1, 0, 0, T)
				end
				d5()
				d4:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(d5)
				local d6 = d1:WaitForChild("Toggle_Title_Holder")
				local d7 = d6:WaitForChild("Toggle_Title")
				local d8 = d2:WaitForChild("Toggle_Outline")
				local d9 = d1:WaitForChild("Toggle_Description")
				local da = d2:WaitForChild("Toggle_Des")
				local db = d8:WaitForChild("Checkmark")
				local dc = db:WaitForChild("UIStroke")
				local dd = false
				local de = 1
				local df = false
				local dg = game:GetService("TextService")
				d9.TextTransparency = 1
				local function dh()
					if df then
						df = false
						E(da, 0.2, "Linear", "Out", { Rotation = 0 })
						E(d9, 0.2, "Linear", "Out", { TextTransparency = 1 }, function()
							E(d9, 0.2, "Linear", "Out", { Size = UDim2.new(1, 0, 0, 0) })
						end)
					else
						E(da, 0.2, "Linear", "Out", { Rotation = 180 })
						df = true
						local di = UDim2.new(0, d0.AbsoluteSize.X, 0, d0.AbsoluteSize.Y)
						E(d9, 0.2, "Linear", "In", { Size = di }, function()
							E(d9, 0.2, "Linear", "Out", { TextTransparency = 0.5 })
						end)
					end
				end
				da.MouseButton1Click:Connect(function()
					dh()
				end)
				dh()
				local dj = function(an)
					if an then
						dd = true
						E(
							db,
							0.1,
							"Linear",
							"In",
							{ Position = UDim2.new(0.40, 0, 0.5, 0), BackgroundColor3 = o.ToggleDotColor_On }
						)
						E(d8, 0.1, "Linear", "In", { BackgroundColor3 = p("ToggleBackgroundColor_On") })
						E(d7, 0.1, "Linear", "In", { TextTransparency = 0 })
					else
						dd = false
						E(
							db,
							0.1,
							"Linear",
							"In",
							{ Position = UDim2.new(0, 0, 0.5, 0), BackgroundColor3 = o.ToggleDotColor_Off }
						)
						E(d8, 0.1, "Linear", "In", { BackgroundColor3 = p("ToggleBackgroundColor_Off") })
						E(d7, 0.1, "Linear", "In", { TextTransparency = 0.3 })
					end
					cV(dd)
					library["flags"][cW] = dd
					if cU then
						if cW then
							ay[cW] = dd
						else
							error("Autosave require flags")
						end
						aH()
					end
				end
				aS:Connect(function()
					E(d8, 0.1, "Linear", "In", {
						BackgroundColor3 = library["flags"][cW] and p("ToggleBackgroundColor_On")
							or p("ToggleBackgroundColor_Off"),
					})
					E(
						db,
						0.1,
						"Linear",
						"In",
						{ BackgroundColor3 = library["flags"][cW] and o.ToggleDotColor_On or o.ToggleDotColor_Off }
					)
				end)
				if cU then
					if cW and ay[cW] then
						if ay[cW] == true then
							dj(true)
						end
					end
				else
					dj(dropdown_default)
				end
				local dk = J(d3, function()
					if dd then
						dj(false)
					else
						dj(true)
					end
				end, true)
				dk.Instance.MouseEnter:Connect(function()
					E(d2.Toggle_Outline, 0.1, "Linear", "In", { ImageColor3 = o.MainColor })
				end)
				dk.Instance.MouseLeave:Connect(function()
					E(d2.Toggle_Outline, 0.1, "Linear", "In", { ImageColor3 = Color3.fromRGB(255, 255, 255) })
				end)
				cM()
				local dl = F("ImageButton")({
					Name = "Locked",
					Visible = false,
					Parent = cZ,
					Image = "http://www.roblox.com/asset/?id=11197236940",
					ScaleType = Enum.ScaleType.Fit,
					AutoButtonColor = false,
					ZIndex = 1000,
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 0.5,
					Position = UDim2.fromScale(0.5, 0.5),
					Size = UDim2.new(1, 5, 1, 5),
					[k] = { F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 2) }) },
				})
				local dm = {}
				local dn = false
				function dm:Lock(dp)
					dl.Visible = true
				end
				function dm:Unlock(dp)
					dl.Visible = false
				end
				function dm:Set(dp)
					dl.Visible = dj(dp)
				end
				return dm
			end
			function cN:Button(dq)
				local dr = dq["Name"] or "Toggle"
				local ds = dq["Callback"] or function() end
				local dt = dq["Icon"] or "10925108056"
				local du = F("Frame")({
					Name = "ButtonContainer",
					Parent = ElementHandler,
					BackgroundColor3 = n,
					Size = UDim2.new(1, 0, 0, 25),
					[k] = {
						F("UIGradient")({
							Color = o.Gradient and s or r,
							[l] = function(ak)
								AddtoThemeGradient(ak)
							end,
						}),
						F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 3) }),
						F("TextLabel")({
							Name = "TextLabel",
							Font = Enum.Font.Gotham,
							Text = dr,
							TextColor3 = o.FontColor,
							TextSize = 13,
							TextTransparency = 0,
							TextXAlignment = Enum.TextXAlignment.Center,
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 1, 0),
							Position = UDim2.fromScale(0.5, 0.5),
							AnchorPoint = Vector2.new(0.5, 0.5),
							[l] = function(ak)
								AddtoTheme(ak, "TextColor3", "ButtonTextColor")
							end,
						}),
						F("ImageButton")({
							Name = "ImageButton",
							Image = "http://www.roblox.com/asset/?id=" .. tostring(dt),
							AnchorPoint = Vector2.new(1, 0.5),
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 1,
							Position = UDim2.new(0.966, 0, 0.5, 0),
							Size = UDim2.new(0, 20, 0, 20),
							ImageColor3 = o.FontColor,
							[l] = function(ak)
								AddtoTheme(ak, "ImageColor3", "ButtonTextColor")
							end,
							[k] = {
								F("UIPadding")({
									Name = "UIPadding",
									PaddingBottom = UDim.new(0, 3),
									PaddingLeft = UDim.new(0, 3),
									PaddingRight = UDim.new(0, 3),
									PaddingTop = UDim.new(0, 3),
								}),
							},
						}),
					},
				})
				J(du, function()
					ds()
				end)
			end
			function cN:TextBox(dv)
				local dw = dv["Name"] or "Textbox"
				local dx = dv["Default"] or ""
				local dy = dv["Callback"] or function() end
				local dz = dv["AutoSave"] or false
				local dA = dv["Flag"] or N(dw)
				local dB = F("Frame")({
					Parent = ElementHandler,
					Name = "TextBoxContainer",
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundTransparency = 0,
					BackgroundColor3 = Color3.fromRGB(20, 20, 20),
					Position = UDim2.new(0.213, 0, 0.324, 0),
					Size = UDim2.new(1, 0, 0, 40),
					[l] = function(ak)
						AddtoTheme(ak, "BackgroundColor3", "TabContainerColor")
					end,
					[k] = {
						F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 3) }),
						F("TextLabel")({
							Name = "Title",
							Font = Enum.Font.Gotham,
							Text = dw,
							TextColor3 = Color3.fromRGB(255, 255, 255),
							TextSize = 14,
							TextXAlignment = Enum.TextXAlignment.Left,
							AnchorPoint = Vector2.new(0, 0),
							BackgroundColor3 = Color3.fromRGB(20, 20, 20),
							BackgroundTransparency = 0,
							ZIndex = 90,
							BorderSizePixel = 0,
							Position = UDim2.new(0, 5, 0, -4),
							AutomaticSize = Enum.AutomaticSize.X,
							Size = UDim2.new(0, 0, 0, 15),
							[l] = function(ak)
								AddtoTheme(ak, "BackgroundColor3", "TabContainerColor")
							end,
							[k] = { F("UIPadding")({ Name = "UIPadding", PaddingLeft = UDim.new(0, 5) }) },
						}),
						F("UIPadding")({
							Name = "UIPadding",
							PaddingBottom = UDim.new(0, 3),
							PaddingLeft = UDim.new(0, 3),
							PaddingRight = UDim.new(0, 3),
							PaddingTop = UDim.new(0, 3),
						}),
						F("TextBox")({
							Name = "TextInput",
							ClearTextOnFocus = false,
							CursorPosition = -1,
							Font = Enum.Font.Gotham,
							PlaceholderColor3 = Color3.fromRGB(178, 178, 178),
							PlaceholderText = ". . .",
							Text = "",
							TextColor3 = Color3.fromRGB(255, 255, 255),
							TextSize = 14,
							AnchorPoint = Vector2.new(0.5, 0.5),
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 1,
							Position = UDim2.new(0.5, 0, 0.5, 0),
							Size = UDim2.new(1, 0, 0, 25),
							[k] = {
								F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 3) }),
								F("UIStroke")({
									Name = "UIStroke",
									Transparency = 0.5,
									ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
									Color = Color3.fromRGB(255, 255, 255),
								}),
								F("ImageButton")({
									Name = "Clear",
									Image = "rbxassetid://11104757707",
									ImageColor3 = n,
									AnchorPoint = Vector2.new(1, 0.5),
									BackgroundColor3 = Color3.fromRGB(255, 255, 255),
									BackgroundTransparency = 1,
									ImageTransparency = 0,
									Position = UDim2.new(1, 0, 0.5, 0),
									Size = UDim2.new(0, 20, 0, 20),
									[k] = {
										F("UIGradient")({
											Color = o.Gradient and s or r,
											[l] = function(ak)
												AddtoThemeGradient(ak)
											end,
										}),
									},
								}),
							},
						}),
					},
				})
				local dC = dB:WaitForChild("TextInput")
				local dD = dC:WaitForChild("Clear")
				local dE = {}
				function dE:Clear()
					dC.Text = ""
				end
				function dE:Get()
					return tostring(dC.Text)
				end
				function dE:Set(dF)
					dC.Text = tostring(dF)
					library["flags"][dA] = dF
					dy(dF)
					if dz then
						if dA then
							ay[dA] = dF
						else
							error("Autosave require flags")
						end
						aH()
					end
				end
				dC.Focused:Connect(function()
					dD.Visible = false
					E(dC.UIStroke, 0.2, "Linear", "In", { Transparency = 0, Color = o.MainColor })
				end)
				dC.FocusLost:Connect(function()
					dD.Visible = true
					E(dC.UIStroke, 0.2, "Linear", "In", { Transparency = 0.5, Color = n })
					dE:Set(dC.Text)
				end)
				if dz then
					if dA and ay[dA] ~= nil then
						if ay[dA] ~= nil then
							dE:Set(ay[dA])
						end
					end
				else
					dE:Set(dx)
				end
				J(dD, function()
					dE:Clear()
				end)
				return dE
			end
			function cN:Slider(dG)
				local dH = dG["Name"] or "slider"
				local dI = dG["Default"] or dG["Value"] or 0
				local dJ = dG["Callback"] or function() end
				local dK = dG["AutoSave"] or false
				local dL = dG["Flag"] or N(dH)
				local dM = dG["Min"] or 0
				local dN = dG["Max"] or 1
				local dO = F("Frame")({
					Parent = ElementHandler,
					Name = "sliderContainer",
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundTransparency = 0,
					BackgroundColor3 = Color3.fromRGB(20, 20, 20),
					Position = UDim2.new(0.213, 0, 0.324, 0),
					Size = UDim2.new(1, 0, 0, 40),
					[l] = function(ak)
						AddtoTheme(ak, "BackgroundColor3", "TabContainerColor")
					end,
					[k] = {
						F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 3) }),
						F("TextLabel")({
							Name = "Title",
							Font = Enum.Font.Gotham,
							Text = dH,
							TextColor3 = Color3.fromRGB(255, 255, 255),
							TextSize = 14,
							TextXAlignment = Enum.TextXAlignment.Left,
							AnchorPoint = Vector2.new(0, 0),
							BackgroundColor3 = Color3.fromRGB(20, 20, 20),
							BackgroundTransparency = 0,
							ZIndex = 20,
							BorderSizePixel = 0,
							Position = UDim2.new(0, 10, 0, -4),
							AutomaticSize = Enum.AutomaticSize.X,
							Size = UDim2.new(0, 0, 0, 15),
							[l] = function(ak)
								AddtoTheme(ak, "BackgroundColor3", "TabContainerColor")
							end,
							[k] = { F("UIPadding")({ Name = "UIPadding", PaddingLeft = UDim.new(0, 5) }) },
						}),
						F("UIPadding")({
							Name = "UIPadding",
							PaddingBottom = UDim.new(0, 3),
							PaddingLeft = UDim.new(0, 3),
							PaddingRight = UDim.new(0, 3),
							PaddingTop = UDim.new(0, 3),
						}),
						F("TextButton")({
							Name = "TextInput",
							Font = Enum.Font.Gotham,
							Text = "",
							TextColor3 = Color3.fromRGB(255, 255, 255),
							TextSize = 14,
							AnchorPoint = Vector2.new(0.5, 0.5),
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 1,
							Position = UDim2.new(0.5, 0, 0.5, 0),
							Size = UDim2.new(1, 0, 0, 25),
							[k] = {
								F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 3) }),
								F("UIStroke")({
									Name = "UIStroke",
									Transparency = 0.5,
									ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
									Color = Color3.fromRGB(255, 255, 255),
								}),
								F("ImageButton")({
									Name = "Clear",
									Image = "rbxassetid://11144672563",
									ImageColor3 = n,
									AnchorPoint = Vector2.new(1, 0.5),
									BackgroundColor3 = Color3.fromRGB(255, 255, 255),
									BackgroundTransparency = 1,
									ImageTransparency = 0,
									Position = UDim2.new(1, 0, 0.5, 3),
									Size = UDim2.new(0, 20, 0, 20),
									[k] = {
										F("UIGradient")({
											Color = o.Gradient and s or r,
											[l] = function(ak)
												AddtoThemeGradient(ak)
											end,
										}),
									},
								}),
							},
						}),
					},
				})
				local dC = dO:WaitForChild("TextInput")
				local dD = dC:WaitForChild("Clear")
				local dP = {}
				local dQ = F("TextButton")({
					Parent = dO,
					Text = "",
					AutoButtonColor = false,
					Size = UDim2.new(1, -40, 0, 3),
					Position = UDim2.new(0, 10, 0.5, 0),
					BackgroundColor3 = Color3.fromRGB(100, 100, 100),
					AnchorPoint = Vector2.new(0, 0.5),
					[k] = { F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 4) }) },
				})
				local dR = F("TextBox")({
					Name = "Title",
					Parent = dO,
					PlaceholderText = ". . .",
					Font = Enum.Font.Gotham,
					Text = dI,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextSize = 10,
					TextXAlignment = Enum.TextXAlignment.Center,
					AnchorPoint = Vector2.new(1, 0),
					BackgroundColor3 = Color3.fromRGB(20, 20, 20),
					BackgroundTransparency = 0,
					ZIndex = 90,
					BorderSizePixel = 0,
					Position = UDim2.new(1, 0, 0, -4),
					AutomaticSize = Enum.AutomaticSize.X,
					Size = UDim2.new(0, 30, 0, 15),
					[l] = function(ak)
						AddtoTheme(ak, "BackgroundColor3", "TabContainerColor")
					end,
					[k] = {
						F("UIStroke")({
							Name = "UIStroke",
							Transparency = 0.5,
							ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
							Color = Color3.fromRGB(255, 255, 255),
						}),
						F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 4) }),
						F("UIPadding")({ Name = "UIPadding" }),
					},
				})
				local dS = F("ImageButton")({
					Parent = dQ,
					Size = UDim2.fromOffset(10, 10),
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.fromScale(0.4, 0.5),
					BackgroundTransparency = o.MainColor,
					AutoButtonColor = false,
					ZIndex = 40,
					BackgroundColor3 = n,
					[k] = { F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(1, 0) }) },
				})
				local dT = F("ImageButton")({
					Parent = dS,
					Size = UDim2.fromOffset(30, 30),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					BackgroundTransparency = o.MainColor,
					AutoButtonColor = false,
					Visible = false,
					BackgroundTransparency = 1,
					ZIndex = 50,
					BackgroundColor3 = n,
					[k] = { F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(1, 0) }) },
				})
				local dU = F("Frame")({
					Parent = dQ,
					Size = UDim2.new(1, 0, 1, 0),
					Position = UDim2.new(0, 0, 0.5, 0),
					BackgroundColor3 = n,
					AnchorPoint = Vector2.new(0, 0.5),
					[k] = {
						F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 4) }),
						F("UIGradient")({
							Color = o.Gradient and s or r,
							[l] = function(ak)
								AddtoThemeGradient(ak)
							end,
							Rotation = 180,
						}),
					},
				})
				local dV = F("ImageButton")({
					AutoButtonColor = false,
					Parent = dO,
					Size = UDim2.new(1, -20, 0.7, 0),
					Position = UDim2.fromScale(0, 1),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundTransparency = 1,
				})
				local dW = false
				local dX = false
				local dY = dI
				local function dZ(d_)
					E(dS, 0.05, "Linear", "In", { Position = UDim2.new(d_, -5, 0.5, 0) })
					E(dU, 0.05, "Linear", "In", { Size = UDim2.new(d_, -5, 1, 0) })
				end
				dR.Focused:Connect(function()
					E(dR.UIStroke, 0.2, "Linear", "In", { Transparency = 0, Color = o.AccentColor })
				end)
				function dP:Set(e0)
					local e1 = dM
					local e2 = dN
					local d_ = (e0 - e1) * 100 / (e2 - e1)
					dR.Text = tostring(math.round(e0))
					dZ(math.clamp(d_ / 100, 0, 1))
					library.flags[dL] = e0
					if dK then
						ay[dL] = e0
						aH()
					end
					dJ(e0)
				end
				dR.FocusLost:Connect(function()
					E(dR.UIStroke, 0.2, "Linear", "In", { Transparency = 0.5, Color = n })
					local e3 = tonumber(dR.Text)
					if e3 then
						if e3 > dN then
							e3 = dN
						end
						if e3 < dM then
							e3 = dM
						end
						dP:Set(e3)
						dR.Text = tostring(e3)
					else
						dP:Set(currentnumber)
						dR.Text = tostring(currentnumber)
					end
				end)
				local currentnumber = dI
				local function e4()
					local e1 = dM
					local e2 = dN
					local e5 = dY * 100 / 100 * dN
					E(dT, 0.2, "Linear", "In", { BackgroundTransparency = 0.5 })
					E(
						dS,
						0.2,
						"Linear",
						"In",
						{ Size = UDim2.fromOffset(14, 14), BackgroundTransparency = 0, BackgroundColor3 = o.MainColor }
					)
					repeat
						wait()
						dY = math.clamp((A.X - dQ.AbsolutePosition.X) / dQ.AbsoluteSize.X, 0, 1)
						dZ(dY)
						e5 = tonumber(dY * e2 / e2 * (e2 - e1) + e1)
						dR.Text = tostring(math.round(e5))
					until not dW
					currentnumber = e5
					dP:Set(e5)
					E(dT, 0.2, "Linear", "In", { BackgroundTransparency = 1 })
					E(
						dS,
						0.2,
						"Linear",
						"In",
						{ BackgroundTransparency = 0, BackgroundColor3 = n, Size = UDim2.fromOffset(10, 10) }
					)
				end
				D.InputBegan:Connect(function(a1, cc)
					if a1.UserInputType == Enum.UserInputType.MouseButton1 then
						if dW then
							dW = false
							return
						end
						if dX == true and not dW then
							dW = true
							E(dT, 0.2, "Linear", "In", { ImageTransparency = 0.5 })
							e4()
						end
					end
				end)
				D.InputEnded:Connect(function(a1, cc)
					if a1.UserInputType == Enum.UserInputType.MouseButton1 then
						if dW then
							dW = false
							return
						end
					end
				end)
				dV.MouseEnter:Connect(function()
					dX = true
				end)
				dV.MouseLeave:Connect(function()
					dX = false
				end)
				if dK then
					if dL and ay[dL] ~= nil then
						if ay[dL] ~= nil then
							dP:Set(ay[dL])
						end
					end
				else
					dP:Set(dI)
				end
				J(dD, function()
					dP:Set(dI)
				end)
				return dP
			end
			function cN:Dropdown(e6)
				local e7 = e6["Name"] or "Dropdown"
				local e8 = e6["Callback"] or function() end
				local e9 = e6["List"] or e6["list"] or {}
				local dropdown_default = e6["Default"] or e6["default"] or nil
				local ea = e6["AutoSave"] or false
				local eb = e6["Flag"] or N(e7)
				local ec = e6["Static"] or e6["Keep"] or false
				local ed = F("Frame")({
					Name = "DropdownContainer",
					Parent = ElementHandler,
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundTransparency = 1,
					Position = UDim2.new(0.213, 0, 0.324, 0),
					Size = UDim2.new(1, 0, 0, 40),
					[k] = {
						F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 3) }),
						F("UIStroke")({
							Name = "UIStroke",
							Transparency = 1,
							ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
							Color = o.MainColor,
							[l] = function(ak)
								AddtoTheme(ak, "Color", "MainColor")
							end,
						}),
					},
				})
				local ck = F("Frame")({
					Name = "DropdownContainer",
					Parent = ed,
					BorderSizePixel = 0,
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundColor3 = Color3.fromRGB(20, 20, 20),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Size = UDim2.new(1, 0, 1, 0),
					[l] = function(ak)
						AddtoTheme(ak, "BackgroundColor3", "DropdownBackgroundColor")
					end,
					[k] = {
						F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 3) }),
						F("TextLabel")({
							Name = "Title",
							Font = Enum.Font.Gotham,
							Text = e7,
							TextColor3 = Color3.fromRGB(255, 255, 255),
							TextSize = 14,
							TextXAlignment = Enum.TextXAlignment.Left,
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 1,
							Position = UDim2.new(0.00575, 0, 0, 0),
							Size = UDim2.new(0.7, 0, 0, 19),
						}),
						F("UIPadding")({
							Name = "UIPadding",
							PaddingBottom = UDim.new(0, 3),
							PaddingLeft = UDim.new(0, 7),
							PaddingRight = UDim.new(0, 7),
							PaddingTop = UDim.new(0, 3),
						}),
						F("TextLabel")({
							Name = "Display",
							Font = Enum.Font.Gotham,
							Text = dropdown_default or "N/A",
							TextColor3 = Color3.fromRGB(255, 255, 255),
							TextSize = 13,
							TextTransparency = 0.5,
							TextXAlignment = Enum.TextXAlignment.Left,
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 1,
							Position = UDim2.new(0.00575, 0, 0.529, 0),
							Size = UDim2.new(0.7, 0, -0.235, 19),
						}),
						F("ImageLabel")({
							Name = "Icon",
							Image = "rbxassetid://10934039279",
							AnchorPoint = Vector2.new(1, 0.5),
							BackgroundColor3 = Color3.fromRGB(30, 30, 30),
							Position = UDim2.new(1, 0, 0.5, 0),
							Size = UDim2.new(0, 30, 0, 30),
							[l] = function(ak)
								AddtoTheme(ak, "ImageColor3", "MainColor")
								AddtoTheme(ak, "BackgroundColor3", "BackgroundColor")
							end,
							[k] = { F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 5) }) },
						}),
					},
				})
				local ee = F("Frame")({
					Parent = ElementHandler,
					Name = "DropdownHandler",
					BorderSizePixel = 0,
					ClipsDescendants = true,
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundColor3 = Color3.fromRGB(40, 40, 40),
					Position = UDim2.new(0.5, 0, 0.412, 0),
					Size = UDim2.new(1, 0, 0.162, 40),
					[l] = function(ak)
						AddtoTheme(ak, "BackgroundColor3", "DropdownBackgroundColor")
					end,
					[k] = {
						F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 3) }),
						F("UIPadding")({
							Name = "UIPadding",
							PaddingBottom = UDim.new(0, 3),
							PaddingLeft = UDim.new(0, 3),
							PaddingRight = UDim.new(0, 3),
							PaddingTop = UDim.new(0, 3),
						}),
						F("TextBox")({
							Name = "Searchbox",
							Font = Enum.Font.Gotham,
							PlaceholderText = "Search ...",
							Text = "",
							TextColor3 = Color3.fromRGB(255, 255, 255),
							TextSize = 14,
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, 20),
							[k] = {
								F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 3) }),
								F("UIStroke")({
									Name = "UIStroke",
									Transparency = 0.5,
									ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
									Color = Color3.fromRGB(255, 255, 255),
								}),
							},
						}),
					},
				})
				local ef = F("ScrollingFrame")({
					Name = "DropdownButtonHolder",
					Parent = ee,
					BorderSizePixel = 0,
					ScrollBarImageColor3 = Color3.fromRGB(200, 200, 200),
					ScrollBarThickness = 2,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundColor3 = Color3.fromRGB(50, 50, 50),
					Position = UDim2.new(0.5, 0, 0, 25),
					Size = UDim2.new(1, 0, 1, -25),
					CanvasSize = UDim2.new(0, 0, 0, 0),
					[k] = {
						F("UICorner")({ Name = "UICorner", CornerRadius = UDim.new(0, 3) }),
						F("UIPadding")({
							Name = "UIPadding",
							PaddingBottom = UDim.new(0, 3),
							PaddingLeft = UDim.new(0, 3),
							PaddingRight = UDim.new(0, 3),
							PaddingTop = UDim.new(0, 3),
						}),
					},
				})
				local eg = F("UIListLayout")({
					Name = "UIListLayout",
					Parent = ef,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
				})
				local bl = ck:WaitForChild("Title")
				local bk = ck:WaitForChild("Icon")
				local eh = ck:WaitForChild("Display")
				local ei = ee:WaitForChild("Searchbox")
				local ej = {}
				ei.Focused:Connect(function()
					E(ei.UIStroke, 0.2, "Linear", "In", { Transparency = 0, Color = o.AccentColor })
				end)
				ei.FocusLost:Connect(function()
					E(ei.UIStroke, 0.2, "Linear", "In", { Transparency = 0.5, Color = n })
				end)
				ei:GetPropertyChangedSignal("Text"):Connect(function()
					for x, y in pairs(ej) do
						if y.Instance ~= nil then
							if y.Instance.Text:lower():find(ei.Text:lower()) then
								y:Show()
							else
								y:Hide()
							end
						end
					end
				end)
				local ek = false
				local el = 130
				local em = function() end
				local en = function()
					if ek then
						local T = eg.AbsoluteContentSize.Y
						if T <= el then
							ee.Size = UDim2.new(1, 0, 0, T + 35)
							ef.CanvasSize = UDim2.fromOffset(0, 0)
						else
							ee.Size = UDim2.new(1, 0, 0, el + 5)
							ef.CanvasSize = UDim2.fromOffset(0, T + 20)
						end
					end
				end
				local function dj(dF)
					eh.Text = tostring(dF)
					e8(dF)
					library.flags[eb] = dF
					if ea then
						if eb then
							ay[eb] = dF
						else
							error("Autosave require flags")
						end
						aH()
					end
				end
				if ea then
					if ay[eb] ~= nil then
						dj(ay[eb])
						library.flags[eb] = ay[eb]
					else
						dj(dropdown_default)
						library.flags[eb] = dropdown_default
					end
				else
					dj(dropdown_default)
					library.flags[eb] = dropdown_default
				end
				local function eo(an)
					if an then
						ek = true
						bk.BackgroundTransparency = 1
						E(bk, 0.2, "Quad", "Out", { Rotation = 180 }, function()
							bk.BackgroundTransparency = 0
						end)
						local ep = 0
						for x, y in pairs(ef:GetChildren()) do
							if y:IsA("TextButton") then
								ep = ep + y.Size.Y.Offset
							end
						end
						if ep <= el then
							ee.Visible = true
							E(ee, 0.2, "Quad", "Out", { Size = UDim2.new(1, 0, 0, ep + 35) })
						else
							E(ee, 0.2, "Quad", "Out", { Size = UDim2.new(1, 0, 0, el + 10) }, function()
								en()
							end)
						end
					else
						ek = false
						bk.BackgroundTransparency = 1
						E(bk, 0.2, "Quad", "Out", { Rotation = 0 }, function()
							bk.BackgroundTransparency = 0
						end)
						E(ee, 0.2, "Quad", "Out", { Size = UDim2.new(1, 0, 0, 0) })
					end
				end
				local eq = function(er)
					local es = F("TextButton")({
						Name = "DropdownButton",
						Font = Enum.Font.Gotham,
						TextColor3 = Color3.fromRGB(255, 255, 255),
						TextSize = 13,
						Text = er,
						AnchorPoint = Vector2.new(0.5, 0),
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1,
						TextTransparency = 0.5,
						Size = UDim2.new(1, 0, 0, 20),
						Parent = ef,
					})
					J(es, function()
						dj(es.Text)
						if not ec then
							eo(false)
						end
					end)
					es.MouseEnter:Connect(function()
						E(es, 0.1, "Linear", "In", { TextTransparency = 0 })
					end)
					es.MouseLeave:Connect(function()
						E(es, 0.1, "Linear", "In", { TextTransparency = 0.5 })
					end)
					local et = { Instance = es, Name = er }
					function et:Destroy()
						es:Destroy()
					end
					function et:Hide()
						es.Visible = false
					end
					function et:Show()
						es.Visible = true
					end
					ej[#ej + 1] = et
				end
				for x, y in pairs(e9) do
					eq(y)
				end
				eo(false)
				eg:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(en)
				en()
				J(ed, function()
					if ek then
						eo(false)
					else
						eo(true)
					end
				end)
				local eu = {}
				function eu:Add(dF)
					if tostring(dF) ~= "" and tostring(dF) ~= "nil" then
						eq(dF)
					end
				end
				function eu:Set(ev)
					dj(ev)
				end
				function eu:Clear(ev)
					for x, y in pairs(ej) do
						y:Destroy()
					end
				end
				function eu:Get()
					return library[flags][eb]
				end
				function eu:Remove(e3)
					for x, y in pairs(ej) do
						if y.Name == e3 then
							y:Destroy()
						end
					end
				end
				function eu:GetList()
					do
						local ew = {}
						for x, y in pairs(ej) do
							if y.Name ~= nil then
								ew[#ew + 1] = y.Name
							end
						end
						return ew
					end
				end
				function eu:Refresh(ex)
					do
						self:Clear()
						for x, y in pairs(ex) do
							eq(y)
						end
					end
				end
				return eu
			end
			return cN
		end
		return cE
	end
	return cv
end
return library
