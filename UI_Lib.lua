-- Hello fat skiddo this is a shitty example so fuck off

---misc---
local zzMouse = game.Players.LocalPlayer:GetMouse()
local zzUIS = game:GetService("UserInputService")

function Ripple(Button) --- Thanks xbox#0109
    Button.AutoButtonColor = false
    Button.ClipsDescendants = true

    Button:SetAttribute("OriginalColor", Button.BackgroundColor3)
    Button.Activated:Connect(function()
    if Button:FindFirstChild("Circle") then
        return
    end

        spawn(function()
            local NewCircle = Circle:Clone()

            NewCircle.Parent = Button

            NewCircle.Position = UDim2.new(0, Mouse.X - NewCircle.AbsolutePosition.X, 0, Mouse.Y - NewCircle.AbsolutePosition.Y)

            local Size = 0

            if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
                Size = Button.AbsoluteSize.X * 1.5
            elseif Button.AbsoluteSize.X < Button.AbsoluteSize.Y then
                Size = Button.AbsoluteSize.Y * 1.5
            elseif Button.AbsoluteSize.X == Button.AbsoluteSize.Y then
                Size = Button.AbsoluteSize.X * 1.5
            end

            NewCircle:TweenSizeAndPosition(UDim2.new(0, Size, 0, Size), UDim2.new(0.5, -Size / 2, 0.5, -Size / 2), "Out", "Quad", 0.5)

            for Index = 1, 10 do
                NewCircle.ImageTransparency = NewCircle.ImageTransparency + 0.01

                wait(0.5 / 10)
            end

            NewCircle:Destroy()
        end)
    end)
end
function Drag(obj)

    local UserInputService = game:GetService("UserInputService")

    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        obj.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    obj.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or
            input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = obj.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    obj.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or
            input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then update(input) end
    end)
end

function Scale(object)
    local Offs = object:FindFirstChild("UIListLayout") and object.UIListLayout.Padding.Offset or 0
    local Y = 0
    for i, v in pairs(object:GetChildren()) do
        if not v:IsA("UIListLayout") then
            Y = Y + v.AbsoluteSize.Y + Offs + 3
        end
    end
    object.CanvasSize = UDim2.new(0, 0, 0, Y - Offs)
end

---start---

local RealZzLib = {}

