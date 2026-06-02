--[[
    YARZY BYPASSER V2 (Instant Center Screen Edition)
--]]

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local MainFrameUICorner = Instance.new("UICorner")
local TopBar = Instance.new("TextLabel")
local CloseBtn = Instance.new("TextButton")
local TextBox = Instance.new("TextBox")
local SendBtn = Instance.new("TextButton")
local ToggleMode = Instance.new("TextButton")

-- Buttons 
local AutoBtn = Instance.new("TextButton")
local FixTagzBtn = Instance.new("TextButton")
local SupportBtn = Instance.new("TextButton")
local SmartLinesBtn = Instance.new("TextButton")
local VipModeBtn = Instance.new("TextButton")

-- VIP Key Verification Frame
local KeyFrame = Instance.new("Frame")
local KeyTitle = Instance.new("TextLabel")
local KeyInput = Instance.new("TextBox")
local KeyVerifyBtn = Instance.new("TextButton")
local KeyClose = Instance.new("TextButton")

-- VIP Menu Frame
local VipFrame = Instance.new("Frame")
local VipTitle = Instance.new("TextLabel")
local VipClose = Instance.new("TextButton")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

----------------------------------------------------
-- 1. MAIN INTERFACE (Direct Center Position Fix)
----------------------------------------------------
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 260, 0, 310)
-- Screen ke bilkul center me lane ke liye fixed position:
MainFrame.Position = UDim2.new(0.5, -130, 0.5, -155)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true -- Direct visible bina freeze ke
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
local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 5)
CloseCorner.Parent = CloseBtn
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

TextBox.Size = UDim2.new(0, 240, 0, 35)
TextBox.Position = UDim2.new(0, 10, 0, 45)
TextBox.PlaceholderText = "Enter text..."
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundColor3 = Color3.fromRGB(45, 10, 10)
TextBox.Font = Enum.Font.SourceSans
TextBox.TextSize = 16
TextBox.Parent = MainFrame
local TextCorner = Instance.new("UICorner")
TextCorner.CornerRadius = UDim.new(0, 6)
TextCorner.Parent = TextBox

SendBtn.Size = UDim2.new(0, 150, 0, 35)
SendBtn.Position = UDim2.new(0, 10, 0, 90)
SendBtn.Text = "Send"
SendBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SendBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
SendBtn.Font = Enum.Font.SourceSansBold
SendBtn.TextSize = 16
SendBtn.Parent = MainFrame
local SendCorner = Instance.new("UICorner")
SendCorner.CornerRadius = UDim.new(0, 6)
SendCorner.Parent = SendBtn

ToggleMode.Size = UDim2.new(0, 80, 0, 35)
ToggleMode.Position = UDim2.new(0, 170, 0, 90)
ToggleMode.Text = "Off v"
ToggleMode.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleMode.BackgroundColor3 = Color3.fromRGB(50, 10, 10)
ToggleMode.Font = Enum.Font.SourceSans
ToggleMode.TextSize = 16
ToggleMode.Parent = MainFrame
local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 6)
ToggleCorner.Parent = ToggleMode

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

createButton(AutoBtn, "AUTO v", UDim2.new(0, 10, 0, 135))
createButton(FixTagzBtn, "FIX TAGZ", UDim2.new(0, 135, 0, 135))
createButton(SupportBtn, "Support", UDim2.new(0, 10, 0, 175))
createButton(SmartLinesBtn, "Smart Lines", UDim2.new(0, 135, 0, 175))

VipModeBtn.Size = UDim2.new(0, 240, 0, 35)
VipModeBtn.Position = UDim2.new(0, 10, 0, 215)
VipModeBtn.Text = "VIP MODE"
VipModeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VipModeBtn.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
VipModeBtn.Font = Enum.Font.FredokaOne
VipModeBtn.TextSize = 16
VipModeBtn.Parent = MainFrame
local VipCorner = Instance.new("UICorner")
VipCorner.CornerRadius = UDim.new(0, 6)
VipCorner.Parent = VipModeBtn

