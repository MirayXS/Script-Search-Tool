-- Script Search Tool | reggie#1000 --

if not game:IsLoaded() then
	game.Loaded:Wait()
end

local ScriptsInGame = {}
local ScriptsDecompiled = {}

local NumberOfDecompiledScripts = 0
local SearchCancelled = false

local NormalCloneName = 'Normal Clone'
local WithIDECloneName = 'With IDE Clone'

local function AddScript(Script)
	local ScriptAlreadyExists = false
	for i,v in pairs(ScriptsInGame) do
		if v == Script then
			ScriptAlreadyExists = true
		end
	end
	if ScriptAlreadyExists == false then
		table.insert(ScriptsInGame, Script)
	end
end

-- GUI
local ScriptSearchTool = {
	ScriptViewer = Instance.new("ScreenGui"),
	Main = Instance.new("Frame"),
	UICorner = Instance.new("UICorner"),
	Top = Instance.new("Frame"),
	Title = Instance.new("TextLabel"),
	Exit = Instance.new("TextButton"),
	UICorner_2 = Instance.new("UICorner"),
	Icon = Instance.new("ImageLabel"),
	Minimize = Instance.new("TextButton"),
	UICorner_3 = Instance.new("UICorner"),
	Icon_2 = Instance.new("ImageLabel"),
	Accent = Instance.new("Frame"),
	Body = Instance.new("Frame"),
	Body_2 = Instance.new("Frame"),
	IDE = Instance.new("ScrollingFrame"),
	Lines = Instance.new("TextLabel"),
	Accent_2 = Instance.new("Frame"),
	Code = Instance.new("TextLabel"),
	Overlay = Instance.new("ImageLabel"),
	UICorner_4 = Instance.new("UICorner"),
	Top_2 = Instance.new("Frame"),
	Copy = Instance.new("TextButton"),
	UICorner_5 = Instance.new("UICorner"),
	ScriptName = Instance.new("TextLabel"),
	ScriptSearchTool = Instance.new("ScreenGui"),
	Main_2 = Instance.new("Frame"),
	UICorner_6 = Instance.new("UICorner"),
	Top_3 = Instance.new("Frame"),
	Title_2 = Instance.new("TextLabel"),
	Exit_2 = Instance.new("TextButton"),
	UICorner_7 = Instance.new("UICorner"),
	Icon_3 = Instance.new("ImageLabel"),
	Minimize_2 = Instance.new("TextButton"),
	UICorner_8 = Instance.new("UICorner"),
	Icon_4 = Instance.new("ImageLabel"),
	Accent_3 = Instance.new("Frame"),
	Body_3 = Instance.new("Frame"),
	Top_4 = Instance.new("Frame"),
	Clear = Instance.new("TextButton"),
	UICorner_9 = Instance.new("UICorner"),
	Refresh = Instance.new("TextButton"),
	UICorner_10 = Instance.new("UICorner"),
	Status = Instance.new("TextLabel"),
	Accent_4 = Instance.new("Frame"),
	Body_4 = Instance.new("Frame"),
	Start = Instance.new("TextButton"),
	UICorner_11 = Instance.new("UICorner"),
	SearchBox = Instance.new("Frame"),
	UICorner_12 = Instance.new("UICorner"),
	Icon_5 = Instance.new("ImageLabel"),
	Search = Instance.new("TextBox"),
	Results = Instance.new("ScrollingFrame"),
	UIListLayout = Instance.new("UIListLayout"),
	NormalTemplate = Instance.new("Frame"),
	UICorner_13 = Instance.new("UICorner"),
	ScriptName_2 = Instance.new("TextLabel"),
	ScriptPath = Instance.new("TextLabel"),
	View = Instance.new("TextButton"),
	UICorner_14 = Instance.new("UICorner"),
	WithIDETemlate = Instance.new("Frame"),
	UICorner_15 = Instance.new("UICorner"),
	View_2 = Instance.new("TextButton"),
	UICorner_16 = Instance.new("UICorner"),
	IDE_2 = Instance.new("ScrollingFrame"),
	Overlay_2 = Instance.new("Frame"),
	UICorner_17 = Instance.new("UICorner"),
	Lines_2 = Instance.new("TextLabel"),
	Accent_5 = Instance.new("Frame"),
	Code_2 = Instance.new("TextLabel"),
	ScriptPath_2 = Instance.new("TextLabel"),
	ScriptName_3 = Instance.new("TextLabel"),
}

ScriptSearchTool.ScriptViewer.Name = "Script Viewer"
pcall(function()
	syn.protect_gui(ScriptSearchTool.ScriptViewer)
end)
ScriptSearchTool.ScriptViewer.Parent = game:GetService('CoreGui')
ScriptSearchTool.ScriptViewer.Enabled = false
ScriptSearchTool.ScriptViewer.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScriptSearchTool.ScriptViewer.DisplayOrder = 1002

ScriptSearchTool.Main.Name = "Main"
ScriptSearchTool.Main.Parent = ScriptSearchTool.ScriptViewer
ScriptSearchTool.Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScriptSearchTool.Main.BackgroundTransparency = 0.250
ScriptSearchTool.Main.BorderSizePixel = 0
ScriptSearchTool.Main.ClipsDescendants = true
ScriptSearchTool.Main.Position = UDim2.new(0.699999988, 0, 0.5, 0)
ScriptSearchTool.Main.Size = UDim2.new(0, 500, 0, 350)

ScriptSearchTool.UICorner.CornerRadius = UDim.new(0, 4)
ScriptSearchTool.UICorner.Parent = ScriptSearchTool.Main

ScriptSearchTool.Top.Name = "Top"
ScriptSearchTool.Top.Parent = ScriptSearchTool.Main
ScriptSearchTool.Top.Active = true
ScriptSearchTool.Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Top.BackgroundTransparency = 1.000
ScriptSearchTool.Top.BorderSizePixel = 0
ScriptSearchTool.Top.Size = UDim2.new(1, 0, 0, 35)
ScriptSearchTool.Top.ZIndex = 2

ScriptSearchTool.Title.Name = "Title"
ScriptSearchTool.Title.Parent = ScriptSearchTool.Top
ScriptSearchTool.Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Title.BackgroundTransparency = 1.000
ScriptSearchTool.Title.BorderSizePixel = 0
ScriptSearchTool.Title.Position = UDim2.new(0, 8, 0, 0)
ScriptSearchTool.Title.Size = UDim2.new(0, 250, 1, 0)
ScriptSearchTool.Title.ZIndex = 3
ScriptSearchTool.Title.Font = Enum.Font.GothamSemibold
ScriptSearchTool.Title.Text = "Script Search Tool | reggie#1000"
ScriptSearchTool.Title.TextColor3 = Color3.fromRGB(235, 235, 235)
ScriptSearchTool.Title.TextSize = 14.000
ScriptSearchTool.Title.TextXAlignment = Enum.TextXAlignment.Left

ScriptSearchTool.Exit.Name = "Exit"
ScriptSearchTool.Exit.Parent = ScriptSearchTool.Top
ScriptSearchTool.Exit.AnchorPoint = Vector2.new(0, 0.5)
ScriptSearchTool.Exit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Exit.BackgroundTransparency = 1.000
ScriptSearchTool.Exit.BorderSizePixel = 0
ScriptSearchTool.Exit.Position = UDim2.new(1, -30, 0.5, 0)
ScriptSearchTool.Exit.Size = UDim2.new(0, 24, 0, 24)
ScriptSearchTool.Exit.ZIndex = 3
ScriptSearchTool.Exit.Font = Enum.Font.SourceSans
ScriptSearchTool.Exit.Text = ""
ScriptSearchTool.Exit.TextColor3 = Color3.fromRGB(0, 0, 0)
ScriptSearchTool.Exit.TextSize = 14.000

ScriptSearchTool.UICorner_2.CornerRadius = UDim.new(0, 4)
ScriptSearchTool.UICorner_2.Parent = ScriptSearchTool.Exit

ScriptSearchTool.Icon.Name = "Icon"
ScriptSearchTool.Icon.Parent = ScriptSearchTool.Exit
ScriptSearchTool.Icon.AnchorPoint = Vector2.new(0.5, 0.5)
ScriptSearchTool.Icon.BackgroundTransparency = 1.000
ScriptSearchTool.Icon.BorderSizePixel = 0
ScriptSearchTool.Icon.Position = UDim2.new(0.5, 0, 0.5, 0)
ScriptSearchTool.Icon.Size = UDim2.new(0, 22, 0, 22)
ScriptSearchTool.Icon.ZIndex = 4
ScriptSearchTool.Icon.Image = "http://www.roblox.com/asset/?id=6035047409"

