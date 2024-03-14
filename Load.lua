
local CoreGui = game.CoreGui
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local Library = {}

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
		Tween:Play()
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end

function CreateGUiOpen()

	local AXCScreenGui = Instance.new("ScreenGui")
	local AXCFrame = Instance.new("TextButton")
	local AXCCor = Instance.new("UICorner")
	local MODILEMAGE = Instance.new("ImageLabel")

	AXCScreenGui.Name = "AXCScreenGui"
	AXCScreenGui.Parent = CoreGui
	AXCScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	AXCFrame.Name = "AXCFrame"
	AXCFrame.Parent = AXCScreenGui
	AXCFrame.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
	AXCFrame.BorderSizePixel = 0
	AXCFrame.Draggable = true
	AXCFrame.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
	AXCFrame.Size = UDim2.new(0, 50, 0, 50)
	AXCFrame.Font = Enum.Font.SourceSans
	AXCFrame.Text = ""
	AXCFrame.TextColor3 = Color3.fromRGB(0, 0, 0)
	AXCFrame.TextSize = 14.000
	AXCFrame.MouseButton1Click:Connect(function()
		CoreGui.EvoHub.Main.Position = UDim2.new(0.41776669, -314, 0.194183752, -85)
		CoreGui.AXCScreenGui:Destroy()
	end)

	AXCCor.Name = "AXCCor"
	AXCCor.Parent = AXCFrame

	MODILEMAGE.Name = "MODILEMAGE"
	MODILEMAGE.Parent = AXCFrame
	MODILEMAGE.BackgroundColor3 = Color3.fromRGB(192, 192, 192)
	MODILEMAGE.BackgroundTransparency = 1.000
	MODILEMAGE.BorderSizePixel = 0
	MODILEMAGE.Size = UDim2.new(0, 50, 0, 50)
	MODILEMAGE.Image = "rbxassetid://13990972098"
end