----------------------------------------------------
-- 2. VIP KEY POPUP
----------------------------------------------------
KeyFrame.Size = UDim2.new(0, 230, 0, 130)
KeyFrame.Position = UDim2.new(0.5, -115, 0.4, -65)
KeyFrame.BackgroundColor3 = Color3.fromRGB(25, 5, 5)
KeyFrame.Visible = false
KeyFrame.Parent = ScreenGui
local KeyFrameCorner = Instance.new("UICorner")
KeyFrameCorner.CornerRadius = UDim.new(0, 8)
KeyFrameCorner.Parent = KeyFrame
local KeyFrameStroke = Instance.new("UIStroke")
KeyFrameStroke.Color = Color3.fromRGB(255, 0, 0)
KeyFrameStroke.Thickness = 1.5
KeyFrameStroke.Parent = KeyFrame

KeyTitle.Size = UDim2.new(1, 0, 0, 30)
KeyTitle.Text = "Enter VIP Access Key"
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
KeyTitle.Font = Enum.Font.FredokaOne
KeyTitle.TextSize = 13
KeyTitle.Parent = KeyFrame

KeyInput.Size = UDim2.new(0, 210, 0, 30)
KeyInput.Position = UDim2.new(0, 10, 0, 45)
KeyInput.PlaceholderText = "Type Secret VIP Key..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.BackgroundColor3 = Color3.fromRGB(40, 10, 10)
KeyInput.Font = Enum.Font.SourceSans
KeyInput.TextSize = 14
KeyInput.Parent = KeyFrame

KeyVerifyBtn.Size = UDim2.new(0, 210, 0, 30)
KeyVerifyBtn.Position = UDim2.new(0, 10, 0, 85)
KeyVerifyBtn.Text = "Verify & Access"
KeyVerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyVerifyBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
KeyVerifyBtn.Font = Enum.Font.FredokaOne
KeyVerifyBtn.TextSize = 13
KeyVerifyBtn.Parent = KeyFrame

KeyClose.Size = UDim2.new(0, 20, 0, 20)
KeyClose.Position = UDim2.new(1, -25, 0, 5)
KeyClose.Text = "X"
KeyClose.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyClose.BackgroundTransparency = 1
KeyClose.Font = Enum.Font.SourceSansBold
KeyClose.Parent = KeyFrame
KeyClose.MouseButton1Click:Connect(function() KeyFrame.Visible = false end)

----------------------------------------------------
-- 3. VIP FEATURES PANEL
----------------------------------------------------
VipFrame.Size = UDim2.new(0, 250, 0, 280)
VipFrame.Position = UDim2.new(0.5, -125, 0.5, -140)
VipFrame.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
VipFrame.Visible = false
VipFrame.Active = true
VipFrame.Draggable = true
VipFrame.Parent = ScreenGui

local VipFrameCorner = Instance.new("UICorner")
VipFrameCorner.CornerRadius = UDim.new(0, 10)
VipFrameCorner.Parent = VipFrame
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
VipClose.TextSize = 16
VipClose.Parent = VipFrame
VipClose.MouseButton1Click:Connect(function() VipFrame.Visible = false end)

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
    FeatLabel.TextSize = 14
    FeatLabel.TextXAlignment = Enum.TextXAlignment.Left
    FeatLabel.Parent = VipFrame
    local fCorner = Instance.new("UICorner")
    fCorner.CornerRadius = UDim.new(0, 5)
    fCorner.Parent = FeatLabel
    local padding = Instance.new("UIPadding")
    padding.PaddingLeft = UDim.new(0, 10)
    padding.Parent = FeatLabel
end

----------------------------------------------------
-- 4. RUN TIME LOGIC
----------------------------------------------------
VipModeBtn.MouseButton1Click:Connect(function()
    if VipFrame.Visible == true then
        VipFrame.Visible = false
    else
        KeyFrame.Visible = true
    end
end)

KeyVerifyBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == "YaRzYhIkEhdE" then
        KeyFrame.Visible = false
        VipFrame.Visible = true
        KeyInput.Text = ""
    else
        KeyInput.Text = ""
        KeyInput.PlaceholderText = "Wrong Secret Key! Try Again."
    end
end)

local function BypassAndChat()
    local text = TextBox.Text
    if text ~= "" then
        local bypassedText = ""
        for i = 1, #text do
            local char = text:sub(i, i)
            bypassedText = bypassedText .. char .. "̲"
        end
        local TextChatService = game:GetService("TextChatService")
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local channel = TextChatService.TextChannels.RBXGeneral
            channel:SendAsync(bypassedText)
        else
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(bypassedText, "All")
        end
        TextBox.Text = ""
    end
end
SendBtn.MouseButton1Click:Connect(BypassAndChat)