ScriptSearchTool.Minimize.Name = "Minimize"
ScriptSearchTool.Minimize.Parent = ScriptSearchTool.Top
ScriptSearchTool.Minimize.AnchorPoint = Vector2.new(0, 0.5)
ScriptSearchTool.Minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Minimize.BackgroundTransparency = 1.000
ScriptSearchTool.Minimize.BorderSizePixel = 0
ScriptSearchTool.Minimize.Position = UDim2.new(1, -60, 0.5, 0)
ScriptSearchTool.Minimize.Size = UDim2.new(0, 24, 0, 24)
ScriptSearchTool.Minimize.ZIndex = 3
ScriptSearchTool.Minimize.Font = Enum.Font.SourceSans
ScriptSearchTool.Minimize.Text = ""
ScriptSearchTool.Minimize.TextColor3 = Color3.fromRGB(0, 0, 0)
ScriptSearchTool.Minimize.TextSize = 14.000

ScriptSearchTool.UICorner_3.CornerRadius = UDim.new(0, 4)
ScriptSearchTool.UICorner_3.Parent = ScriptSearchTool.Minimize

ScriptSearchTool.Icon_2.Name = "Icon"
ScriptSearchTool.Icon_2.Parent = ScriptSearchTool.Minimize
ScriptSearchTool.Icon_2.AnchorPoint = Vector2.new(0.5, 0.5)
ScriptSearchTool.Icon_2.BackgroundTransparency = 1.000
ScriptSearchTool.Icon_2.BorderSizePixel = 0
ScriptSearchTool.Icon_2.Position = UDim2.new(0.5, 0, 0.5, 0)
ScriptSearchTool.Icon_2.Size = UDim2.new(0, 22, 0, 22)
ScriptSearchTool.Icon_2.ZIndex = 4
ScriptSearchTool.Icon_2.Image = "http://www.roblox.com/asset/?id=6034818379"

ScriptSearchTool.Accent.Name = "Accent"
ScriptSearchTool.Accent.Parent = ScriptSearchTool.Top
ScriptSearchTool.Accent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Accent.BackgroundTransparency = 0.500
ScriptSearchTool.Accent.BorderSizePixel = 0
ScriptSearchTool.Accent.Position = UDim2.new(0, 8, 1, -1)
ScriptSearchTool.Accent.Size = UDim2.new(1, -16, 0, 1)

ScriptSearchTool.Body.Name = "Body"
ScriptSearchTool.Body.Parent = ScriptSearchTool.Main
ScriptSearchTool.Body.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Body.BackgroundTransparency = 1.000
ScriptSearchTool.Body.BorderSizePixel = 0
ScriptSearchTool.Body.Position = UDim2.new(0, 8, 0, 43)
ScriptSearchTool.Body.Size = UDim2.new(1, -16, 1, -53)
ScriptSearchTool.Body.ZIndex = 2

ScriptSearchTool.Body_2.Name = "Body"
ScriptSearchTool.Body_2.Parent = ScriptSearchTool.Body
ScriptSearchTool.Body_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Body_2.BackgroundTransparency = 1.000
ScriptSearchTool.Body_2.BorderSizePixel = 0
ScriptSearchTool.Body_2.Position = UDim2.new(0, 0, 0, 38)
ScriptSearchTool.Body_2.Size = UDim2.new(1, 0, 1, -38)
ScriptSearchTool.Body_2.ZIndex = 3

ScriptSearchTool.IDE.Name = "IDE"
ScriptSearchTool.IDE.Parent = ScriptSearchTool.Body_2
ScriptSearchTool.IDE.Active = true
ScriptSearchTool.IDE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.IDE.BackgroundTransparency = 1.000
ScriptSearchTool.IDE.BorderSizePixel = 0
ScriptSearchTool.IDE.Size = UDim2.new(1, 0, 1, 0)
ScriptSearchTool.IDE.ZIndex = 6
ScriptSearchTool.IDE.ScrollBarThickness = 6
ScriptSearchTool.IDE.CanvasSize = UDim2.new(0, 0, 0, 0)
ScriptSearchTool.IDE.AutomaticCanvasSize = Enum.AutomaticSize.XY

ScriptSearchTool.Lines.Name = "Lines"
ScriptSearchTool.Lines.Parent = ScriptSearchTool.IDE
ScriptSearchTool.Lines.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Lines.BackgroundTransparency = 1.000
ScriptSearchTool.Lines.BorderSizePixel = 0
ScriptSearchTool.Lines.Position = UDim2.new(0, 0, 0, 8)
ScriptSearchTool.Lines.Size = UDim2.new(0, 30, 0, ScriptSearchTool.IDE.AbsoluteWindowSize.Y - 5)
ScriptSearchTool.Lines.ZIndex = 7
ScriptSearchTool.Lines.Font = Enum.Font.Code
ScriptSearchTool.Lines.Text = "1"
ScriptSearchTool.Lines.TextColor3 = Color3.fromRGB(200, 200, 200)
ScriptSearchTool.Lines.TextSize = 14.000
ScriptSearchTool.Lines.TextXAlignment = Enum.TextXAlignment.Right
ScriptSearchTool.Lines.TextYAlignment = Enum.TextYAlignment.Top

ScriptSearchTool.Accent_2.Name = "Accent"
ScriptSearchTool.Accent_2.Parent = ScriptSearchTool.Lines
ScriptSearchTool.Accent_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Accent_2.BackgroundTransparency = 0.500
ScriptSearchTool.Accent_2.BorderSizePixel = 0
ScriptSearchTool.Accent_2.Position = UDim2.new(1, 3, 0, -5)
ScriptSearchTool.Accent_2.Size = UDim2.new(0, 1, 1, 5)

ScriptSearchTool.Code.Name = "Code"
ScriptSearchTool.Code.Parent = ScriptSearchTool.IDE
ScriptSearchTool.Code.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Code.BackgroundTransparency = 1.000
ScriptSearchTool.Code.BorderSizePixel = 0
ScriptSearchTool.Code.Position = UDim2.new(0, 38, 0, 8)
ScriptSearchTool.Code.Size = UDim2.new(1, -38, 0, ScriptSearchTool.IDE.AbsoluteWindowSize.Y - 5)
ScriptSearchTool.Code.ZIndex = 7
ScriptSearchTool.Code.Font = Enum.Font.Code
ScriptSearchTool.Code.Text = ""
ScriptSearchTool.Code.TextColor3 = Color3.fromRGB(235, 235, 235)
ScriptSearchTool.Code.TextSize = 14.000
ScriptSearchTool.Code.TextXAlignment = Enum.TextXAlignment.Left
ScriptSearchTool.Code.TextYAlignment = Enum.TextYAlignment.Top
ScriptSearchTool.Code.AutomaticSize = Enum.AutomaticSize.Y

ScriptSearchTool.Overlay.Name = "Overlay"
ScriptSearchTool.Overlay.Parent = ScriptSearchTool.Body_2
ScriptSearchTool.Overlay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Overlay.BackgroundTransparency = 1.000
ScriptSearchTool.Overlay.BorderSizePixel = 0
ScriptSearchTool.Overlay.Size = UDim2.new(1, 0, 1, 0)
ScriptSearchTool.Overlay.ZIndex = 6
ScriptSearchTool.Overlay.Image = "http://www.roblox.com/asset/?id=7353838214"
ScriptSearchTool.Overlay.ImageTransparency = 0.500

ScriptSearchTool.UICorner_4.CornerRadius = UDim.new(0, 4)
ScriptSearchTool.UICorner_4.Parent = ScriptSearchTool.Overlay

ScriptSearchTool.Top_2.Name = "Top"
ScriptSearchTool.Top_2.Parent = ScriptSearchTool.Body
ScriptSearchTool.Top_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Top_2.BackgroundTransparency = 1.000
ScriptSearchTool.Top_2.BorderSizePixel = 0
ScriptSearchTool.Top_2.Size = UDim2.new(1, 0, 0, 30)
ScriptSearchTool.Top_2.ZIndex = 3

ScriptSearchTool.Copy.Name = "Copy"
ScriptSearchTool.Copy.Parent = ScriptSearchTool.Top_2
ScriptSearchTool.Copy.AnchorPoint = Vector2.new(1, 0)
ScriptSearchTool.Copy.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
ScriptSearchTool.Copy.BackgroundTransparency = 0.600
ScriptSearchTool.Copy.BorderSizePixel = 0
ScriptSearchTool.Copy.Position = UDim2.new(1, 0, 0, 0)
ScriptSearchTool.Copy.Size = UDim2.new(0, 100, 1, 0)
ScriptSearchTool.Copy.Font = Enum.Font.Gotham
ScriptSearchTool.Copy.Text = "Copy Script"
ScriptSearchTool.Copy.TextColor3 = Color3.fromRGB(235, 235, 235)
ScriptSearchTool.Copy.TextSize = 14.000