function RealZzLib:CreateMain(GameName)

    local Main = Instance.new("ScreenGui")
    local mainbackground = Instance.new("ImageLabel")
    local Logo = Instance.new("ImageLabel")
    local hubname = Instance.new("TextLabel")
    local UICorner = Instance.new("UICorner")
    local Bar = Instance.new("Frame")
    local gamename = Instance.new("TextLabel")
    local TabContainer = Instance.new("ScrollingFrame")
    local Containers = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    
    if syn then
    syn.protect_gui(Main)
    Main.Parent = game.CoreGui
    elseif hiddenUI then
    Main.Parent = hiddenUI()
    else
    Main.Parent = game.CoreGui
    end

    Main.Name = GameName
    Main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    mainbackground.Name = "mainbackground"
    mainbackground.Parent = Main
    mainbackground.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    mainbackground.BorderSizePixel = 0
    mainbackground.Position = UDim2.new(0.130445316, 0, 0.317636251, 0)
    mainbackground.Size = UDim2.new(0, 601, 0, 352)
    mainbackground.Image = "rbxassetid://6780421363"

    Logo.Name = "Logo"
    Logo.Parent = mainbackground
    Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo.BackgroundTransparency = 1.000
    Logo.BorderSizePixel = 0
    Logo.Size = UDim2.new(0, 45, 0, 45)
    Logo.Image = "rbxassetid://6771656595"

    hubname.Name = "hubname"
    hubname.Parent = mainbackground
    hubname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    hubname.BackgroundTransparency = 1.000
    hubname.BorderSizePixel = 0
    hubname.Position = UDim2.new(0.0746320337, 0, 0, 0)
    hubname.Size = UDim2.new(0, 154, 0, 45)
    hubname.Font = Enum.Font.SourceSansSemibold
    hubname.Text = "RealZzHub"
    hubname.TextColor3 = Color3.fromRGB(255, 255, 255)
    hubname.TextSize = 41.000
    hubname.TextWrapped = true

    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = mainbackground

    TabContainer.Name = "TabContainer"
    TabContainer.Parent = mainbackground
    TabContainer.Active = true
    TabContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabContainer.BackgroundTransparency = 1.000
    TabContainer.BorderSizePixel = 0
    TabContainer.Position = UDim2.new(0.0133111477, 0, 0.15625, 0)
    TabContainer.Size = UDim2.new(0, 198, 0, 289)
    TabContainer.ScrollBarThickness = 5
    TabContainer.ChildAdded:Connect(function(child) Scale(TabContainer) end)
    TabContainer.ChildRemoved:Connect(function(child)
        Scale(TabContainer)
    end)
    TabContainer:GetPropertyChangedSignal("Size"):Connect(function()
        Scale(TabContainer)
    end)

    UIListLayout.Parent = TabContainer
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0.0199999996, 0)

    Containers.Name = "Containers"
    Containers.Parent = mainbackground
    Containers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Containers.BackgroundTransparency = 1.000
    Containers.BorderSizePixel = 0
    Containers.Position = UDim2.new(0.419301122, 0, 0.15625, 0)
    Containers.Size = UDim2.new(0, 339, 0, 276)

    Bar.Name = "Bar"
    Bar.Parent = mainbackground
    Bar.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
    Bar.BorderSizePixel = 0
    Bar.Position = UDim2.new(0.371048242, 0, 0, 0)
    Bar.Size = UDim2.new(0, 8, 0, 352)

    gamename.Name = "gamename"
    gamename.Parent = mainbackground
    gamename.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    gamename.BackgroundTransparency = 1.000
    gamename.BorderSizePixel = 0
    gamename.Position = UDim2.new(0.419301122, 0, 0, 0)
    gamename.Size = UDim2.new(0, 339, 0, 45)
    gamename.Font = Enum.Font.Gotham
    gamename.Text = GameName
    gamename.TextColor3 = Color3.fromRGB(255, 255, 255)
    gamename.TextSize = 27.000
    gamename.TextXAlignment = Enum.TextXAlignment.Left

    Drag(mainbackground)

    local TabLibrary = {}

    function TabLibrary:NewTab(TabName)

        local Tab = Instance.new("TextButton")
        local Tab1 = Instance.new("ScrollingFrame")
        local UICorner_2 = Instance.new("UICorner")
        local UIListLayout = Instance.new("UIListLayout")
        local UIListLayout_2 = Instance.new("UIListLayout")

        Tab.Name = TabName
        Tab.Parent = TabContainer
        Tab.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
        Tab.Position = UDim2.new(0.06313131, 0, 0.0207612459, 0)
        Tab.Size = UDim2.new(0, 173, 0, 34)
        Tab.Font = Enum.Font.Gotham
        Tab.Text = TabName
        Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
        Tab.TextSize = 35.000
        Tab.MouseButton1Click:Connect(function()
            for i, v in pairs(Containers:GetChildren()) do
                v.Visible = false
            end
            Containers:FindFirstChild(TabName).Visible = true
        end)
        Ripple(Tab)
        UICorner_2.Parent = Tab

        Tab1.Name = TabName
        Tab1.Parent = Containers
        Tab1.Active = true
        Tab1.Visible = false
        Tab1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tab1.BackgroundTransparency = 1.000
        Tab1.BorderSizePixel = 0
        Tab1.Size = UDim2.new(0, 338, 0, 276)
        Tab1.ScrollBarThickness = 5
        Tab1.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
        Tab1.ChildAdded:Connect(function(child) Scale(Tab1) end)
        TabContainer.ChildRemoved:Connect(function(child)
           Scale(Tab1)
        end)
        TabContainer:GetPropertyChangedSignal("Size"):Connect(function()
           Scale(Tab1)
        end)

        UIListLayout.Parent = TabContainer
        UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0.0199999996, 0)

        UIListLayout_2.Parent = Tab1
        UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_2.Padding = UDim.new(0.00800000038, 0)

        local MainLibrary = {}

        function MainLibrary:NewToggle(ToggleName, callback, State)
            local CurrentState = State or false
              local TName = ToggleName


            local ToggleContainer = Instance.new("Frame")
            local UICorner_4 = Instance.new("UICorner")
            local ToggleName = Instance.new("TextLabel")
            local ToggleButton = Instance.new("TextButton")
            local UICorner_5 = Instance.new("UICorner")

            ToggleContainer.Name = "ToggleContainer"
            ToggleContainer.Parent = Tab1
            ToggleContainer.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
         --   ToggleContainer.Position = UDim2.new(0.352071017, 0, 0.226666659, 0)
            ToggleContainer.Size = UDim2.new(0, 315, 0, 27)
            
            ToggleName.Name = "ToggleName"
            ToggleName.Parent = ToggleContainer
            ToggleName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleName.BackgroundTransparency = 1.000
            ToggleName.Position = UDim2.new(0.0190476198, 0, 0, 0)
            ToggleName.Size = UDim2.new(0, 224, 0, 27)
            ToggleName.Font = Enum.Font.Gotham
            ToggleName.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleName.TextSize = 18.000
            ToggleName.TextXAlignment = Enum.TextXAlignment.Left
            ToggleName.Text = tostring(TName)
    
            
            ToggleButton.Name = "ToggleButton"
            ToggleButton.Parent = ToggleContainer
            if not CurrentState then
            ToggleButton.BackgroundColor3 = Color3.fromRGB(102, 68, 132)
            else
            ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            end
            ToggleButton.Position = UDim2.new(0.913650811, 0, 0.111111112, 0)
            ToggleButton.Size = UDim2.new(0, 21, 0, 21)
            ToggleButton.Font = Enum.Font.SourceSans
            ToggleButton.Text = ""
            ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            ToggleButton.TextSize = 14.000
            ToggleButton.MouseButton1Click:Connect(function()
                CurrentState = not CurrentState
                    callback(CurrentState)

                if not CurrentState then
                    ToggleButton.BackgroundColor3 = Color3.fromRGB(102, 68, 132)
                else
                    ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                end
            end)
            
            UICorner_5.CornerRadius = UDim.new(0, 6)
            UICorner_5.Parent = ToggleButton                         
            UICorner_4.CornerRadius = UDim.new(0, 6)
            UICorner_4.Parent = ToggleContainer


            
        end    

        function MainLibrary:NewButton(ButtonName, callback)
            local BName = ButtonName
            local ButtonContainer = Instance.new("Frame")
            local UICorner_6 = Instance.new("UICorner")
            local ButtonButton = Instance.new("TextButton")
            local UICorner_7 = Instance.new("UICorner")
            
            ButtonContainer.Name = "ButtonContainer"
            ButtonContainer.Parent = Tab1
            ButtonContainer.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
            ButtonContainer.Size = UDim2.new(0, 315, 0, 27)

            UICorner_6.CornerRadius = UDim.new(0, 6)
            UICorner_6.Parent = ButtonContainer

            ButtonButton.Name = "ButtonButton"
            ButtonButton.Parent = ButtonContainer
            ButtonButton.BackgroundColor3 = Color3.fromRGB(102, 68, 132)
            ButtonButton.Position = UDim2.new(0.0158730168, 0, 0.0740740746, 0)
            ButtonButton.Size = UDim2.new(0, 304, 0, 23)
            ButtonButton.Font = Enum.Font.Gotham
            ButtonButton.Text = tostring(BName)
            ButtonButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            ButtonButton.TextSize = 18.000
            ButtonButton.MouseButton1Click:Connect(function()    
            callback()
            end)

            UICorner_7.CornerRadius = UDim.new(0, 6)
            UICorner_7.Parent = ButtonButton
        end
        
        function MainLibrary:NewLabel(LabelName)
            local LName = LabelName
            
            local Label = Instance.new("TextLabel")

            Label.Name = "Label"
            Label.Parent = Tab1
            Label.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
            Label.BorderColor3 = Color3.fromRGB(27, 42, 53)
            Label.Position = UDim2.new(0.0340236686, 0, 0, 0)
            Label.Size = UDim2.new(0, 315, 0, 27)
            Label.Font = Enum.Font.Gotham
            Label.Text = tostring(LName)
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.TextSize = 16.000
            
            
        end

