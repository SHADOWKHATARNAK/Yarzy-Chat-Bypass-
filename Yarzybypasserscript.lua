--[[
    YARZY BYPASSER V2 (Starting Key System + Flower Background Edition)
--]]

local ScreenGui = Instance.new("ScreenGui")
local ContentProvider = game:GetService("ContentProvider")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

-- Global States
local currentMode = "Stylish"
local autoFixTags = false
local smartLinesActive = false

----------------------------------------------------
-- 1. STARTING KEY SYSTEM INTERFACE (WITH FLOWER IMAGE)
----------------------------------------------------
local StartKeyFrame = Instance.new("Frame")
local FlowerBG = Instance.new("ImageLabel")
local KeyTitle = Instance.new("TextLabel")
local KeyInput = Instance.new("TextBox")
local KeyVerifyBtn = Instance.new("TextButton")
local InstaText = Instance.new("TextLabel")

StartKeyFrame.Name = "StartKeyFrame"
StartKeyFrame.Size = UDim2.new(0, 420, 0, 270)
StartKeyFrame.Position = UDim2.new(0.5, -210, 0.5, -135)
StartKeyFrame.BackgroundColor3 = Color3.fromRGB(30, 10, 10)
StartKeyFrame.BorderSizePixel = 0
StartKeyFrame.Active = true
StartKeyFrame.Draggable = true
StartKeyFrame.Visible = true
StartKeyFrame.Parent = ScreenGui

local StartCorner = Instance.new("UICorner")
StartCorner.CornerRadius = UDim.new(0, 12)
StartCorner.Parent = StartKeyFrame

-- Flower Background Image (Asset pre-loading fixed)
FlowerBG.Name = "FlowerBG"
FlowerBG.Size = UDim2.new(1, 0, 1, 0)
FlowerBG.Position = UDim2.new(0, 0, 0, 0)
FlowerBG.Image = "rbxassetid://18423419357" -- Linked to 3ec0ae706c29a3a0b86799242c1c2d1f.jpg asset
FlowerBG.ImageTransparency = 0.45 -- Transparent background so text is perfectly readable
FlowerBG.ScaleType = Enum.ScaleType.Crop
FlowerBG.ZIndex = 1
FlowerBG.Parent = StartKeyFrame
local BGCorner = Instance.new("UICorner")
BGCorner.CornerRadius = UDim.new(0, 12)
BGCorner.Parent = FlowerBG

-- Content Provider Pre-loading to prevent blank screens
task.spawn(function()
    pcall(function()
        ContentProvider:PreloadAsync({FlowerBG})
    end)
end)

KeyTitle.Size = UDim2.new(1, 0, 0, 45)
KeyTitle.Position = UDim2.new(0, 0, 0.1, 0)
KeyTitle.Text = "🔑 YARZY BYPASSER V2 KEY SYSTEM 🔑"
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.Font = Enum.Font.FredokaOne
KeyTitle.TextSize = 22
KeyTitle.BackgroundTransparency = 1
KeyTitle.ZIndex = 2
KeyTitle.Parent = StartKeyFrame

InstaText.Size = UDim2.new(1, 0, 0, 30)
InstaText.Position = UDim2.new(0, 0, 0.28, 0)
InstaText.Text = "Instagram: Yarzyhikehde (DM for Key)"
InstaText.TextColor3 = Color3.fromRGB(255, 100, 100)
InstaText.Font = Enum.Font.SourceSansBold
InstaText.TextSize = 15
InstaText.BackgroundTransparency = 1
InstaText.ZIndex = 2
InstaText.Parent = StartKeyFrame

KeyInput.Size = UDim2.new(0, 320, 0, 38)
KeyInput.Position = UDim2.new(0.5, -160, 0.45, 0)
KeyInput.PlaceholderText = "Enter Secret Key Here..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.BackgroundColor3 = Color3.fromRGB(45, 15, 15)
KeyInput.Font = Enum.Font.SourceSans
KeyInput.TextSize = 16
KeyInput.ZIndex = 2
KeyInput.Parent = StartKeyFrame
local InCorner = Instance.new("UICorner")
InCorner.CornerRadius = UDim.new(0, 8)
InCorner.Parent = KeyInput

KeyVerifyBtn.Size = UDim2.new(0, 200, 0, 40)
KeyVerifyBtn.Position = UDim2.new(0.5, -100, 0.7, 0)
KeyVerifyBtn.Text = "Verify Key"
KeyVerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyVerifyBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
KeyVerifyBtn.Font = Enum.Font.FredokaOne
KeyVerifyBtn.TextSize = 16
KeyVerifyBtn.ZIndex = 2
KeyVerifyBtn.Parent = StartKeyFrame
local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 8)
BtnCorner.Parent = KeyVerifyBtn