ScriptSearchTool.UICorner_5.CornerRadius = UDim.new(0, 4)
ScriptSearchTool.UICorner_5.Parent = ScriptSearchTool.Copy

ScriptSearchTool.ScriptName.Name = "Script Name"
ScriptSearchTool.ScriptName.Parent = ScriptSearchTool.Top_2
ScriptSearchTool.ScriptName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.ScriptName.BackgroundTransparency = 1.000
ScriptSearchTool.ScriptName.BorderSizePixel = 0
ScriptSearchTool.ScriptName.Size = UDim2.new(0, 200, 1, 0)
ScriptSearchTool.ScriptName.ZIndex = 4
ScriptSearchTool.ScriptName.Font = Enum.Font.Gotham
ScriptSearchTool.ScriptName.Text = "Script Viewer - Script.lua"
ScriptSearchTool.ScriptName.TextColor3 = Color3.fromRGB(235, 235, 235)
ScriptSearchTool.ScriptName.TextSize = 14.000
ScriptSearchTool.ScriptName.TextXAlignment = Enum.TextXAlignment.Left

ScriptSearchTool.ScriptSearchTool.Name = "Script Search Tool"
pcall(function()
	syn.protect_gui(ScriptSearchTool.ScriptSearchTool)
end)
ScriptSearchTool.ScriptSearchTool.Parent = game:GetService('CoreGui')
ScriptSearchTool.ScriptSearchTool.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScriptSearchTool.ScriptSearchTool.DisplayOrder = 1001

ScriptSearchTool.Main_2.Name = "Main"
ScriptSearchTool.Main_2.Parent = ScriptSearchTool.ScriptSearchTool
ScriptSearchTool.Main_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScriptSearchTool.Main_2.BackgroundTransparency = 0.250
ScriptSearchTool.Main_2.BorderSizePixel = 0
ScriptSearchTool.Main_2.ClipsDescendants = true
ScriptSearchTool.Main_2.Position = UDim2.new(0.5, 0, 0.5, 0)
ScriptSearchTool.Main_2.Size = UDim2.new(0, 500, 0, 400)

ScriptSearchTool.UICorner_6.CornerRadius = UDim.new(0, 4)
ScriptSearchTool.UICorner_6.Parent = ScriptSearchTool.Main_2

ScriptSearchTool.Top_3.Name = "Top"
ScriptSearchTool.Top_3.Parent = ScriptSearchTool.Main_2
ScriptSearchTool.Top_3.Active = true
ScriptSearchTool.Top_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Top_3.BackgroundTransparency = 1.000
ScriptSearchTool.Top_3.BorderSizePixel = 0
ScriptSearchTool.Top_3.Size = UDim2.new(1, 0, 0, 35)
ScriptSearchTool.Top_3.ZIndex = 2

ScriptSearchTool.Title_2.Name = "Title"
ScriptSearchTool.Title_2.Parent = ScriptSearchTool.Top_3
ScriptSearchTool.Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Title_2.BackgroundTransparency = 1.000
ScriptSearchTool.Title_2.BorderSizePixel = 0
ScriptSearchTool.Title_2.Position = UDim2.new(0, 8, 0, 0)
ScriptSearchTool.Title_2.Size = UDim2.new(0, 250, 1, 0)
ScriptSearchTool.Title_2.ZIndex = 3
ScriptSearchTool.Title_2.Font = Enum.Font.GothamSemibold
ScriptSearchTool.Title_2.Text = "Script Search Tool | reggie#1000"
ScriptSearchTool.Title_2.TextColor3 = Color3.fromRGB(235, 235, 235)
ScriptSearchTool.Title_2.TextSize = 14.000
ScriptSearchTool.Title_2.TextXAlignment = Enum.TextXAlignment.Left

ScriptSearchTool.Exit_2.Name = "Exit"
ScriptSearchTool.Exit_2.Parent = ScriptSearchTool.Top_3
ScriptSearchTool.Exit_2.AnchorPoint = Vector2.new(0, 0.5)
ScriptSearchTool.Exit_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Exit_2.BackgroundTransparency = 1.000
ScriptSearchTool.Exit_2.BorderSizePixel = 0
ScriptSearchTool.Exit_2.Position = UDim2.new(1, -30, 0.5, 0)
ScriptSearchTool.Exit_2.Size = UDim2.new(0, 24, 0, 24)
ScriptSearchTool.Exit_2.ZIndex = 3
ScriptSearchTool.Exit_2.Font = Enum.Font.SourceSans
ScriptSearchTool.Exit_2.Text = ""
ScriptSearchTool.Exit_2.TextColor3 = Color3.fromRGB(0, 0, 0)
ScriptSearchTool.Exit_2.TextSize = 14.000

ScriptSearchTool.UICorner_7.CornerRadius = UDim.new(0, 4)
ScriptSearchTool.UICorner_7.Parent = ScriptSearchTool.Exit_2

ScriptSearchTool.Icon_3.Name = "Icon"
ScriptSearchTool.Icon_3.Parent = ScriptSearchTool.Exit_2
ScriptSearchTool.Icon_3.AnchorPoint = Vector2.new(0.5, 0.5)
ScriptSearchTool.Icon_3.BackgroundTransparency = 1.000
ScriptSearchTool.Icon_3.BorderSizePixel = 0
ScriptSearchTool.Icon_3.Position = UDim2.new(0.5, 0, 0.5, 0)
ScriptSearchTool.Icon_3.Size = UDim2.new(0, 22, 0, 22)
ScriptSearchTool.Icon_3.ZIndex = 4
ScriptSearchTool.Icon_3.Image = "http://www.roblox.com/asset/?id=6035047409"

ScriptSearchTool.Minimize_2.Name = "Minimize"
ScriptSearchTool.Minimize_2.Parent = ScriptSearchTool.Top_3
ScriptSearchTool.Minimize_2.AnchorPoint = Vector2.new(0, 0.5)
ScriptSearchTool.Minimize_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Minimize_2.BackgroundTransparency = 1.000
ScriptSearchTool.Minimize_2.BorderSizePixel = 0
ScriptSearchTool.Minimize_2.Position = UDim2.new(1, -60, 0.5, 0)
ScriptSearchTool.Minimize_2.Size = UDim2.new(0, 24, 0, 24)
ScriptSearchTool.Minimize_2.ZIndex = 3
ScriptSearchTool.Minimize_2.Font = Enum.Font.SourceSans
ScriptSearchTool.Minimize_2.Text = ""
ScriptSearchTool.Minimize_2.TextColor3 = Color3.fromRGB(0, 0, 0)
ScriptSearchTool.Minimize_2.TextSize = 14.000

ScriptSearchTool.UICorner_8.CornerRadius = UDim.new(0, 4)
ScriptSearchTool.UICorner_8.Parent = ScriptSearchTool.Minimize_2

ScriptSearchTool.Icon_4.Name = "Icon"
ScriptSearchTool.Icon_4.Parent = ScriptSearchTool.Minimize_2
ScriptSearchTool.Icon_4.AnchorPoint = Vector2.new(0.5, 0.5)
ScriptSearchTool.Icon_4.BackgroundTransparency = 1.000
ScriptSearchTool.Icon_4.BorderSizePixel = 0
ScriptSearchTool.Icon_4.Position = UDim2.new(0.5, 0, 0.5, 0)
ScriptSearchTool.Icon_4.Size = UDim2.new(0, 22, 0, 22)
ScriptSearchTool.Icon_4.ZIndex = 4
ScriptSearchTool.Icon_4.Image = "http://www.roblox.com/asset/?id=6034818379"

ScriptSearchTool.SaveButton = Instance.new('TextButton')
ScriptSearchTool.SaveButton.Name = "Minimize"
ScriptSearchTool.SaveButton.Parent = ScriptSearchTool.Top_3
ScriptSearchTool.SaveButton.AnchorPoint = Vector2.new(0, 0.5)
ScriptSearchTool.SaveButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.SaveButton.BackgroundTransparency = 1.000
ScriptSearchTool.SaveButton.BorderSizePixel = 0
ScriptSearchTool.SaveButton.Position = UDim2.new(1, -90, 0.5, 0)
ScriptSearchTool.SaveButton.Size = UDim2.new(0, 24, 0, 24)
ScriptSearchTool.SaveButton.ZIndex = 3
ScriptSearchTool.SaveButton.Font = Enum.Font.SourceSans
ScriptSearchTool.SaveButton.Text = ""
ScriptSearchTool.SaveButton.TextColor3 = Color3.fromRGB(0, 0, 0)
ScriptSearchTool.SaveButton.TextSize = 14.000