function MainLibrary:Slider(SliderName, MinVal, MaxVal, callback, StartValue)
local SName = SliderName
local Val;

local SliderContainer = Instance.new("Frame")
local UICorner_8 = Instance.new("UICorner")
local SliderName = Instance.new("TextLabel")
local SliderValue = Instance.new("TextLabel")
local Slider = Instance.new("TextButton")
local SliderIn = Instance.new("Frame")
local UICorner_9 = Instance.new("UICorner")
local UICorner_10 = Instance.new("UICorner")
 
SliderContainer.Name = "SliderContainer"
SliderContainer.Parent = Tab1
SliderContainer.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
SliderContainer.Position = UDim2.new(0.0340236686, 0, 0.361739129, 0)
SliderContainer.Size = UDim2.new(0, 315, 0, 37)

UICorner_8.CornerRadius = UDim.new(0, 6)
UICorner_8.Parent = SliderContainer

SliderName.Name = "SliderName"
SliderName.Parent = SliderContainer
SliderName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SliderName.BackgroundTransparency = 1.000
SliderName.Position = UDim2.new(0.0190476198, 0, 0, 0)
SliderName.Size = UDim2.new(0, 187, 0, 23)
SliderName.Font = Enum.Font.Gotham
SliderName.TextColor3 = Color3.fromRGB(255, 255, 255)
SliderName.TextSize = 18.000
SliderName.TextXAlignment = Enum.TextXAlignment.Left
SliderName.Text = tostring(SName)