function Library:CreateWindow(name)

	local EvoHub = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local Drag = Instance.new("Frame")
	local Title = Instance.new("Frame")
	local TitleCorner = Instance.new("UICorner")
	local TitleBack = Instance.new("Frame")
	local TitleBackCorner = Instance.new("UICorner")
	local Frame = Instance.new("Frame")
	local TitleText = Instance.new("TextLabel")
	local HideButton = Instance.new("TextButton")
	local Button_Hide = Instance.new("ImageButton")
	local CloseButton = Instance.new("TextButton")
	local Button_Close = Instance.new("ImageButton")
	local Logo = Instance.new("ImageLabel")
	local TabContainer = Instance.new("ScrollingFrame")
	local TabGrid = Instance.new("UIGridLayout")
	local ContentContainer = Instance.new("Folder")

	EvoHub.Name = "EvoHub"
	EvoHub.Parent = CoreGui
	EvoHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Main.Name = "Main"
	Main.Parent = EvoHub
	Main.BackgroundColor3 = Color3.fromRGB(15, 16, 17)
	Main.BackgroundTransparency = 0
	Main.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.41776669, -314, 0.194183752, -85)
	Main.Size = UDim2.new(0, 694, 0, 491)
	Main.ClipsDescendants = true

	Drag.Name = "Drag"
	Drag.Parent = Main
	Drag.BackgroundTransparency = 1.000
	Drag.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Drag.Size = UDim2.new(1, 0, 0, 35)

	Title.Name = "Title"
	Title.Parent = Main
	Title.BackgroundColor3 = Color3.fromRGB(31, 32, 33)
	Title.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Title.Size = UDim2.new(1, 0, 0.0113636367, 25)

	TitleCorner.CornerRadius = UDim.new(0, 4)
	TitleCorner.Name = "TitleCorner"
	TitleCorner.Parent = Title

	TitleBack.Name = "TitleBack"
	TitleBack.Parent = Title
	TitleBack.BackgroundColor3 = Color3.fromRGB(25, 26, 27)
	TitleBack.BorderColor3 = Color3.fromRGB(27, 42, 53)
	TitleBack.BorderSizePixel = 0
	TitleBack.Position = UDim2.new(0, 1, 0, 1)
	TitleBack.Size = UDim2.new(1, -2, 1.27999997, -2)

	TitleBackCorner.CornerRadius = UDim.new(0, 5)
	TitleBackCorner.Name = "TitleBackCorner"
	TitleBackCorner.Parent = TitleBack

	Frame.Parent = TitleBack
	Frame.BackgroundColor3 = Color3.fromRGB(25, 26, 27)
	Frame.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0, 0, 0.633333325, 0)
	Frame.Size = UDim2.new(1, 0, 0.366666675, 0)

	TitleText.Name = "TitleText"
	TitleText.Parent = TitleBack
	TitleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TitleText.BackgroundTransparency = 1.000
	TitleText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TitleText.BorderSizePixel = 0
	TitleText.Position = UDim2.new(0.0108024618, 0, 0, 0)
	TitleText.Size = UDim2.new(0.312870204, 0, 0.999999881, 0)
	TitleText.Font = Enum.Font.Highway
	TitleText.Text = name
	TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
	TitleText.TextSize = 30.000

	HideButton.Name = "HideButton"
	HideButton.Parent = TitleBack
	HideButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	HideButton.BackgroundTransparency = 1.000
	HideButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	HideButton.BorderSizePixel = 0
	HideButton.Position = UDim2.new(0.888888955, 0, 0, 0)
	HideButton.Size = UDim2.new(-0.020833334, 50, 1, 0)
	HideButton.Font = Enum.Font.SourceSans
	HideButton.Text = ""
	HideButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	HideButton.TextSize = 14.000

	Button_Hide.Name = "Button_Hide"
	Button_Hide.Parent = HideButton
	Button_Hide.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Button_Hide.BackgroundTransparency = 1.000
	Button_Hide.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Button_Hide.BorderSizePixel = 0
	Button_Hide.Position = UDim2.new(0.277205467, 0, 0.200000003, 0)
	Button_Hide.Size = UDim2.new(0, 17, 0, 17)
	Button_Hide.Image = "rbxassetid://3926307971"
	Button_Hide.ImageColor3 = Color3.fromRGB(157, 157, 157)
	Button_Hide.ImageRectOffset = Vector2.new(884, 284)
	Button_Hide.ImageRectSize = Vector2.new(36, 36)
	Button_Hide.MouseButton1Click:Connect(function()
		Main.Position = UDim2.new(1000.41776669, -314, 1000.194183752, -85)
		CreateGUiOpen()
	end)    

	CloseButton.Name = "CloseButton"
	CloseButton.Parent = TitleBack
	CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CloseButton.BackgroundTransparency = 1.000
	CloseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CloseButton.BorderSizePixel = 0
	CloseButton.Position = UDim2.new(0.945216119, 0, 0, 0)
	CloseButton.Size = UDim2.new(-0.020833334, 50, 1, 0)
	CloseButton.Font = Enum.Font.SourceSans
	CloseButton.Text = ""
	CloseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	CloseButton.TextSize = 14.000

	Button_Close.Name = "Button_Close"
	Button_Close.Parent = CloseButton
	Button_Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Button_Close.BackgroundTransparency = 1.000
	Button_Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Button_Close.BorderSizePixel = 0
	Button_Close.Position = UDim2.new(0.295205474, 0, 0.200000003, 0)
	Button_Close.Size = UDim2.new(0, 17, 0, 17)
	Button_Close.Image = "rbxassetid://3926305904"
	Button_Close.ImageColor3 = Color3.fromRGB(157, 157, 157)
	Button_Close.ImageRectOffset = Vector2.new(924, 724)
	Button_Close.ImageRectSize = Vector2.new(36, 36)
	Button_Close.MouseButton1Click:Connect(function()
		game.CoreGui.EvoHub:Destroy()
	end)    

	Logo.Name = "Logo"
	Logo.Parent = TitleBack
	Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Logo.BackgroundTransparency = 1.000
	Logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Logo.BorderSizePixel = 0
	Logo.Position = UDim2.new(0, 0, -0.0269238297, 0)
	Logo.Size = UDim2.new(0, 38, 0, 38)
	Logo.Image = "rbxassetid://13990972098"

	TabContainer.Name = "TabContainer"
	TabContainer.Parent = Main
	TabContainer.Active = true
	TabContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabContainer.BackgroundTransparency = 1.000
	TabContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabContainer.BorderSizePixel = 0
	TabContainer.Position = UDim2.new(0.00200001104, 0, 0.105000079, 0)
	TabContainer.Size = UDim2.new(0.00592013262, 125, 0.894999921, 0)
	TabContainer.ScrollBarThickness = 2
	local PageOrders = -1
	TabGrid.Name = "TabGrid"
	TabGrid.Parent = TabContainer
	TabGrid.SortOrder = Enum.SortOrder.LayoutOrder
	TabGrid.CellPadding = UDim2.new(0, 0, 0, 3)
	TabGrid.CellSize = UDim2.new(1, 0, 0, 40)

	ContentContainer.Name = "ContentContainer"
	ContentContainer.Parent = Main
	
	local UIPage = Instance.new('UIPageLayout',ContentContainer)
	UIPage.SortOrder = Enum.SortOrder.LayoutOrder
	UIPage.EasingDirection = Enum.EasingDirection.InOut
	UIPage.EasingStyle = Enum.EasingStyle.Quad
	UIPage.HorizontalAlignment = Enum.HorizontalAlignment.Right
	UIPage.VerticalAlignment = Enum.VerticalAlignment.Center
	UIPage.Padding = UDim.new(0.5, 0)
	UIPage.TweenTime = 0.5


	MakeDraggable(Title,Main)

	local TabCreate = {}

	function TabCreate:CreateTab(name)
		PageOrders = PageOrders + 1
		local Tab = Instance.new("Frame")
		local TabDetector = Instance.new("TextButton")
		local TabTitle = Instance.new("TextLabel")
		local ContentScrolling = Instance.new("ScrollingFrame")
		local ContentFrame = Instance.new("Frame")
		local UIListLayout = Instance.new("UIListLayout")
		local ContentMain = Instance.new("Frame")
		local ContentMainTitle = Instance.new("TextLabel")
		local ContentStoreFunc = Instance.new("Frame")


		Tab.Name = "Tab"
		Tab.Parent = TabContainer
		Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Tab.BackgroundTransparency = 1.000
		Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Tab.BorderSizePixel = 0
		Tab.Size = UDim2.new(0, 100, 0, 100)


		TabDetector.Name = "TabDetector"
		TabDetector.Parent = Tab
		TabDetector.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabDetector.BackgroundTransparency = 1.000
		TabDetector.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabDetector.BorderSizePixel = 0
		TabDetector.Size = UDim2.new(0, 200, 0, 50)
		TabDetector.ZIndex = 3
		TabDetector.Font = Enum.Font.SourceSans
		TabDetector.Text = ""
		TabDetector.TextColor3 = Color3.fromRGB(0, 0, 0)
		TabDetector.TextSize = 14.000



		TabTitle.Name = "TabTitle"
		TabTitle.Parent = Tab
		TabTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabTitle.BackgroundTransparency = 1.000
		TabTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabTitle.BorderSizePixel = 0
		TabTitle.Size = UDim2.new(1, 0, 1, 0)
		TabTitle.Font = Enum.Font.GothamBold
		TabTitle.Text = name
		TabTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabTitle.TextSize = 20.000

		--frame

		ContentScrolling.Name = "ContentScrolling"
		ContentScrolling.Parent = ContentContainer
		ContentScrolling.Active = true
		ContentScrolling.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ContentScrolling.BackgroundTransparency = 1.000
		ContentScrolling.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ContentScrolling.BorderSizePixel = 0
		ContentScrolling.Position = UDim2.new(0.228, 0, 0.104999997, 0)
		ContentScrolling.Size = UDim2.new(0.755999982, 0, 0.890, 0)
		ContentScrolling.ScrollBarThickness = 3

		ContentFrame.Name = "ContentFrame"
		ContentFrame.Parent = ContentScrolling
		ContentFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ContentFrame.BackgroundTransparency = 1.000
		ContentFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ContentFrame.BorderSizePixel = 0
		ContentFrame.Size = UDim2.new(0.980000019, 0, 1, 0)

		ContentMain.Name = "ContentMain"
		ContentMain.Parent = ContentFrame
		ContentMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ContentMain.BackgroundTransparency = 1.000
		ContentMain.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ContentMain.BorderSizePixel = 0
		ContentMain.Size = UDim2.new(1, 0, 0, 1245)

		ContentMainTitle.Name = "ContentMainTitle"
		ContentMainTitle.Parent = ContentMain
		ContentMainTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ContentMainTitle.BackgroundTransparency = 1.000
		ContentMainTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ContentMainTitle.BorderSizePixel = 0
		ContentMainTitle.Size = UDim2.new(1, 0, 0, 32)
		ContentMainTitle.Font = Enum.Font.GothamBold
		ContentMainTitle.Text = name
		ContentMainTitle.TextColor3 = Color3.fromRGB(202, 202, 202)
		ContentMainTitle.TextSize = 17.000
		ContentMainTitle.TextXAlignment = Enum.TextXAlignment.Left

		ContentStoreFunc.Name = name.."_PageMain" 
		ContentStoreFunc.Parent = ContentMain
		ContentStoreFunc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ContentStoreFunc.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ContentStoreFunc.BorderSizePixel = 0
		ContentStoreFunc.Position = UDim2.new(0, 0, 0, 32)
		ContentStoreFunc.Size = UDim2.new(1, 0, 0, 0)
		ContentStoreFunc.LayoutOrder = PageOrders

		UIListLayout.Parent = ContentStoreFunc
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 5)

		TabDetector.MouseButton1Click:connect(function()
			if ContentStoreFunc.Name == name.."_PageMain" then
				UIPage:JumpToIndex(ContentStoreFunc.LayoutOrder)
			end
		end)

		local Item = {}
		function Item:Button(name,info,callback)

			local Button = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local ButtonDetector = Instance.new("TextButton")
			local ButtonTitle = Instance.new("TextLabel")
			local ButtonDescription = Instance.new("TextLabel")

			Button.Name = "Button"
			Button.Parent = ContentStoreFunc
			Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Button.BorderSizePixel = 0
			Button.Size = UDim2.new(1, 0, 0, 70)

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = Button

			ButtonDetector.Name = "ButtonDetector"
			ButtonDetector.Parent = Button
			ButtonDetector.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonDetector.BackgroundTransparency = 1.000
			ButtonDetector.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ButtonDetector.BorderSizePixel = 0
			ButtonDetector.Size = UDim2.new(1, 0, 0, 70)
			ButtonDetector.Font = Enum.Font.SourceSans
			ButtonDetector.Text = ""
			ButtonDetector.TextColor3 = Color3.fromRGB(0, 0, 0)
			ButtonDetector.TextSize = 14.000

			ButtonTitle.Name = "ButtonTitle"
			ButtonTitle.Parent = Button
			ButtonTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonTitle.BackgroundTransparency = 1.000
			ButtonTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ButtonTitle.BorderSizePixel = 0
			ButtonTitle.Position = UDim2.new(0.0120283868, 0, 0.0500000007, 0)
			ButtonTitle.Size = UDim2.new(0, 343, 0, 14)
			ButtonTitle.Font = Enum.Font.GothamBold
			ButtonTitle.Text = name
			ButtonTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			ButtonTitle.TextSize = 15.000
			ButtonTitle.TextXAlignment = Enum.TextXAlignment.Left

			ButtonDescription.Name = "ButtonDescription"
			ButtonDescription.Parent = Button
			ButtonDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonDescription.BackgroundTransparency = 1.000
			ButtonDescription.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ButtonDescription.BorderSizePixel = 0
			ButtonDescription.Position = UDim2.new(0.0120283868, 0, 0.28333348, 0)
			ButtonDescription.Size = UDim2.new(0, 400, 0, 50)
			ButtonDescription.Font = Enum.Font.GothamBold
			ButtonDescription.Text = info
			ButtonDescription.TextColor3 = Color3.fromRGB(94, 94, 94)
			ButtonDescription.TextSize = 14.000
			ButtonDescription.TextXAlignment = Enum.TextXAlignment.Left

			ButtonDetector.MouseButton1Click:Connect(function()
				callback()
			end)

			ButtonDetector.MouseButton1Click:Connect(function()
				TweenService:Create(
					Logo,
					TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ImageColor3 = Color3.fromRGB(216, 216, 216)}
				):Play()
				Callback()
				delay(0.1,function()
					TweenService:Create(
						Logo,
						TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageColor3 = Color3.fromRGB(95, 95, 95)}
					):Play()
				end)
			end)

			ButtonDetector.MouseEnter:Connect(function()
				TweenService:Create(
					Button,
					TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{BackgroundColor3 = Color3.fromRGB(40, 40, 40)}
				):Play()
			end)

			ButtonDetector.MouseLeave:Connect(function()
				TweenService:Create(
					Button,
					TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{BackgroundColor3 = Color3.fromRGB(30, 30, 30)}
				):Play()
			end)

		end
		function Item:Label(name)
			local Label = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local FrameLabel = Instance.new("Frame")
			local LabelText = Instance.new("TextLabel")
			local Label1func = {}
			Label.Name = "Label"
			Label.Parent = ContentStoreFunc
			Label.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
			Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Label.BorderSizePixel = 0
			Label.Size = UDim2.new(1, 0, 0, 25)
			Label.ZIndex = 2

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = Label

			FrameLabel.Name = "FrameLabel"
			FrameLabel.Parent = Label
			FrameLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			FrameLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			FrameLabel.BorderSizePixel = 0
			FrameLabel.Position = UDim2.new(0, 2, 0, 2)
			FrameLabel.Size = UDim2.new(1, -4, 1, -4)

			LabelText.Name = "LabelText"
			LabelText.Parent = FrameLabel
			LabelText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			LabelText.BackgroundTransparency = 1.000
			LabelText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			LabelText.BorderSizePixel = 0
			LabelText.Position = UDim2.new(0, 2, 0, 2)
			LabelText.Size = UDim2.new(1, -4, 0, 0)
			LabelText.ZIndex = 9
			LabelText.Font = Enum.Font.GothamBold
			LabelText.Text = name
			LabelText.TextColor3 = Color3.fromRGB(255, 255, 255)
			LabelText.TextSize = 17.000
			LabelText.TextXAlignment = Enum.TextXAlignment.Left
			LabelText.TextYAlignment = Enum.TextYAlignment.Top
			function Label1func:Refresh(tochange)
				LabelText.Text = tochange
			end
			return Label1func
		end

		function Item:Toggle(name,info,default,callback)
			local Toggle = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local ToggleSwitch = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local ToggleSwitch2 = Instance.new("Frame")
			local UICorner_3 = Instance.new("UICorner")
			local ImageLabel = Instance.new("ImageLabel")
			local ToggleDetector = Instance.new("TextButton")
			local ToggleDescription = Instance.new("TextLabel")
			local ToggleTitle = Instance.new("TextLabel")
			local toggled = false
			Toggle.Name = "Toggle"
			Toggle.Parent = ContentStoreFunc
			Toggle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Toggle.BorderSizePixel = 0
			Toggle.Size = UDim2.new(1, 0, 0, 70)

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = Toggle

			ToggleSwitch.Name = "ToggleSwitch"
			ToggleSwitch.Parent = Toggle
			ToggleSwitch.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
			ToggleSwitch.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToggleSwitch.BorderSizePixel = 0
			ToggleSwitch.Position = UDim2.new(0.827953935, 0, 0.311904907, 0)
			ToggleSwitch.Size = UDim2.new(0, 48, 0, 23)

			UICorner_2.CornerRadius = UDim.new(1, 0)
			UICorner_2.Parent = ToggleSwitch

			ToggleSwitch2.Name = "ToggleSwitch2"
			ToggleSwitch2.Parent = ToggleSwitch
			ToggleSwitch2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			ToggleSwitch2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToggleSwitch2.BorderSizePixel = 0
			ToggleSwitch2.Position = UDim2.new(0, 2, 0, 2)
			ToggleSwitch2.Size = UDim2.new(1, -4, 1, -4)

			UICorner_3.CornerRadius = UDim.new(1, 0)
			UICorner_3.Parent = ToggleSwitch2

			ImageLabel.Parent = ToggleSwitch2
			ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageLabel.BackgroundTransparency = 1.000
			ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ImageLabel.BorderSizePixel = 0
			ImageLabel.Position = UDim2.new(0.0299999714, 0, 0, 0)
			ImageLabel.Size = UDim2.new(0, 19, 0, 19)
			ImageLabel.Image = "rbxassetid://3926305904"
			ImageLabel.ImageColor3 = Color3.fromRGB(72, 73, 74)
			ImageLabel.ImageRectOffset = Vector2.new(124, 124)
			ImageLabel.ImageRectSize = Vector2.new(36, 36)

			ToggleDetector.Name = "ToggleDetector"
			ToggleDetector.Parent = Toggle
			ToggleDetector.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleDetector.BackgroundTransparency = 1.000
			ToggleDetector.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToggleDetector.BorderSizePixel = 0
			ToggleDetector.Size = UDim2.new(0, 478, 0, 69)
			ToggleDetector.Font = Enum.Font.SourceSans
			ToggleDetector.Text = ""
			ToggleDetector.TextColor3 = Color3.fromRGB(0, 0, 0)
			ToggleDetector.TextSize = 14.000

			ToggleDescription.Name = "ToggleDescription"
			ToggleDescription.Parent = Toggle
			ToggleDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleDescription.BackgroundTransparency = 11.000
			ToggleDescription.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToggleDescription.BorderSizePixel = 0
			ToggleDescription.Position = UDim2.new(0.0120283868, 0, 0.28333348, 0)
			ToggleDescription.Size = UDim2.new(0, 400, 0, 50)
			ToggleDescription.Font = Enum.Font.GothamBold
			ToggleDescription.Text = info
			ToggleDescription.TextColor3 = Color3.fromRGB(94, 94, 94)
			ToggleDescription.TextSize = 15.000
			ToggleDescription.TextXAlignment = Enum.TextXAlignment.Left

			ToggleTitle.Name = "ToggleTitle"
			ToggleTitle.Parent = Toggle
			ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleTitle.BackgroundTransparency = 1.000
			ToggleTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToggleTitle.BorderSizePixel = 0
			ToggleTitle.Position = UDim2.new(0.0120283868, 0, 0.0500000007, 0)
			ToggleTitle.Size = UDim2.new(0, 343, 0, 14)
			ToggleTitle.Font = Enum.Font.GothamBold
			ToggleTitle.Text = name
			ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			ToggleTitle.TextSize = 15.000
			ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

			ToggleDetector.MouseButton1Click:Connect(function()
				if toggled == true then
					game.TweenService:Create(ImageLabel, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
						{
							ImageColor3 = Color3.fromRGB(72, 73, 74)}
					):Play()
					game.TweenService:Create(ImageLabel, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
						{
							Position = UDim2.new(0.0299999714, 0, 0, 0)}
					):Play()
				else
					game.TweenService:Create(ImageLabel, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
						{
							ImageColor3 = Color3.fromRGB(255,255,0)}
					):Play()
					game.TweenService:Create(ImageLabel, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
						{
							Position = UDim2.new(0.6, 0, 0, 0)}
					):Play()
				end
				toggled = not toggled
				pcall(callback, toggled)
			end)

			if default == true then
				game.TweenService:Create(ImageLabel, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
				{
					ImageColor3 = Color3.fromRGB(0, 179, 255)}
			):Play()
			game.TweenService:Create(ImageLabel, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
				{
					Position = UDim2.new(0.6, 0, 0, 0)}
			):Play()
			toggled = not toggled
			pcall(callback, toggled)
			end

			ToggleDetector.MouseEnter:Connect(function()
				TweenService:Create(
					Toggle,
					TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{BackgroundColor3 = Color3.fromRGB(40, 40, 40)}
				):Play()
			end)

			ToggleDetector.MouseLeave:Connect(function()
				TweenService:Create(
					Toggle,
					TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{BackgroundColor3 = Color3.fromRGB(30, 30, 30)}
				):Play()
			end)
		end

		function Item:TextBox(name,info,callback)

			local TextBox = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local Frame = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local Frame_2 = Instance.new("Frame")
			local UICorner_3 = Instance.new("UICorner")
			local TextBox_2 = Instance.new("TextBox")
			local TextBoxTitle = Instance.new("TextLabel")
			local TextBoxDescription = Instance.new("TextLabel")

			TextBox.Name = "TextBox"
			TextBox.Parent = ContentStoreFunc
			TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextBox.BorderSizePixel = 0
			TextBox.Size = UDim2.new(1, 0, 0, 70)

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = TextBox

			Frame.Parent = TextBox
			Frame.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
			Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(0.0120000001, 0, 0.579999983, 0)
			Frame.Size = UDim2.new(0, 467, 0, 25)
			Frame.ZIndex = 5

			UICorner_2.CornerRadius = UDim.new(0, 4)
			UICorner_2.Parent = Frame

			Frame_2.Parent = Frame
			Frame_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame_2.BorderSizePixel = 0
			Frame_2.Position = UDim2.new(0, 2, 0, 2)
			Frame_2.Size = UDim2.new(1, -4, 1, -4)

			UICorner_3.CornerRadius = UDim.new(0, 4)
			UICorner_3.Parent = Frame_2

			TextBox_2.Parent = Frame_2
			TextBox_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextBox_2.BackgroundTransparency = 1.000
			TextBox_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextBox_2.BorderSizePixel = 0
			TextBox_2.Size = UDim2.new(1, 0, 1, 0)
			TextBox_2.Font = Enum.Font.SourceSans
			TextBox_2.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
			TextBox_2.Text = ""
			TextBox_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBox_2.TextSize = 14.000

			TextBoxTitle.Name = "TextBoxTitle"
			TextBoxTitle.Parent = TextBox
			TextBoxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextBoxTitle.BackgroundTransparency = 1.000
			TextBoxTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextBoxTitle.BorderSizePixel = 0
			TextBoxTitle.Position = UDim2.new(0.0120283868, 0, 0.0500000007, 0)
			TextBoxTitle.Size = UDim2.new(0, 343, 0, 14)
			TextBoxTitle.Font = Enum.Font.GothamBold
			TextBoxTitle.Text = name
			TextBoxTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextBoxTitle.TextSize = 15.000
			TextBoxTitle.TextXAlignment = Enum.TextXAlignment.Left

			TextBoxDescription.Name = "TextBoxDescription"
			TextBoxDescription.Parent = TextBox
			TextBoxDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextBoxDescription.BackgroundTransparency = 1.000
			TextBoxDescription.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextBoxDescription.BorderSizePixel = 0
			TextBoxDescription.Position = UDim2.new(0.0120283868, 0, 0.326191068, 0)
			TextBoxDescription.Size = UDim2.new(0, 467, 0, 18)
			TextBoxDescription.Font = Enum.Font.GothamBold
			TextBoxDescription.Text = info
			TextBoxDescription.TextColor3 = Color3.fromRGB(94, 94, 94)
			TextBoxDescription.TextSize = 14.000
			TextBoxDescription.TextXAlignment = Enum.TextXAlignment.Left

			TextBox_2.FocusLost:Connect(function()
				callback(TextBox_2.Text)
				TextBox_2.Text = ""
			end)
		end

		function Item:Slider(name,info,min,max,set,callback)


			local Slider = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local SliderTitle = Instance.new("TextLabel")
			local SlideEdit = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local Frame = Instance.new("Frame")
			local CustomValue = Instance.new("TextBox")
			local ValueFrame = Instance.new("Frame")
			local PartValue = Instance.new("Frame")
			local MainValue = Instance.new("Frame")
			local ConneValue = Instance.new("Frame")
			local TextBoxDescription = Instance.new("TextLabel")
			local SliderText = Instance.new("TextLabel")
			local sliderfunc = {}
			Slider.Name = "Slider"
			Slider.Parent = ContentStoreFunc
			Slider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Slider.BorderSizePixel = 0
			Slider.Size = UDim2.new(1, 0, 0, 70)

			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = Slider

			SliderTitle.Name = "SliderTitle"
			SliderTitle.Parent = Slider
			SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderTitle.BackgroundTransparency = 1.000
			SliderTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SliderTitle.BorderSizePixel = 0
			SliderTitle.Position = UDim2.new(0.0120283868, 0, 0.0500000007, 0)
			SliderTitle.Size = UDim2.new(0, 343, 0, 14)
			SliderTitle.Font = Enum.Font.GothamBold
			SliderTitle.Text = name
			SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderTitle.TextSize = 15.000
			SliderTitle.TextXAlignment = Enum.TextXAlignment.Left

			SlideEdit.Name = "SlideEdit"
			SlideEdit.Parent = Slider
			SlideEdit.AnchorPoint = Vector2.new(0.5, 0.5)
			SlideEdit.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
			SlideEdit.BorderSizePixel = 0
			SlideEdit.Position = UDim2.new(0.894898593, 0, 0.657142878, 0)
			SlideEdit.Size = UDim2.new(0, 80, 0, 22)

			UICorner_2.CornerRadius = UDim.new(0, 4)
			UICorner_2.Parent = SlideEdit

			Frame.Parent = SlideEdit
			Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(0, 2, 0, 2)
			Frame.Size = UDim2.new(1, -4, 1, -4)

			CustomValue.Name = "CustomValue"
			CustomValue.Parent = Frame
			CustomValue.AnchorPoint = Vector2.new(0.5, 0.5)
			CustomValue.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
			CustomValue.BackgroundTransparency = 1.000
			CustomValue.ClipsDescendants = true
			CustomValue.Position = UDim2.new(0.5, 0, 0.5, 0)
			CustomValue.Size = UDim2.new(0, 50, 0, 18)
			CustomValue.Font = Enum.Font.GothamMedium
			CustomValue.PlaceholderColor3 = Color3.fromRGB(222, 222, 222)
			CustomValue.Text = ""
			CustomValue.TextColor3 = Color3.fromRGB(100, 100, 100)
			CustomValue.TextSize = 12.000

			ValueFrame.Name = "ValueFrame"
			ValueFrame.Parent = Slider
			ValueFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			ValueFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
			ValueFrame.BorderSizePixel = 0
			ValueFrame.Position = UDim2.new(0.400819808, 0, 0.800000012, 0)
			ValueFrame.Size = UDim2.new(0, 400, 0, 10)

			PartValue.Name = "PartValue"
			PartValue.Parent = ValueFrame
			PartValue.Active = true
			PartValue.AnchorPoint = Vector2.new(0.5, 0.5)
			PartValue.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
			PartValue.BackgroundTransparency = 1.000
			PartValue.Position = UDim2.new(0.498982757, 0, 0.300000012, 0)
			PartValue.Size = UDim2.new(0, 400, 0, 10)

			MainValue.Name = "MainValue"
			MainValue.Parent = PartValue
			MainValue.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			MainValue.BorderSizePixel = 0
			MainValue.Position = UDim2.new(0.00101725257, 0, 0.200000003, 0)
			MainValue.Size = UDim2.new(0.200000003, 0, 0, 10)

			ConneValue.Name = "ConneValue"
			ConneValue.Parent = PartValue
			ConneValue.AnchorPoint = Vector2.new(0.5, 0.5)
			ConneValue.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
			ConneValue.BorderSizePixel = 0
			ConneValue.Position = UDim2.new(0.200000003, 0, 0.600000024, 0)

			TextBoxDescription.Name = "TextBoxDescription"
			TextBoxDescription.Parent = Slider
			TextBoxDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextBoxDescription.BackgroundTransparency = 1.000
			TextBoxDescription.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextBoxDescription.BorderSizePixel = 0
			TextBoxDescription.Position = UDim2.new(0.0120283868, 0, 0.326191068, 0)
			TextBoxDescription.Size = UDim2.new(0, 467, 0, 18)
			TextBoxDescription.Font = Enum.Font.GothamBold
			TextBoxDescription.Text = info
			TextBoxDescription.TextColor3 = Color3.fromRGB(94, 94, 94)
			TextBoxDescription.TextSize = 14.000
			TextBoxDescription.TextXAlignment = Enum.TextXAlignment.Left

			SliderText.Name = "SliderText"
			SliderText.Parent = Slider
			SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderText.BackgroundTransparency = 1.000
			SliderText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			SliderText.BorderSizePixel = 0
			SliderText.Position = UDim2.new(0.649589717, 0, -0.0428571403, 0)
			SliderText.Size = UDim2.new(0, 200, 0, 50)
			SliderText.Font = Enum.Font.GothamBold
			SliderText.Text = ""
			SliderText.TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderText.TextSize = 16.000

			local function move(input)
				local pos =
					UDim2.new(
						math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
						0,
						0.6,
						0
					)
				local pos1 =
					UDim2.new(
						math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
						0,
						0,
						5
					)
				MainValue:TweenSize(pos1, "Out", "Sine", 0.2, true)
				ConneValue:TweenPosition(pos, "Out", "Sine", 0.2, true)
				if floor == true then
					local value = string.format("%.0f",((pos.X.Scale * max) / max) * (max - min) + min)
					CustomValue.Text = tostring(value)
					callback(value)
				else
					local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
					CustomValue.Text = tostring(value)
					callback(value)
				end
			end
			local dragging = false
			ConneValue.InputBegan:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = true
					end
				end)
			ConneValue.InputEnded:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = false
					end
				end)
			Slider.InputBegan:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = true
					end
				end)
			Slider.InputEnded:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = false
					end
				end)
			ValueFrame.InputBegan:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = true
					end
				end)
			ValueFrame.InputEnded:Connect(
				function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						dragging = false
					end
				end)
			game:GetService("UserInputService").InputChanged:Connect(function(input)
				if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
					move(input)
				end
			end)
			CustomValue.FocusLost:Connect(function(de)
				if CustomValue.Text == "" then
					CustomValue.Text  = de
				end
				if  tonumber(CustomValue.Text) > max then
					CustomValue.Text  = max
				end
				MainValue:TweenSize(UDim2.new((CustomValue.Text or 0) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
				ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.6, 0) , "Out", "Sine", 0.2, true)
				if floor == true then
					CustomValue.Text = tostring(CustomValue.Text and string.format("%.0f",(CustomValue.Text / max) * (max - min) + min) )
				else
					CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
				end
				pcall(callback, CustomValue.Text)
			end)
			-- Tween
			Slider.MouseEnter:Connect(function()
				TweenService:Create(
					SliderText,
					TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
					{TextColor3 = Color3.fromRGB(255,255,255)}
				):Play()
				TweenService:Create(
					CustomValue,
					TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
					{TextColor3 = Color3.fromRGB(255,255,255)}
				):Play()
			end)
			Slider.MouseLeave:Connect(function()
				TweenService:Create(
					SliderText,
					TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out,0.1),
					{TextColor3 = Color3.fromRGB(100,100,100)}
				):Play()
				TweenService:Create(
					CustomValue,
					TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
					{TextColor3 = Color3.fromRGB(100,100,100)}
				):Play()
			end)
			function sliderfunc:Update(value)
				MainValue:TweenSize(UDim2.new((value or 0) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
				CustomValue.Text = value
				pcall(function()
					callback(value)
				end)
				return sliderfunc
			end
		end 
		function Item:DropDown(name,info,option,callback)
			local Drop = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local UIPadding = Instance.new("UIPadding")
			local Title = Instance.new("TextLabel")
			local Des = Instance.new("TextLabel")
			local DropdownTitle = Instance.new("TextLabel")
			local DropdownFrameMain = Instance.new("Frame")
			local ItemHolderLabel = Instance.new("TextLabel")
			local ItemHolder = Instance.new("ScrollingFrame")
			local ItemHolderLayout = Instance.new("UIListLayout")
			local Item = Instance.new("TextButton")
			local ItemText = Instance.new("TextLabel")
			local ItemCorner = Instance.new("UICorner")
			local DropdownFrameMainCorner = Instance.new("UICorner")
			local Logo = Instance.new("ImageLabel")
			local DropdownFrameBtn = Instance.new("TextButton")
			local Text = Instance.new("TextLabel")
			local isdropping = false

			Drop.Name = "Drop"
			Drop.Parent = ContentStoreFunc
			Drop.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			Drop.BackgroundTransparency = 0.300
			Drop.BorderColor3 = Color3.fromRGB(27, 42, 53)
			Drop.BorderSizePixel = 0
			Drop.ClipsDescendants = true
			Drop.Position = UDim2.new(-5.93530061e-08, 0, 0, 0)
			Drop.Size = UDim2.new(0, 514, 0, 63)

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = Drop

			UIPadding.Parent = Drop
			UIPadding.PaddingLeft = UDim.new(0, 10)

			Title.Name = "Title"
			Title.Parent = Drop
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.Position = UDim2.new(0, -6, 0, 4)
			Title.Size = UDim2.new(0.454775214, 100, 0.25, 0)
			Title.Font = Enum.Font.GothamBold
			Title.Text = name
			Title.TextColor3 = Color3.fromRGB(230, 230, 230)
			Title.TextSize = 14.000
			Title.TextXAlignment = Enum.TextXAlignment.Left
			Title.TextYAlignment = Enum.TextYAlignment.Top

			Des.Name = "Des"
			Des.Parent = Drop
			Des.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Des.BackgroundTransparency = 1.000
			Des.Position = UDim2.new(0, -6, 0, 20)
			Des.Size = UDim2.new(0.454775214, 100, 0.495543748, 0)
			Des.Font = Enum.Font.Gotham
			Des.Text = info
			Des.TextColor3 = Color3.fromRGB(95, 95, 95)
			Des.TextSize = 13.000
			Des.TextXAlignment = Enum.TextXAlignment.Left
			Des.TextYAlignment = Enum.TextYAlignment.Top

			DropdownTitle.Name = "DropdownTitle"
			DropdownTitle.Parent = Drop
			DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropdownTitle.BackgroundTransparency = 1.000
			DropdownTitle.Position = UDim2.new(0, -10, 0, 0)
			DropdownTitle.Size = UDim2.new(0, 200, 0, 29)
			DropdownTitle.ZIndex = 4
			DropdownTitle.Font = Enum.Font.Gotham
			DropdownTitle.Text = ""
			DropdownTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			DropdownTitle.TextSize = 14.000
			DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left

			DropdownFrameMain.Name = "DropdownFrameMain"
			DropdownFrameMain.Parent = DropdownTitle
			DropdownFrameMain.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			DropdownFrameMain.BackgroundTransparency = 0.300
			DropdownFrameMain.ClipsDescendants = true
			DropdownFrameMain.Position = UDim2.new(-3.05175774e-07, 0, 2.27586412, 0)
			DropdownFrameMain.Selectable = true
			DropdownFrameMain.Size = UDim2.new(0, 307, 0, 94)
			DropdownFrameMain.ZIndex = 3

			ItemHolderLabel.Name = "ItemHolderLabel"
			ItemHolderLabel.Parent = DropdownFrameMain
			ItemHolderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ItemHolderLabel.BackgroundTransparency = 1.000
			ItemHolderLabel.Position = UDim2.new(0.0177759416, 0, -3.28146001e-07, 0)
			ItemHolderLabel.Size = UDim2.new(0, 150, 0, 13)
			ItemHolderLabel.Font = Enum.Font.Gotham
			ItemHolderLabel.Text = ""
			ItemHolderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			ItemHolderLabel.TextSize = 14.000
			ItemHolderLabel.TextXAlignment = Enum.TextXAlignment.Left

			ItemHolder.Name = "ItemHolder"
			ItemHolder.Parent = ItemHolderLabel
			ItemHolder.Active = true
			ItemHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ItemHolder.BackgroundTransparency = 1.000
			ItemHolder.BorderSizePixel = 0
			ItemHolder.Position = UDim2.new(-0.000928955094, 0, 0.23749797, 0)
			ItemHolder.Size = UDim2.new(0, 302, 0, 88)
			ItemHolder.CanvasSize = UDim2.new(0, 0, 0, 232)
			ItemHolder.ScrollBarThickness = 6

			ItemHolderLayout.Name = "ItemHolderLayout"
			ItemHolderLayout.Parent = ItemHolder
			ItemHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder

			for i,v in next,option do
				local Item = Instance.new("TextButton")
				local ItemText = Instance.new("TextLabel")
				Item.Name = "Item"
				Item.Parent = ItemHolder
				Item.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				Item.Position = UDim2.new(0, 0, 0.000348672096, 0)
				Item.Size = UDim2.new(0, 297, 0, 29)
				Item.AutoButtonColor = false
				Item.Font = Enum.Font.SourceSans
				Item.Text = ""
				Item.TextColor3 = Color3.fromRGB(0, 0, 0)
				Item.TextSize = 14.000
				ItemText.Name = "ItemText"
				ItemText.Parent = Item
				ItemText.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
				ItemText.BackgroundTransparency = 1.000
				ItemText.Position = UDim2.new(0.0202309974, 0, -0.0588378906, 0)
				ItemText.Size = UDim2.new(0, 191, 0, 29)
				ItemText.Font = Enum.Font.Gotham
				ItemText.Text = tostring(v)
				ItemText.TextColor3 = Color3.fromRGB(255, 255, 255)
				ItemText.TextSize = 14.000
				ItemText.TextXAlignment = Enum.TextXAlignment.Left
				ItemCorner.CornerRadius = UDim.new(0, 3)
				ItemCorner.Name = "ItemCorner"
				ItemCorner.Parent = Item

				Item.MouseButton1Click:Connect(function()
					isdropping = false
					TweenService:Create(
						Drop,
						TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 514, 0, 63)}
					):Play()
                    Text.Text = ""..tostring(v)
					callback(Text.Text)
				end)
			end

			DropdownFrameMainCorner.CornerRadius = UDim.new(0, 2)
			DropdownFrameMainCorner.Name = "DropdownFrameMainCorner"
			DropdownFrameMainCorner.Parent = DropdownFrameMain

			Logo.Name = "Logo"
			Logo.Parent = DropdownTitle
			Logo.AnchorPoint = Vector2.new(0, 0.5)
			Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Logo.BackgroundTransparency = 1.000
			Logo.Position = UDim2.new(2.14181828, 2, 1.13285983, 0)
			Logo.Size = UDim2.new(0, 54, 0, 39)
			Logo.ZIndex = 6
			Logo.Image = "http://www.roblox.com/asset/?id=10815258127"
			Logo.ImageColor3 = Color3.fromRGB(95, 95, 95)

			DropdownFrameBtn.Name = "DropdownFrameBtn"
			DropdownFrameBtn.Parent = Drop
			DropdownFrameBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropdownFrameBtn.BackgroundTransparency = 1.000
			DropdownFrameBtn.Position = UDim2.new(-0.0340000018, 0, -0.0149999997, 0)
			DropdownFrameBtn.Size = UDim2.new(0, 308, 0, 66)
			DropdownFrameBtn.Font = Enum.Font.SourceSans
			DropdownFrameBtn.Text = ""
			DropdownFrameBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
			DropdownFrameBtn.TextSize = 14.000
			Text.Name = "Text"
			Text.Parent = Drop
			Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Text.BackgroundTransparency = 1.000
			Text.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Text.BorderSizePixel = 0
			Text.Position = UDim2.new(0.59523809, 0, 0.413173646, 0)
			Text.Size = UDim2.new(0, 200, 0, 50)
			Text.Font = Enum.Font.GothamBold
			Text.Text = ""
			Text.TextColor3 = Color3.fromRGB(255, 255, 255)
			Text.TextSize = 14.000
			Text.TextXAlignment = Enum.TextXAlignment.Left
			DropdownFrameBtn.MouseButton1Click:Connect(function()
            if Drop.Size == UDim2.new(0, 514, 0, 63) then
					TweenService:Create(
						Drop,
						TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 514, 0, 167)}
					):Play()
            elseif Drop.Size == UDim2.new(0, 514, 0, 167) then
            			TweenService:Create(
						Drop,
						TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 514, 0, 63)}
					):Play()
                    end
			end)

			DropdownFrameBtn.MouseEnter:Connect(function()
				TweenService:Create(
					Drop,
					TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{BackgroundColor3 = Color3.fromRGB(40, 40, 40)}
				):Play()
			end)

			DropdownFrameBtn.MouseLeave:Connect(function()
				TweenService:Create(
					Drop,
					TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{BackgroundColor3 = Color3.fromRGB(30, 30, 30)}
				):Play()
				local dropfunc = {}
				function dropfunc:Add(t)
				local Item = Instance.new("TextButton")
				Item.Name = "Item"
				Item.Parent = DropScroll
				Item.BackgroundColor3 = Color3.fromRGB(224,224,224)
				Item.BackgroundTransparency = 1.000
				Item.Size = UDim2.new(0, 243, 0, 26)
				Item.Font = Enum.Font.GothamSemibold
				Item.Text = tostring(t)
				Item.TextColor3 = Color3.fromRGB(225, 225, 225)
				Item.TextSize = 13.000
				Item.TextTransparency = 0.500
				
				Item.MouseEnter:Connect(function()
				 TweenService:Create(
				  Item,
				  TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
				  {
				   TextTransparency = 0
				  }
				 ):Play()
				 end)
				
				Item.MouseLeave:Connect(function()
				 TweenService:Create(
				  Item,
				  TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
				  {
				   TextTransparency = 0.5
				  }
				 ):Play()
				 end)
				
				Item.MouseButton1Click:Connect(function()
				 isdropping = false
				 Dropdown:TweenSize(UDim2.new(0,243,0,31),"Out","Quad",0.3,true)
				 TweenService:Create(
				  DropImage,
				  TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
				  {
				   Rotation = 180
				  }
				 ):Play()
				 callback(Item.Text)
				 DropTitle.Text = text.." : "..Item.Text
				 end)
				end
				function dropfunc:Clear()
				DropTitle.Text = tostring(text).." : "
				isdropping = false
				Dropdown:TweenSize(UDim2.new(0,243,0,31),"Out","Quad",0.3,true)
				TweenService:Create(
				 DropImage,
				 TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
				 {
				  Rotation = 180
				 }
				):Play()
				for i,v in next, DropScroll:GetChildren() do
				if v:IsA("TextButton") then
				v:Destroy()
				end
				end
				end
				return dropfunc
			end)
		end
		return Item
	end
	return TabCreate
end

local Win = Library:CreateWindow('Evo Hub | Main') 
local Tab  = Win:CreateTab('Main')
local TestL = Tab:Label("ÃƒXC")
Tab:Button("dimemaymatday","AXC Omn Top Lua Code",function()
    print("cha may ngu")
end)
Tab:Toggle("dimemaymatday","AXC Omn Top Lua Code",false,function(v)
    _G.Test = v
end)

spawn(function()
    while wait() do
        if _G.Test then
            print("Toggle")
        end
    end
end)

Tab:TextBox("Test","Test",function(v)
    print(v)
end)

Tab:Slider("Slider","NGu",1,100,45,function(value)
    _G.Kill_At = value
end)

Tab:DropDown("DropDown","Test",{"8","6"},"6",function(v)
    print(v)
end)

Tab:DropDown("DropDown","Test",{"8","6"},function(v)
    _G.T65 = v
end)


local Tab2  = Win:CreateTab('Main3')

Tab2:Toggle("dimemaymatday","AXC Omn Top Lua Code",false,function(v)
    _G.Test = v
end)

Tab2:DropDown("DropDown","Test",{"8","6"},function(v)
    _G.T65 = v
end)
return Library