ScriptSearchTool.UICorner_Save = Instance.new('UICorner')
ScriptSearchTool.UICorner_Save.CornerRadius = UDim.new(0, 4)
ScriptSearchTool.UICorner_Save.Parent = ScriptSearchTool.SaveButton

ScriptSearchTool.Icon_Save = Instance.new('ImageLabel')
ScriptSearchTool.Icon_Save.Name = "Icon"
ScriptSearchTool.Icon_Save.Parent = ScriptSearchTool.SaveButton
ScriptSearchTool.Icon_Save.AnchorPoint = Vector2.new(0.5, 0.5)
ScriptSearchTool.Icon_Save.BackgroundTransparency = 1.000
ScriptSearchTool.Icon_Save.BorderSizePixel = 0
ScriptSearchTool.Icon_Save.Position = UDim2.new(0.5, 0, 0.5, 0)
ScriptSearchTool.Icon_Save.Size = UDim2.new(0, 22, 0, 22)
ScriptSearchTool.Icon_Save.ZIndex = 4
ScriptSearchTool.Icon_Save.Image = "http://www.roblox.com/asset/?id=6035067857"

ScriptSearchTool.Accent_3.Name = "Accent"
ScriptSearchTool.Accent_3.Parent = ScriptSearchTool.Top_3
ScriptSearchTool.Accent_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Accent_3.BackgroundTransparency = 0.500
ScriptSearchTool.Accent_3.BorderSizePixel = 0
ScriptSearchTool.Accent_3.Position = UDim2.new(0, 8, 1, -1)
ScriptSearchTool.Accent_3.Size = UDim2.new(1, -16, 0, 1)

ScriptSearchTool.Body_3.Name = "Body"
ScriptSearchTool.Body_3.Parent = ScriptSearchTool.Main_2
ScriptSearchTool.Body_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Body_3.BackgroundTransparency = 1.000
ScriptSearchTool.Body_3.BorderSizePixel = 0
ScriptSearchTool.Body_3.Position = UDim2.new(0, 8, 0, 43)
ScriptSearchTool.Body_3.Size = UDim2.new(1, -16, 1, -53)
ScriptSearchTool.Body_3.ZIndex = 2

ScriptSearchTool.Top_4.Name = "Top"
ScriptSearchTool.Top_4.Parent = ScriptSearchTool.Body_3
ScriptSearchTool.Top_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Top_4.BackgroundTransparency = 1.000
ScriptSearchTool.Top_4.BorderSizePixel = 0
ScriptSearchTool.Top_4.Size = UDim2.new(1, 0, 0, 30)
ScriptSearchTool.Top_4.ZIndex = 3

ScriptSearchTool.Clear.Name = "Clear"
ScriptSearchTool.Clear.Parent = ScriptSearchTool.Top_4
ScriptSearchTool.Clear.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
ScriptSearchTool.Clear.BackgroundTransparency = 0.600
ScriptSearchTool.Clear.BorderSizePixel = 0
ScriptSearchTool.Clear.Size = UDim2.new(0, 100, 1, 0)
ScriptSearchTool.Clear.Font = Enum.Font.Gotham
ScriptSearchTool.Clear.Text = "Clear Scripts"
ScriptSearchTool.Clear.TextColor3 = Color3.fromRGB(235, 235, 235)
ScriptSearchTool.Clear.TextSize = 14.000

ScriptSearchTool.UICorner_9.CornerRadius = UDim.new(0, 4)
ScriptSearchTool.UICorner_9.Parent = ScriptSearchTool.Clear

ScriptSearchTool.Refresh.Name = "Refresh"
ScriptSearchTool.Refresh.Parent = ScriptSearchTool.Top_4
ScriptSearchTool.Refresh.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
ScriptSearchTool.Refresh.BackgroundTransparency = 0.600
ScriptSearchTool.Refresh.BorderSizePixel = 0
ScriptSearchTool.Refresh.Position = UDim2.new(0, 108, 0, 0)
ScriptSearchTool.Refresh.Size = UDim2.new(0, 100, 1, 0)
ScriptSearchTool.Refresh.Font = Enum.Font.Gotham
ScriptSearchTool.Refresh.Text = "Refresh List"
ScriptSearchTool.Refresh.TextColor3 = Color3.fromRGB(235, 235, 235)
ScriptSearchTool.Refresh.TextSize = 14.000

ScriptSearchTool.UICorner_10.CornerRadius = UDim.new(0, 4)
ScriptSearchTool.UICorner_10.Parent = ScriptSearchTool.Refresh

ScriptSearchTool.Status.Name = "Status"
ScriptSearchTool.Status.Parent = ScriptSearchTool.Top_4
ScriptSearchTool.Status.AnchorPoint = Vector2.new(1, 0)
ScriptSearchTool.Status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Status.BackgroundTransparency = 1.000
ScriptSearchTool.Status.BorderSizePixel = 0
ScriptSearchTool.Status.Position = UDim2.new(1, 0, 0, 0)
ScriptSearchTool.Status.Size = UDim2.new(0, 200, 1, 0)
ScriptSearchTool.Status.ZIndex = 4
ScriptSearchTool.Status.Font = Enum.Font.Gotham
ScriptSearchTool.Status.Text = "Scripts Decompiled: [Waiting]"
ScriptSearchTool.Status.TextColor3 = Color3.fromRGB(235, 235, 235)
ScriptSearchTool.Status.TextSize = 14.000
ScriptSearchTool.Status.TextXAlignment = Enum.TextXAlignment.Right

ScriptSearchTool.Accent_4.Name = "Accent"
ScriptSearchTool.Accent_4.Parent = ScriptSearchTool.Top_4
ScriptSearchTool.Accent_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Accent_4.BackgroundTransparency = 0.500
ScriptSearchTool.Accent_4.BorderSizePixel = 0
ScriptSearchTool.Accent_4.Position = UDim2.new(0, 0, 1, 8)
ScriptSearchTool.Accent_4.Size = UDim2.new(1, 0, 0, 1)

ScriptSearchTool.Body_4.Name = "Body"
ScriptSearchTool.Body_4.Parent = ScriptSearchTool.Body_3
ScriptSearchTool.Body_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Body_4.BackgroundTransparency = 1.000
ScriptSearchTool.Body_4.BorderSizePixel = 0
ScriptSearchTool.Body_4.Position = UDim2.new(0, 0, 0, 38)
ScriptSearchTool.Body_4.Size = UDim2.new(1, 0, 1, -38)
ScriptSearchTool.Body_4.ZIndex = 3

ScriptSearchTool.Start.Name = "Start"
ScriptSearchTool.Start.Parent = ScriptSearchTool.Body_4
ScriptSearchTool.Start.AnchorPoint = Vector2.new(0.5, 0)
ScriptSearchTool.Start.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
ScriptSearchTool.Start.BackgroundTransparency = 0.600
ScriptSearchTool.Start.BorderSizePixel = 0
ScriptSearchTool.Start.Position = UDim2.new(0.5, 0, 0, 46)
ScriptSearchTool.Start.Size = UDim2.new(0, 200, 0, 30)
ScriptSearchTool.Start.ZIndex = 4
ScriptSearchTool.Start.Font = Enum.Font.Gotham
ScriptSearchTool.Start.Text = "Start Searching"
ScriptSearchTool.Start.TextColor3 = Color3.fromRGB(235, 235, 235)
ScriptSearchTool.Start.TextSize = 14.000

ScriptSearchTool.UICorner_11.CornerRadius = UDim.new(0, 4)
ScriptSearchTool.UICorner_11.Parent = ScriptSearchTool.Start

ScriptSearchTool.SearchBox.Name = "Search Box"
ScriptSearchTool.SearchBox.Parent = ScriptSearchTool.Body_4
ScriptSearchTool.SearchBox.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
ScriptSearchTool.SearchBox.BackgroundTransparency = 0.600
ScriptSearchTool.SearchBox.BorderSizePixel = 0
ScriptSearchTool.SearchBox.Position = UDim2.new(0, 0, 0, 8)
ScriptSearchTool.SearchBox.Size = UDim2.new(1, 0, 0, 30)
ScriptSearchTool.SearchBox.ZIndex = 4

ScriptSearchTool.UICorner_12.CornerRadius = UDim.new(0, 4)
ScriptSearchTool.UICorner_12.Parent = ScriptSearchTool.SearchBox

ScriptSearchTool.Icon_5.Name = "Icon"
ScriptSearchTool.Icon_5.Parent = ScriptSearchTool.SearchBox
ScriptSearchTool.Icon_5.AnchorPoint = Vector2.new(0, 0.5)
ScriptSearchTool.Icon_5.BackgroundTransparency = 1.000
ScriptSearchTool.Icon_5.BorderSizePixel = 0
ScriptSearchTool.Icon_5.Position = UDim2.new(0, 4, 0.5, 0)
ScriptSearchTool.Icon_5.Size = UDim2.new(0, 21, 0, 21)
ScriptSearchTool.Icon_5.ZIndex = 5
ScriptSearchTool.Icon_5.Image = "http://www.roblox.com/asset/?id=6031154871"