SliderValue.Name = "SliderValue"
SliderValue.Parent = SliderContainer
SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SliderValue.BackgroundTransparency = 1.000
SliderValue.Position = UDim2.new(0.61587292, 0, 0, 0)
SliderValue.Size = UDim2.new(0, 115, 0, 23)
SliderValue.Font = Enum.Font.Gotham
SliderValue.Text = StartValue
SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
SliderValue.TextSize = 18.000
SliderValue.TextXAlignment = Enum.TextXAlignment.Right

Slider.Name = "Slider"
Slider.Parent = SliderContainer
Slider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Slider.BorderSizePixel = 0
Slider.Position = UDim2.new(0.0160000008, 0, 0.621999979, 0)
Slider.Size = UDim2.new(0, 304, 0, 7)
Slider.AutoButtonColor = false
Slider.Font = Enum.Font.SourceSans
Slider.Text = ""
Slider.TextColor3 = Color3.fromRGB(0, 0, 0)
Slider.TextSize = 14.000

SliderIn.Name = "SliderIn"
SliderIn.Parent = Slider
SliderIn.BackgroundColor3 = Color3.fromRGB(102, 68, 132)
SliderIn.Position = UDim2.new(-0.00373679702, 0, -0.00200108113, 0)
SliderIn.Size = UDim2.new(0, 1, 0, 6)

UICorner_9.CornerRadius = UDim.new(0, 6)
UICorner_9.Parent = SliderIn

UICorner_10.CornerRadius = UDim.new(0, 6)
UICorner_10.Parent = Slider
 
Slider.MouseButton1Down:Connect(function()
    Val = math.floor((((tonumber(MaxVal) - tonumber(MinVal)) / 318) * SliderIn.AbsoluteSize.X) + tonumber(MinVal)) or 0
    pcall(function()
        callback(Val)
    end)
    SliderIn.Size = UDim2.new(0, math.clamp(zzMouse.X - Slider.AbsolutePosition.X, 0, 318), 0, 16)
    MCon = zzMouse.Move:Connect(function()
        SliderValue.Text = Val
        Val = math.floor((((tonumber(MaxVal) - tonumber(MinVal)) / 318) * SliderIn.AbsoluteSize.X) + tonumber(MinVal))
        pcall(function()
            callback(Val)
        end)
        Slider.Size = UDim2.new(0, math.clamp(zzMouse.X - SliderIn.AbsolutePosition.X, 0, 318), 0, 16)
    end)
    RCon = zzUIS.InputEnded:Connect(function(Mouse)
        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
            Val = math.floor((((tonumber(MaxVal) - tonumber(MinVal)) / 318) * SliderIn.AbsoluteSize.X) + tonumber(MinVal))
            pcall(function()
                callback(Val)
            end)
            SliderIn.Size = UDim2.new(0, math.clamp(zzMouse.X - SliderIn.AbsolutePosition.X, 0, 318), 0, 16)
            MCon:Disconnect()
            RCon:Disconnect()
        end
end)

end

        return MainLibrary
        
        
    end

    
    return TabLibrary
end
return RealZzLib

-----------------------------------