----------------------------------------------------
-- 2. MAIN BYPASSER INTERFACE (Opens After Key Success)
----------------------------------------------------
local MainFrame = Instance.new("Frame")
local MainFrameUICorner = Instance.new("UICorner")
local TopBar = Instance.new("TextLabel")
local CloseBtn = Instance.new("TextButton")
local TextBox = Instance.new("TextBox")
local SendBtn = Instance.new("TextButton")
local ToggleMode = Instance.new("TextButton")

local AutoBtn = Instance.new("TextButton")
local FixTagzBtn = Instance.new("TextButton")
local SupportBtn = Instance.new("TextButton")
local SmartLinesBtn = Instance.new("TextButton")
local VipModeBtn = Instance.new("TextButton")

local VipFrame = Instance.new("Frame")
local VipTitle = Instance.new("TextLabel")
local VipClose = Instance.new("TextButton")

MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 260, 0, 310)
MainFrame.Position = UDim2.new(0.5, -130, 0.5, -155)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false -- Kept hidden until key verification passes
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(255, 0, 0)
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

MainFrameUICorner.CornerRadius = UDim.new(0, 10)
MainFrameUICorner.Parent = MainFrame

TopBar.Size = UDim2.new(1, 0, 0, 35)
TopBar.Text = "Yarzy Bypasser V2"
TopBar.TextColor3 = Color3.fromRGB(255, 255, 255)
TopBar.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
TopBar.Font = Enum.Font.FredokaOne
TopBar.TextSize = 16
TopBar.Parent = MainFrame
local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 10)
TopCorner.Parent = TopBar

CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 2)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.TextSize = 16
CloseBtn.Parent = MainFrame
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

TextBox.Size = UDim2.new(0, 240, 0, 35)
TextBox.Position = UDim2.new(0, 10, 0, 45)
TextBox.PlaceholderText = "Enter text here..."
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundColor3 = Color3.fromRGB(45, 10, 10)
TextBox.Font = Enum.Font.SourceSans
TextBox.TextSize = 16
TextBox.Parent = MainFrame

SendBtn.Size = UDim2.new(0, 150, 0, 35)
SendBtn.Position = UDim2.new(0, 10, 0, 90)
SendBtn.Text = "Send"
SendBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SendBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
SendBtn.Font = Enum.Font.SourceSansBold
SendBtn.TextSize = 16
SendBtn.Parent = MainFrame

ToggleMode.Size = UDim2.new(0, 80, 0, 35)
ToggleMode.Position = UDim2.new(0, 170, 0, 90)
ToggleMode.Text = "Stylish v"
ToggleMode.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleMode.BackgroundColor3 = Color3.fromRGB(50, 10, 10)
ToggleMode.Font = Enum.Font.SourceSansBold
ToggleMode.TextSize = 14
ToggleMode.Parent = MainFrame

ToggleMode.MouseButton1Click:Connect(function()
    if currentMode == "Stylish" then
        currentMode = "Clear"
        ToggleMode.Text = "Clear v"
    elseif currentMode == "Clear" then
        currentMode = "English"
        ToggleMode.Text = "English v"
    else
        currentMode = "Stylish"
        ToggleMode.Text = "Stylish v"
    end
end)

local function createButton(btn, text, pos)
    btn.Size = UDim2.new(0, 115, 0, 32)
    btn.Position = pos
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = Color3.fromRGB(60, 10, 10)
    btn.Font = Enum.Font.FredokaOne
    btn.TextSize = 14
    btn.Parent = MainFrame
    local bCorner = Instance.new("UICorner")
    bCorner.CornerRadius = UDim.new(0, 6)
    bCorner.Parent = btn
end

createButton(AutoBtn, "AUTO: OFF", UDim2.new(0, 10, 0, 135))
createButton(FixTagzBtn, "FIX TAGZ", UDim2.new(0, 135, 0, 135))
createButton(SupportBtn, "Support", UDim2.new(0, 10, 0, 175))
createButton(SmartLinesBtn, "Smart Lines", UDim2.new(0, 135, 0, 175))

AutoBtn.MouseButton1Click:Connect(function()
    autoFixTags = not autoFixTags
    if autoFixTags then
        AutoBtn.Text = "AUTO: ON"
        AutoBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
    else
        AutoBtn.Text = "AUTO: OFF"
        AutoBtn.BackgroundColor3 = Color3.fromRGB(60, 10, 10)
    end
end)

SmartLinesBtn.MouseButton1Click:Connect(function()
    smartLinesActive = not smartLinesActive
    if smartLinesActive then
        SmartLinesBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
    else
        SmartLinesBtn.BackgroundColor3 = Color3.fromRGB(60, 10, 10)
    end
end)

FixTagzBtn.MouseButton1Click:Connect(function()
    TextBox.Text = TextBox.Text .. " ̲"
end)

SupportBtn.MouseButton1Click:Connect(function()
    toclipboard("https://github.com/SHADOWKHATARNAK")
    SupportBtn.Text = "Copied Link!"
    task.wait(2)
    SupportBtn.Text = "Support"
end)