ScriptSearchTool.Search.Name = "Search"
ScriptSearchTool.Search.Parent = ScriptSearchTool.SearchBox
ScriptSearchTool.Search.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Search.BackgroundTransparency = 1.000
ScriptSearchTool.Search.BorderSizePixel = 0
ScriptSearchTool.Search.Position = UDim2.new(0, 30, 0, 0)
ScriptSearchTool.Search.Size = UDim2.new(0, 200, 1, 0)
ScriptSearchTool.Search.ZIndex = 5
ScriptSearchTool.Search.Font = Enum.Font.Gotham
ScriptSearchTool.Search.PlaceholderText = "Example: FireServer"
ScriptSearchTool.Search.Text = ""
ScriptSearchTool.Search.TextColor3 = Color3.fromRGB(235, 235, 235)
ScriptSearchTool.Search.TextSize = 14.000
ScriptSearchTool.Search.TextXAlignment = Enum.TextXAlignment.Left

ScriptSearchTool.Results.Name = "Results"
ScriptSearchTool.Results.Parent = ScriptSearchTool.Body_4
ScriptSearchTool.Results.Active = true
ScriptSearchTool.Results.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Results.BackgroundTransparency = 1.000
ScriptSearchTool.Results.BorderSizePixel = 0
ScriptSearchTool.Results.Position = UDim2.new(0, 0, 0, 46)
ScriptSearchTool.Results.Size = UDim2.new(1, 0, 1, -46)
ScriptSearchTool.Results.ZIndex = 4
ScriptSearchTool.Results.ScrollBarThickness = 6
ScriptSearchTool.Results.CanvasSize = UDim2.new(0, 0, 0, 0)
ScriptSearchTool.Results.AutomaticCanvasSize = Enum.AutomaticSize.Y

ScriptSearchTool.UIListLayout.Parent = ScriptSearchTool.Results
ScriptSearchTool.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ScriptSearchTool.UIListLayout.Padding = UDim.new(0, 8)

ScriptSearchTool.NormalTemplate.Name = "Normal Template"
ScriptSearchTool.NormalTemplate.Parent = ScriptSearchTool.Results
ScriptSearchTool.NormalTemplate.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
ScriptSearchTool.NormalTemplate.BackgroundTransparency = 0.600
ScriptSearchTool.NormalTemplate.Size = UDim2.new(1, 0, 0, 90)
ScriptSearchTool.NormalTemplate.Visible = false
ScriptSearchTool.NormalTemplate.ZIndex = 5
ScriptSearchTool.NormalTemplate.AutomaticSize = Enum.AutomaticSize.Y

ScriptSearchTool.UICorner_13.CornerRadius = UDim.new(0, 4)
ScriptSearchTool.UICorner_13.Parent = ScriptSearchTool.NormalTemplate

ScriptSearchTool.ScriptName_2.Name = "Script Name"
ScriptSearchTool.ScriptName_2.Parent = ScriptSearchTool.NormalTemplate
ScriptSearchTool.ScriptName_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.ScriptName_2.BackgroundTransparency = 1.000
ScriptSearchTool.ScriptName_2.BorderSizePixel = 0
ScriptSearchTool.ScriptName_2.Position = UDim2.new(0, 8, 0, 8)
ScriptSearchTool.ScriptName_2.Size = UDim2.new(1, -8, 0, 28)
ScriptSearchTool.ScriptName_2.ZIndex = 6
ScriptSearchTool.ScriptName_2.Font = Enum.Font.Gotham
ScriptSearchTool.ScriptName_2.Text = "Name: Script.lua"
ScriptSearchTool.ScriptName_2.TextColor3 = Color3.fromRGB(235, 235, 235)
ScriptSearchTool.ScriptName_2.TextSize = 14.000
ScriptSearchTool.ScriptName_2.TextXAlignment = Enum.TextXAlignment.Left
ScriptSearchTool.ScriptName_2.TextYAlignment = Enum.TextYAlignment.Top

ScriptSearchTool.ScriptPath.Name = "Script Path"
ScriptSearchTool.ScriptPath.Parent = ScriptSearchTool.NormalTemplate
ScriptSearchTool.ScriptPath.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.ScriptPath.BackgroundTransparency = 1.000
ScriptSearchTool.ScriptPath.BorderSizePixel = 0
ScriptSearchTool.ScriptPath.Position = UDim2.new(0, 8, 0, 32)
ScriptSearchTool.ScriptPath.Size = UDim2.new(1, -16, 0, 20)
ScriptSearchTool.ScriptPath.ZIndex = 6
ScriptSearchTool.ScriptPath.Font = Enum.Font.Gotham
ScriptSearchTool.ScriptPath.Text = "Path: game:GetService('Workspace').Script\n \n \n "
ScriptSearchTool.ScriptPath.TextColor3 = Color3.fromRGB(235, 235, 235)
ScriptSearchTool.ScriptPath.TextSize = 14.000
ScriptSearchTool.ScriptPath.TextWrapped = true
ScriptSearchTool.ScriptPath.TextXAlignment = Enum.TextXAlignment.Left
ScriptSearchTool.ScriptPath.TextYAlignment = Enum.TextYAlignment.Top
ScriptSearchTool.ScriptPath.AutomaticSize = Enum.AutomaticSize.Y

ScriptSearchTool.View.Name = "View"
ScriptSearchTool.View.Parent = ScriptSearchTool.NormalTemplate
ScriptSearchTool.View.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScriptSearchTool.View.BackgroundTransparency = 0.400
ScriptSearchTool.View.BorderSizePixel = 0
ScriptSearchTool.View.Position = UDim2.new(0, 8, 1, -38)
ScriptSearchTool.View.Size = UDim2.new(1, -16, 0, 30)
ScriptSearchTool.View.ZIndex = 6
ScriptSearchTool.View.Font = Enum.Font.Gotham
ScriptSearchTool.View.Text = "View Script"
ScriptSearchTool.View.TextColor3 = Color3.fromRGB(235, 235, 235)
ScriptSearchTool.View.TextSize = 14.000

ScriptSearchTool.UICorner_14.CornerRadius = UDim.new(0, 4)
ScriptSearchTool.UICorner_14.Parent = ScriptSearchTool.View

ScriptSearchTool.WithIDETemlate.Name = "With IDE Temlate"
ScriptSearchTool.WithIDETemlate.Parent = ScriptSearchTool.Results
ScriptSearchTool.WithIDETemlate.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
ScriptSearchTool.WithIDETemlate.BackgroundTransparency = 0.600
ScriptSearchTool.WithIDETemlate.Size = UDim2.new(1, 0, 0, 150)
ScriptSearchTool.WithIDETemlate.Visible = false
ScriptSearchTool.WithIDETemlate.ZIndex = 5
ScriptSearchTool.WithIDETemlate.AutomaticSize = Enum.AutomaticSize.Y

ScriptSearchTool.UICorner_15.CornerRadius = UDim.new(0, 4)
ScriptSearchTool.UICorner_15.Parent = ScriptSearchTool.WithIDETemlate

ScriptSearchTool.View_2.Name = "View"
ScriptSearchTool.View_2.Parent = ScriptSearchTool.WithIDETemlate
ScriptSearchTool.View_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScriptSearchTool.View_2.BackgroundTransparency = 0.400
ScriptSearchTool.View_2.BorderSizePixel = 0
ScriptSearchTool.View_2.Position = UDim2.new(0, 8, 1, -38)
ScriptSearchTool.View_2.Size = UDim2.new(1, -16, 0, 30)
ScriptSearchTool.View_2.ZIndex = 6
ScriptSearchTool.View_2.Font = Enum.Font.Gotham
ScriptSearchTool.View_2.Text = "View Script"
ScriptSearchTool.View_2.TextColor3 = Color3.fromRGB(235, 235, 235)
ScriptSearchTool.View_2.TextSize = 14.000

ScriptSearchTool.UICorner_16.CornerRadius = UDim.new(0, 4)
ScriptSearchTool.UICorner_16.Parent = ScriptSearchTool.View_2

