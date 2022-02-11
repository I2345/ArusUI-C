local UserInputService = game:GetService("UserInputService")

local HoldingCrouch = false

local lib = {}

function lib:addUI(title, enableClose)
	
	if game.CoreGui:FindFirstChild("ArusUI") then
		game.CoreGui:FindFirstChild("ArusUI"):Destroy()
	end
	
	local Arus_UIC = Instance.new("ScreenGui")
	local MainFrame = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local Container = Instance.new("Frame")
	local CON = Instance.new("ScrollingFrame")
	local UIGridLayout = Instance.new("UIGridLayout")
	local TestFrame = Instance.new("Frame")
	local TestFrame_2 = Instance.new("Frame")
	
	Arus_UIC.Name = "ArusUI"
	Arus_UIC.Parent = game.CoreGui
	Arus_UIC.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Arus_UIC.DisplayOrder = 100

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = Arus_UIC
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.BackgroundColor3 = Color3.fromRGB(0, 12, 255)
	MainFrame.BackgroundTransparency = 0.200
	MainFrame.BorderSizePixel = 0
	MainFrame.Position = UDim2.new(0.806990862, 0, 0.5, 0)
	MainFrame.Size = UDim2.new(0, 243, 0, 591)

	Title.Name = "Title"
	Title.Parent = MainFrame
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.0864197537, 0, 0, 0)
	Title.Size = UDim2.new(0, 200, 0, 50)
	Title.Font = Enum.Font.GothamSemibold
	Title.Text = title
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 21.000

	Container.Name = "Container"
	Container.Parent = MainFrame
	Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Container.BackgroundTransparency = 1.000
	Container.Position = UDim2.new(0.0658436194, 0, 0.0846023709, 0)
	Container.Size = UDim2.new(0, 211, 0, 541)

	CON.Name = "CON"
	CON.Parent = Container
	CON.Active = true
	CON.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CON.BackgroundTransparency = 1.000
	CON.Size = UDim2.new(0, 211, 0, 541)
	CON.ScrollBarThickness = 0

	UIGridLayout.Parent = CON
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellSize = UDim2.new(0, 210, 0, 50)

	TestFrame.Name = "TestFrame"
	TestFrame.Parent = Arus_UIC
	TestFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	TestFrame.BackgroundColor3 = Color3.fromRGB(0, 209, 255)
	TestFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
	TestFrame.BorderSizePixel = 0
	TestFrame.Position = UDim2.new(0.875987828, 0, 0.5, 0)
	TestFrame.Size = UDim2.new(0, 16, 0, 591)

	TestFrame_2.Name = "TestFrame"
	TestFrame_2.Parent = Arus_UIC
	TestFrame_2.AnchorPoint = Vector2.new(0.5, 0.5)
	TestFrame_2.BackgroundColor3 = Color3.fromRGB(0, 209, 255)
	TestFrame_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
	TestFrame_2.BorderSizePixel = 0
	TestFrame_2.Position = UDim2.new(0.737993896, 0, 0.5, 0)
	TestFrame_2.Size = UDim2.new(0, 16, 0, 591)
	
	local win = {}
	
	function win:addButton(name, fc)
		
		fc = fc or function() end
		
		local TextButton = Instance.new("TextButton")
		
		TextButton.Parent = CON
		TextButton.BackgroundColor3 = Color3.fromRGB(0, 115, 255)
		TextButton.BackgroundTransparency = 0.200
		TextButton.BorderSizePixel = 0
		TextButton.Size = UDim2.new(0, 200, 0, 50)
		TextButton.Font = Enum.Font.GothamSemibold
		TextButton.Text = name
		TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextButton.TextSize = 23.000
		
		TextButton.MouseButton1Click:Connect(fc)
		
	end
	
	return win
	
end

UserInputService.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.LeftControl then
		HoldingCrouch = true
	end
end)

UserInputService.InputChanged:Connect(function(input)
	
	if input.KeyCode == Enum.KeyCode.V then
		if HoldingCrouch then
			if game.CoreGui:FindFirstChild("ArusUI") then
				if game.CoreGui:FindFirstChild("ArusUI").Enabled then
					game.CoreGui:FindFirstChild("ArusUI").Enabled = false
				else
					game.CoreGui:FindFirstChild("ArusUI").Enabled = true
				end
			end
		end
	end
	
end)

UserInputService.InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.LeftControl then
		HoldingCrouch = false
	end
end)


return lib