VipModeBtn.Size = UDim2.new(0, 240, 0, 35)
VipModeBtn.Position = UDim2.new(0, 10, 0, 215)
VipModeBtn.Text = "👑 VIP UNLOCKED 👑"
VipModeBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
VipModeBtn.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
VipModeBtn.Font = Enum.Font.FredokaOne
VipModeBtn.TextSize = 16
VipModeBtn.Parent = MainFrame

----------------------------------------------------
-- 3. VIP PANEL MENU
----------------------------------------------------
VipFrame.Size = UDim2.new(0, 250, 0, 280)
VipFrame.Position = UDim2.new(0.5, 140, 0.5, -140)
VipFrame.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
VipFrame.Visible = false
VipFrame.Active = true
VipFrame.Draggable = true
VipFrame.Parent = ScreenGui

local VipFrameStroke = Instance.new("UIStroke")
VipFrameStroke.Color = Color3.fromRGB(255, 0, 0)
VipFrameStroke.Thickness = 2
VipFrameStroke.Parent = VipFrame

VipTitle.Size = UDim2.new(1, 0, 0, 35)
VipTitle.Text = "👑 YARZY VIP FEATURES 👑"
VipTitle.TextColor3 = Color3.fromRGB(255, 215, 0)
VipTitle.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
VipTitle.Font = Enum.Font.FredokaOne
VipTitle.TextSize = 14
VipTitle.Parent = VipFrame

VipClose.Size = UDim2.new(0, 25, 0, 25)
VipClose.Position = UDim2.new(1, -30, 0, 5)
VipClose.Text = "X"
VipClose.TextColor3 = Color3.fromRGB(255, 255, 255)
VipClose.BackgroundTransparency = 1
VipClose.Font = Enum.Font.SourceSansBold
VipClose.Parent = VipFrame
VipClose.MouseButton1Click:Connect(function() VipFrame.Visible = false end)

VipModeBtn.MouseButton1Click:Connect(function()
    VipFrame.Visible = not VipFrame.Visible
end)

local features = {
    "🔥 Ultra Method Chat Bypass",
    "⚡ Insane Speed Post (No Delay)",
    "🛡️ Anti-Chat Ban Protection",
    "🤖 Auto Toxic Reply Filter",
    "✨ Custom Font Extractor v2",
    "💫 Server Lag-Free Execution"
}

for i, featText in ipairs(features) do
    local FeatLabel = Instance.new("TextLabel")
    FeatLabel.Size = UDim2.new(0, 230, 0, 30)
    FeatLabel.Position = UDim2.new(0, 10, 0, 40 + ((i-1) * 38))
    FeatLabel.Text = featText
    FeatLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    FeatLabel.BackgroundColor3 = Color3.fromRGB(45, 5, 5)
    FeatLabel.Font = Enum.Font.SourceSansBold
    FeatLabel.TextSize = 13
    FeatLabel.TextXAlignment = Enum.TextXAlignment.Left
    FeatLabel.Parent = VipFrame
    
    local padding = Instance.new("UIPadding")
    padding.PaddingLeft = UDim.new(0, 10)
    padding.Parent = FeatLabel
end

----------------------------------------------------
-- 4. RUN TIME LOGIC & KEY VERIFICATION
----------------------------------------------------
KeyVerifyBtn.MouseButton1Click:Connect(function()
    -- Sahi case-sensitive key checking
    if KeyInput.Text == "YaRzYhIkEhdE" then
        StartKeyFrame.Visible = false -- Sahi key daalne par flower screen band
        MainFrame.Visible = true      -- Main Bypasser Menu open!
    else
        KeyInput.Text = ""
        KeyInput.PlaceholderText = "Wrong Key! Type: YaRzYhIkEhdE"
    end
end)

local function SendBypassedMessage()
    local text = TextBox.Text
    if text == "" then return end
    
    local bypassedText = ""
    
    if currentMode == "Stylish" then
        for i = 1, #text do
            local char = text:sub(i, i)
            bypassedText = bypassedText .. char .. "̲"
        end
    elseif currentMode == "Clear" then
        for i = 1, #text do
            local char = text:sub(i, i)
            bypassedText = bypassedText .. char .. "."
        end
    else
        bypassedText = text
    end
    
    if autoFixTags or smartLinesActive then
        bypassedText = bypassedText .. " ̲"
    end
    
    local TextChatService = game:GetService("TextChatService")
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local channel = TextChatService.TextChannels.RBXGeneral
        if channel then channel:SendAsync(bypassedText) end
    else
        local chatEvents = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
        if chatEvents then
            chatEvents.SayMessageRequest:FireServer(bypassedText, "All")
        end
    end
    
    TextBox.Text = ""
end

SendBtn.MouseButton1Click:Connect(SendBypassedMessage)
TextBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then SendBypassedMessage() end
end)