ScriptSearchTool.IDE_2.Name = "IDE"
ScriptSearchTool.IDE_2.Parent = ScriptSearchTool.WithIDETemlate
ScriptSearchTool.IDE_2.Active = true
ScriptSearchTool.IDE_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.IDE_2.BackgroundTransparency = 1.000
ScriptSearchTool.IDE_2.BorderSizePixel = 0
ScriptSearchTool.IDE_2.ScrollBarThickness = 0
ScriptSearchTool.IDE_2.ScrollBarImageTransparency = 1
ScriptSearchTool.IDE_2.Position = UDim2.new(0, 8, 1, -95)
ScriptSearchTool.IDE_2.Size = UDim2.new(1, -16, 0, 50)
ScriptSearchTool.IDE_2.ZIndex = 6
ScriptSearchTool.IDE_2.CanvasSize = UDim2.new(0, 0, 0, 0)
ScriptSearchTool.IDE_2.AutomaticCanvasSize = Enum.AutomaticSize.XY

ScriptSearchTool.Overlay_2.Name = "Overlay"
ScriptSearchTool.Overlay_2.Parent = ScriptSearchTool.IDE_2
ScriptSearchTool.Overlay_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScriptSearchTool.Overlay_2.BackgroundTransparency = 0.400
ScriptSearchTool.Overlay_2.BorderSizePixel = 0
ScriptSearchTool.Overlay_2.Size = UDim2.new(1, 0, 1, 0)
ScriptSearchTool.Overlay_2.ZIndex = 6

ScriptSearchTool.UICorner_17.CornerRadius = UDim.new(0, 4)
ScriptSearchTool.UICorner_17.Parent = ScriptSearchTool.Overlay_2

ScriptSearchTool.Lines_2.Name = "Lines"
ScriptSearchTool.Lines_2.Parent = ScriptSearchTool.IDE_2
ScriptSearchTool.Lines_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Lines_2.BackgroundTransparency = 1.000
ScriptSearchTool.Lines_2.BorderSizePixel = 0
ScriptSearchTool.Lines_2.Position = UDim2.new(0, 0, 0, 5)
ScriptSearchTool.Lines_2.Size = UDim2.new(0, 30, 1, -5)
ScriptSearchTool.Lines_2.ZIndex = 7
ScriptSearchTool.Lines_2.Font = Enum.Font.Code
ScriptSearchTool.Lines_2.Text = "1"
ScriptSearchTool.Lines_2.TextColor3 = Color3.fromRGB(200, 200, 200)
ScriptSearchTool.Lines_2.TextSize = 14.000
ScriptSearchTool.Lines_2.TextXAlignment = Enum.TextXAlignment.Right
ScriptSearchTool.Lines_2.TextYAlignment = Enum.TextYAlignment.Top

ScriptSearchTool.Accent_5.Name = "Accent"
ScriptSearchTool.Accent_5.Parent = ScriptSearchTool.Lines_2
ScriptSearchTool.Accent_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Accent_5.BackgroundTransparency = 0.500
ScriptSearchTool.Accent_5.BorderSizePixel = 0
ScriptSearchTool.Accent_5.Position = UDim2.new(1, 3, 0, -5)
ScriptSearchTool.Accent_5.Size = UDim2.new(0, 1, 1, 5)

ScriptSearchTool.Code_2.Name = "Code"
ScriptSearchTool.Code_2.Parent = ScriptSearchTool.IDE_2
ScriptSearchTool.Code_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.Code_2.BackgroundTransparency = 1.000
ScriptSearchTool.Code_2.BorderSizePixel = 0
ScriptSearchTool.Code_2.Position = UDim2.new(0, 38, 0, 5)
ScriptSearchTool.Code_2.Size = UDim2.new(1, -38, 1, -5)
ScriptSearchTool.Code_2.ZIndex = 7
ScriptSearchTool.Code_2.Font = Enum.Font.Code
ScriptSearchTool.Code_2.Text = ""
ScriptSearchTool.Code_2.TextColor3 = Color3.fromRGB(235, 235, 235)
ScriptSearchTool.Code_2.TextSize = 14.000
ScriptSearchTool.Code_2.TextXAlignment = Enum.TextXAlignment.Left
ScriptSearchTool.Code_2.TextYAlignment = Enum.TextYAlignment.Top

ScriptSearchTool.ScriptPath_2.Name = "Script Path"
ScriptSearchTool.ScriptPath_2.Parent = ScriptSearchTool.WithIDETemlate
ScriptSearchTool.ScriptPath_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.ScriptPath_2.BackgroundTransparency = 1.000
ScriptSearchTool.ScriptPath_2.BorderSizePixel = 0
ScriptSearchTool.ScriptPath_2.Position = UDim2.new(0, 8, 0, 32)
ScriptSearchTool.ScriptPath_2.Size = UDim2.new(1, -16, 0, 20)
ScriptSearchTool.ScriptPath_2.ZIndex = 6
ScriptSearchTool.ScriptPath_2.Font = Enum.Font.Gotham
ScriptSearchTool.ScriptPath_2.Text = "Path: game:GetService('Workspace').Script\n \n \n \n \n \n \n "
ScriptSearchTool.ScriptPath_2.TextColor3 = Color3.fromRGB(235, 235, 235)
ScriptSearchTool.ScriptPath_2.TextSize = 14.000
ScriptSearchTool.ScriptPath_2.TextWrapped = true
ScriptSearchTool.ScriptPath_2.TextXAlignment = Enum.TextXAlignment.Left
ScriptSearchTool.ScriptPath_2.TextYAlignment = Enum.TextYAlignment.Top
ScriptSearchTool.ScriptPath_2.AutomaticSize = Enum.AutomaticSize.Y
ScriptSearchTool.ScriptPath_2.AutomaticSize = Enum.AutomaticSize.Y

ScriptSearchTool.ScriptName_3.Name = "Script Name"
ScriptSearchTool.ScriptName_3.Parent = ScriptSearchTool.WithIDETemlate
ScriptSearchTool.ScriptName_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptSearchTool.ScriptName_3.BackgroundTransparency = 1.000
ScriptSearchTool.ScriptName_3.BorderSizePixel = 0
ScriptSearchTool.ScriptName_3.Position = UDim2.new(0, 8, 0, 8)
ScriptSearchTool.ScriptName_3.Size = UDim2.new(1, -8, 0, 28)
ScriptSearchTool.ScriptName_3.ZIndex = 6
ScriptSearchTool.ScriptName_3.Font = Enum.Font.Gotham
ScriptSearchTool.ScriptName_3.Text = "Name: Script.lua"
ScriptSearchTool.ScriptName_3.TextColor3 = Color3.fromRGB(235, 235, 235)
ScriptSearchTool.ScriptName_3.TextSize = 14.000
ScriptSearchTool.ScriptName_3.TextXAlignment = Enum.TextXAlignment.Left
ScriptSearchTool.ScriptName_3.TextYAlignment = Enum.TextYAlignment.Top
ScriptSearchTool.ScriptName_3.AutomaticSize = Enum.AutomaticSize.Y


-- scrikpting and stuffs

local UserInputService = game:GetService('UserInputService')
local TweenService = game:GetService('TweenService')
local MarketplaceService = game:GetService("MarketplaceService")

function Drag(Frame)
	local dragToggle = nil
	local dragSpeed = 0.02
	local dragInput = nil
	local dragStart = nil
	local dragPos = nil
	local function updateInput(input)
		local Delta = input.Position - dragStart
		local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		game:GetService("TweenService"):Create(Frame, TweenInfo.new(dragSpeed), {Position = Position}):Play()
	end
	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UserInputService:GetFocusedTextBox() == nil then
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	Frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			updateInput(input)
		end
	end)
end

Drag(ScriptSearchTool.Main)
Drag(ScriptSearchTool.Main_2)

local function GetFullName(x)
	if x.Name then
		local t = {}
		while x ~= game and x ~= nil do
			local name = x.Name:gsub('[\"]', '\\%0')
			table.insert(t, 1, name)
			x = x.Parent
		end
		return 'game["'..table.concat(t, '"]["')..'"]'
	else
		return '[Unable to get script path.]'
	end
end

local function AddResult(Script)
	if Script then
		local DecompiledScript = '-- Script Search Tool | reggie#1000\n-- Failed to get decompile bytecode, does your exploit support decompile()?                  '..'\n\n'
		if decompile then
			DecompiledScript = '-- Script Search Tool | reggie#1000\n'..decompile(Script)..'\n\n'
		end
		ScriptsDecompiled[Script.Name] = {Script, DecompiledScript}
		NumberOfDecompiledScripts = NumberOfDecompiledScripts + 1
		ScriptSearchTool.Status.Text = 'Scripts Decompiled: '..tostring(NumberOfDecompiledScripts)..'/'..#ScriptsInGame

		local NormalClone = ScriptSearchTool.NormalTemplate:Clone()
		NormalClone.Name = NormalCloneName
		NormalClone.Parent = ScriptSearchTool.Results
		NormalClone['Script Name'].Text = Script.Name..'.lua ('..Script.ClassName..')'
		NormalClone['Script Path'].Text = GetFullName(Script)..'\n\n\n\n'
		if ScriptSearchTool.Search.Text == "" then
			NormalClone.Visible = true
		end

		NormalClone.View.MouseButton1Click:Connect(function()
			ScriptSearchTool.ScriptViewer.Enabled = true
			ScriptSearchTool.Code.Text = ScriptsDecompiled[Script.Name][2]
			local _, LineCount = ScriptSearchTool.Code.Text:gsub("\n", "")
			local CurrentLine = 1
			for i = LineCount - 1, 0, -1 do
				CurrentLine = CurrentLine + 1
				ScriptSearchTool.Lines.Text = ScriptSearchTool.Lines.Text..'\n'..tostring(CurrentLine)
			end
			ScriptSearchTool.ScriptName.Text = Script.Name..'.lua ('..Script.ClassName..')'
			ScriptSearchTool.Code.Size = UDim2.fromOffset(ScriptSearchTool.Code.TextBounds.X + 20, ScriptSearchTool.Code.TextBounds.Y + 20)
			ScriptSearchTool.Lines.Size = UDim2.fromOffset(30, ScriptSearchTool.Code.TextBounds.Y + 20)
		end)


		local IDEClone = ScriptSearchTool.WithIDETemlate:Clone()
		IDEClone.Name = WithIDECloneName
		IDEClone.Parent = ScriptSearchTool.Results
		IDEClone['Script Name'].Text = Script.Name..'.lua ('..Script.ClassName..')'
		IDEClone['Script Path'].Text = GetFullName(Script)..'\n\n\n\n\n\n'
		IDEClone.IDE.Code.Text = ScriptsDecompiled[Script.Name][2]
		local _, LineCount = IDEClone.IDE.Code.Text:gsub("\n", "")
		local CurrentLine = 1
		for i = LineCount - 1, 0, -1 do
			CurrentLine = CurrentLine + 1
			IDEClone.IDE.Code.Text = IDEClone.IDE.Code.Text..'\n'..tostring(CurrentLine)
		end

		IDEClone.View.MouseButton1Click:Connect(function()
			ScriptSearchTool.ScriptViewer.Enabled = true
			ScriptSearchTool.Code.Text = ScriptsDecompiled[Script.Name][2]
			ScriptSearchTool.Code.Size = UDim2.new(ScriptSearchTool.Code.Size)
			local _, LineCount = ScriptSearchTool.Code.Text:gsub("\n", "")
			local CurrentLine = 1
			for i = LineCount - 1, 0, -1 do
				CurrentLine = CurrentLine + 1
				ScriptSearchTool.Lines.Text = ScriptSearchTool.Lines.Text..'\n'..tostring(CurrentLine)
			end
			ScriptSearchTool.ScriptName.Text = Script.Name..'.lua ('..Script.ClassName..')'
			ScriptSearchTool.Code.Size = UDim2.fromOffset(ScriptSearchTool.Code.TextBounds.X + 20, ScriptSearchTool.Code.TextBounds.Y + 20)
			ScriptSearchTool.Lines.Size = UDim2.fromOffset(30, ScriptSearchTool.Code.TextBounds.Y + 20)
		end)
	end
end

ScriptSearchTool.Start.MouseButton1Click:Connect(function()

	local GameDescendants = game:GetDescendants()

	ScriptSearchTool.Start.Visible = false
	ScriptSearchTool.Status.Text = 'Scripts Decompiled: 0/0'

	for i,v in pairs(GameDescendants) do
		if v:IsDescendantOf(workspace) or v:IsDescendantOf(game:GetService('Players')) or v:IsDescendantOf(game:GetService('Lighting')) or v:IsDescendantOf(game:GetService('ReplicatedFirst')) or v:IsDescendantOf(game:GetService('ReplicatedStorage')) or v:IsDescendantOf(game:GetService('StarterGui')) or v:IsDescendantOf(game:GetService('StarterPack')) or v:IsDescendantOf(game:GetService('StarterPlayer')) or v:IsDescendantOf(game:GetService('Chat')) then
			if v:IsA('LocalScript') or v:IsA('ModuleScript') then
				AddScript(v)
			end
		end
	end

	ScriptSearchTool.Status.Text = 'Scripts Decompiled: 0/'..#ScriptsInGame
	ScriptSearchTool.Start.Visible = false
	for i,v in pairs(ScriptsInGame) do
		if v ~= nil then
			if SearchCancelled == false then
				AddResult(v)
			else
				break
			end
		end
	end
end)

ScriptSearchTool.Exit_2.MouseButton1Click:Connect(function()
	ScriptSearchTool.ScriptSearchTool.Enabled = false
	if ScriptSearchTool.ScriptSearchTool.Enabled == false and ScriptSearchTool.ScriptViewer.Enabled == false then
		ScriptSearchTool.ScriptSearchTool:Destroy()
		ScriptSearchTool.ScriptViewer:Destroy()
	end
end)
ScriptSearchTool.Exit.MouseButton1Click:Connect(function()
	ScriptSearchTool.ScriptViewer.Enabled = false
	if ScriptSearchTool.ScriptSearchTool.Enabled == false and ScriptSearchTool.ScriptViewer.Enabled == false then
		ScriptSearchTool.ScriptSearchTool:Destroy()
		ScriptSearchTool.ScriptViewer:Destroy()
	end
end)

ScriptSearchTool.Minimize.MouseButton1Click:Connect(function()
	TweenService:Create(ScriptSearchTool.Icon_2, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Rotation = ScriptSearchTool.Icon_2.Rotation + 180}):Play()
	if ScriptSearchTool.Body.Visible == true then
		ScriptSearchTool.Body.Visible = false
		ScriptSearchTool.Main:TweenSize(UDim2.new(ScriptSearchTool.Main.Size.X.Scale, ScriptSearchTool.Main.Size.X.Offset, ScriptSearchTool.Main.Size.Y.Scale, 34), Enum.EasingDirection.In, Enum.EasingStyle.Back, 0.5)
	elseif ScriptSearchTool.Body.Visible == false then
		ScriptSearchTool.Main:TweenSize(UDim2.new(ScriptSearchTool.Main.Size.X.Scale, ScriptSearchTool.Main.Size.X.Offset, ScriptSearchTool.Main.Size.Y.Scale, 400), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.5)
		wait(0.5)
		ScriptSearchTool.Body.Visible = true
	end
end)

ScriptSearchTool.Minimize_2.MouseButton1Click:Connect(function()
	TweenService:Create(ScriptSearchTool.Icon_4, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Rotation = ScriptSearchTool.Icon_4.Rotation + 180}):Play()
	if ScriptSearchTool.Body_3.Visible == true then
		ScriptSearchTool.Body_3.Visible = false
		ScriptSearchTool.Main_2:TweenSize(UDim2.new(ScriptSearchTool.Main_2.Size.X.Scale, ScriptSearchTool.Main_2.Size.X.Offset, ScriptSearchTool.Main_2.Size.Y.Scale, 34), Enum.EasingDirection.In, Enum.EasingStyle.Back, 0.5)
	elseif ScriptSearchTool.Body_3.Visible == false then
		ScriptSearchTool.Main_2:TweenSize(UDim2.new(ScriptSearchTool.Main_2.Size.X.Scale, ScriptSearchTool.Main_2.Size.X.Offset, ScriptSearchTool.Main_2.Size.Y.Scale, 400), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.5)
		wait(0.5)
		ScriptSearchTool.Body_3.Visible = true
	end
end)

ScriptSearchTool.Copy.MouseButton1Click:Connect(function()
	setclipboard(ScriptSearchTool.Code.Text)
end)

ScriptSearchTool.Refresh.MouseButton1Click:Connect(function()
	SearchCancelled = true
	for i,v in pairs(ScriptsDecompiled) do
		table.remove(ScriptsDecompiled, #ScriptsDecompiled)
	end
	for i,v in pairs(ScriptsInGame) do
		table.remove(ScriptsInGame, #ScriptsInGame)
	end
	wait(0.5)
	for i,v in pairs(ScriptSearchTool.Results:GetChildren()) do
		if v:IsA('Frame') then
			if v.Name == NormalCloneName or v.Name == WithIDECloneName then
				v:Destroy()
			end
		end
	end
	ScriptSearchTool.Status.Text = 'Scripts Decompiled: 0/0'

	local GameDescendants = game:GetDescendants()

	for i,v in pairs(GameDescendants) do
		if v:IsDescendantOf(workspace) or v:IsDescendantOf(game:GetService('Players')) or v:IsDescendantOf(game:GetService('Lighting')) or v:IsDescendantOf(game:GetService('ReplicatedFirst')) or v:IsDescendantOf(game:GetService('ReplicatedStorage')) or v:IsDescendantOf(game:GetService('StarterGui')) or v:IsDescendantOf(game:GetService('StarterPack')) or v:IsDescendantOf(game:GetService('StarterPlayer')) or v:IsDescendantOf(game:GetService('Chat')) then
			if v:IsA('LocalScript') or v:IsA('ModuleScript') then
				AddScript(v)
			end
		end
	end

	ScriptSearchTool.Status.Text = 'Scripts Decompiled: 0/'..#ScriptsInGame
	ScriptSearchTool.Start.Visible = false
	for i,v in pairs(ScriptsInGame) do
		if v ~= nil then
			AddResult(v)
		end
	end
end)

ScriptSearchTool.Clear.MouseButton1Click:Connect(function()
	SearchCancelled = true
	for i,v in pairs(ScriptsDecompiled) do
		table.remove(ScriptsDecompiled, #ScriptsDecompiled)
	end
	for i,v in pairs(ScriptsInGame) do
		table.remove(ScriptsInGame, #ScriptsInGame)
	end
	wait(0.5)
	for i,v in pairs(ScriptSearchTool.Results:GetChildren()) do
		if v:IsA('Frame') then
			if v.Name == NormalCloneName or v.Name == WithIDECloneName then
				v:Destroy()
			end
		end
	end
	ScriptSearchTool.Status.Text = 'Scripts Decompiled: 0/0'
	local GameDescendants = game:GetDescendants()
	for i,v in pairs(GameDescendants) do
		if v:IsDescendantOf(workspace) or v:IsDescendantOf(game:GetService('Players')) or v:IsDescendantOf(game:GetService('Lighting')) or v:IsDescendantOf(game:GetService('ReplicatedFirst')) or v:IsDescendantOf(game:GetService('ReplicatedStorage')) or v:IsDescendantOf(game:GetService('StarterGui')) or v:IsDescendantOf(game:GetService('StarterPack')) or v:IsDescendantOf(game:GetService('StarterPlayer')) or v:IsDescendantOf(game:GetService('Chat')) then
			if v:IsA('LocalScript') or v:IsA('ModuleScript') then
				AddScript(v)
			end
		end
	end
	ScriptSearchTool.Status.Text = 'Scripts Decompiled: 0/'..#ScriptsInGame
end)

ScriptSearchTool.SaveButton.MouseButton1Click:Connect(function()
	if NumberOfDecompiledScripts > 0 then
		local success, err = pcall(function()
			if not isfolder('Script Search Tool - Script Files') then
				makefolder('Script Search Tool - Script Files')
			end

			local FolderNumberThatDoesntExist = 1
			local PlaceName = game.PlaceId
			
			local Success, GameData = pcall(MarketplaceService.GetProductInfo, MarketplaceService, game.PlaceId)
			if Success then
				PlaceName = GameData.Name
			end

			local CompressedName, CompressedCounter = PlaceName:gsub('%s+', '')
			local FolderName = 'SST_'..CompressedName..'_Scripts_'..tostring(FolderNumberThatDoesntExist)
					
			while isfolder('Script Search Tool - Script Files\\'..FolderName) == true do
				FolderNumberThatDoesntExist = FolderNumberThatDoesntExist + 1
				wait()
			end

			makefolder('Script Search Tool - Script Files\\'..FolderName)
			if isfolder('Script Search Tool - Script Files\\'..FolderName) then
				local CurrentFileNumber = 1
				for i,v in pairs(ScriptsDecompiled) do
					writefile('Script Search Tool - Script Files\\'..FolderName..'\\'..i..'_'..tostring(CurrentFileNumber)..'.lua', '-- In-Game location: '..GetFullName(v[1])..'\n'..v[2])
					CurrentFileNumber = CurrentFileNumber + 1
				end
			end

			local SavedMsgGUI = Instance.new('ScreenGui')
			pcall(function() syn.protect_gui(SavedMsgGUI) end)
			SavedMsgGUI.DisplayOrder = 2147483647
			SavedMsgGUI.Name = math.random(1,2147483647)
			SavedMsgGUI.ResetOnSpawn = false
			SavedMsgGUI.IgnoreGuiInset = true
			SavedMsgGUI.Parent = game:GetService('CoreGui')

			local SavedMsg = Instance.new('TextLabel')
			SavedMsg.Text = '  Saved scripts folder to: Script Filter Tool - Script Files\\'..FolderName..'  '
			SavedMsg.TextSize = 24
			SavedMsg.TextWrapped = true
			SavedMsg.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
			SavedMsg.BackgroundTransparency = 0.4
			SavedMsg.TextColor3 = Color3.fromRGB(235,235,235)
			SavedMsg.Font = Enum.Font.GothamBold
			SavedMsg.AnchorPoint = Vector2.new(0.5,0)
			SavedMsg.Size = UDim2.fromOffset(650,50)
			SavedMsg.Position = UDim2.new(0.5,0,0,35)
			SavedMsg.AutomaticSize = Enum.AutomaticSize.XY
			SavedMsg.Parent = SavedMsgGUI

			local UICorner = Instance.new('UICorner')
			UICorner.Name = math.random(1,2147483647)
			UICorner.CornerRadius = UDim.new(0,4)
			UICorner.Parent = SavedMsg

			wait(3.5)

			SavedMsgGUI:Destroy()
				
		end)
		if not success and err then
			
			local SavedMsgGUI = Instance.new('ScreenGui')
			pcall(function() syn.protect_gui(SavedMsgGUI) end)
			SavedMsgGUI.DisplayOrder = 2147483647
			SavedMsgGUI.Name = math.random(1,2147483647)
			SavedMsgGUI.ResetOnSpawn = false
			SavedMsgGUI.IgnoreGuiInset = true
			SavedMsgGUI.Parent = game:GetService('CoreGui')

			local SavedMsg = Instance.new('TextLabel')
			SavedMsg.Text = '  Failed to save, your exploit may not support writefile\nError Message: '..err..'  '
			SavedMsg.TextSize = 24
			SavedMsg.TextWrapped = true
			SavedMsg.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
			SavedMsg.BackgroundTransparency = 0.4
			SavedMsg.TextColor3 = Color3.fromRGB(235,235,235)
			SavedMsg.Font = Enum.Font.GothamBold
			SavedMsg.AnchorPoint = Vector2.new(0.5,0)
			SavedMsg.Size = UDim2.fromOffset(650,50)
			SavedMsg.Position = UDim2.new(0.5,0,0,35)
			SavedMsg.AutomaticSize = Enum.AutomaticSize.XY
			SavedMsg.Parent = SavedMsgGUI

			local UICorner = Instance.new('UICorner')
			UICorner.Name = math.random(1,2147483647)
			UICorner.CornerRadius = UDim.new(0,4)
			UICorner.Parent = SavedMsg

			wait(3.5)

			SavedMsgGUI:Destroy()
			
		end
	end
end)

ScriptSearchTool.Search:GetPropertyChangedSignal('Text'):Connect(function()
	local NewText = ScriptSearchTool.Search.Text
	if NewText == "" then
		for i,v in pairs(ScriptSearchTool.Results:GetChildren()) do
			if v.Name == NormalCloneName then
				v.Visible = true
			end
		end
		for i,v in pairs(ScriptSearchTool.Results:GetChildren()) do
			if v.Name == WithIDECloneName then
				v.Visible = false
			end
		end
	else
		for i,v in pairs(ScriptSearchTool.Results:GetChildren()) do
			if v.Name == NormalCloneName then
				v.Visible = false
			end
		end
		for i,v in pairs(ScriptSearchTool.Results:GetChildren()) do
			if v.Name == WithIDECloneName then
				for i,v in pairs(v.IDE:GetChildren()) do
					if v.Name == 'Fake Text' or v.Name == 'Fake Lines' then
						v:Destroy()
					end
				end
				if string.find(string.lower(v.IDE.Code.Text), string.lower(NewText)) then
					v.IDE.Code.Visible = false
					v.IDE.Lines.Visible = false
					local FakeText = v.IDE.Code:Clone()
					local FakeLines = v.IDE.Lines:Clone()
					FakeText.Name = 'Fake Text'
					FakeLines.Name = 'Fake Lines'
					FakeLines.Text = ""
					FakeText.Text = ""
					FakeLines.Parent = v.IDE
					FakeText.Parent = v.IDE

					local CurrentLine = 0
					for i in string.gmatch(v.IDE.Code.Text, "[^\r\n]+") do
						CurrentLine = CurrentLine + 1
						if string.find(string.lower(i), string.lower(NewText)) then
							FakeLines.Text = FakeLines.Text..tostring(CurrentLine)..'\n'
							FakeText.Text = FakeText.Text..i..'\n'
						end
					end

					FakeText.Visible = true
					FakeLines.Visible = true
					v.Visible = true
				else
					v.Visible = false
				end
			end
		end
	end
end)
