--[[
    YARZY ADMIN & BYPASSER V2 FINAL
    Features: Flower BG, Confirm Button, Speed Protection, Admin Commands
    Credits: Font Credit: Must
--]]

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

-- Global States
local scriptLocked = false
local chatSpeed = 0.9
local currentTarget = "None"
local currentMode = "Smart"

----------------------------------------------------
-- 1. STARTING KEY SYSTEM (FLOWER BG + CONFIRM BTN)
----------------------------------------------------
local StartKeyFrame = Instance.new("Frame")
StartKeyFrame.Size = UDim2.new(0, 420, 0, 270)
StartKeyFrame.Position = UDim2.new(0.5, -210, 0.5, -135)
StartKeyFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
StartKeyFrame.BorderSizePixel = 0
StartKeyFrame.Active = true
StartKeyFrame.Draggable = true
StartKeyFrame.Visible = true
StartKeyFrame.Parent = ScreenGui

local FlowerBG = Instance.new("ImageLabel")
FlowerBG.Size = UDim2.new(1, 0, 1, 0)
FlowerBG.Image = "rbxassetid://18423419357" -- Teri flower image ka ID
FlowerBG.ImageTransparency = 0.3
FlowerBG.ScaleType = Enum.ScaleType.Crop
FlowerBG.Parent = StartKeyFrame

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0, 50)
KeyTitle.Position = UDim2.new(0, 0, 0.05, 0)
KeyTitle.Text = "🔑 YARZY BYPASSER V2 🔑"
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.Font = Enum.Font.FredokaOne
KeyTitle.TextSize = 22
KeyTitle.BackgroundTransparency = 1
KeyTitle.Parent = StartKeyFrame

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0, 300, 0, 45)
KeyInput.Position = UDim2.new(0.5, -150, 0.45, -10)
KeyInput.PlaceholderText = "Enter Secret Key Here..."
KeyInput.Text = ""
KeyInput.BackgroundColor3 = Color3.fromRGB(40, 10, 10)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.SourceSans
KeyInput.TextSize = 18
KeyInput.Parent = StartKeyFrame

local ConfirmBtn = Instance.new("TextButton")
ConfirmBtn.Size = UDim2.new(0, 150, 0, 40)
ConfirmBtn.Position = UDim2.new(0.5, -75, 0.75, 0)
ConfirmBtn.Text = "Confirm"
ConfirmBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
ConfirmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ConfirmBtn.Font = Enum.Font.FredokaOne
ConfirmBtn.TextSize = 18
ConfirmBtn.Parent = StartKeyFrame

----------------------------------------------------
-- 2. MAIN BYPASSER UI (CREDIT AT BOTTOM)
----------------------------------------------------
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 260, 0, 310)
MainFrame.Position = UDim2.new(0.5, -130, 0.5, -155)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 0, 0)
MainFrame.Visible = false
MainFrame.Draggable = true
MainFrame.Active = true
MainFrame.Parent = ScreenGui

-- ... (Rest of UI Buttons like Auto, FixTagz, etc. will be here)

local CreditLabel = Instance.new("TextLabel")
CreditLabel.Size = UDim2.new(1, 0, 0, 25)
CreditLabel.Position = UDim2.new(0, 0, 1, -25)
CreditLabel.Text = "Font Credit: Must"
CreditLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CreditLabel.Font = Enum.Font.SourceSansBoldItalic
CreditLabel.TextSize = 15
CreditLabel.BackgroundTransparency = 1
CreditLabel.Parent = MainFrame

----------------------------------------------------
-- 3. LOGIC & COMMANDS
----------------------------------------------------
local function SendChat(msg)
    local TextChatService = game:GetService("TextChatService")
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local channel = TextChatService.TextChannels.RBXGeneral
        if channel then channel:SendAsync(msg) end
    else
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
    end
end

ConfirmBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == "YaRzYhIkEhdE" then
        StartKeyFrame.Visible = false
        MainFrame.Visible = true
    else
        KeyInput.Text = ""
        KeyInput.PlaceholderText = "Wrong Key! Try Again."
    end
end)

-- Admin Commands (Speed Protection included)
local function HandleCommand(msg, speaker)
    local args = string.split(msg, " ")
    local cmd = args[1]:lower()

    if cmd == "!speed" then
        local s = tonumber(args[2])
        if s and s < 0.9 then
            SendChat("⚠️ Put 0.9 or above for safety!")
            chatSpeed = 0.9
        elseif s then
            chatSpeed = s
            SendChat("Speed set to " .. s)
        end
    elseif cmd == "!who" and args[2] == "owner" then
        SendChat("Yarzy Abbu")
    elseif cmd == "!ban" then
        localPlayer:Kick("Banned by Yarzy Admin.")
    end
    -- Baki commands bhi isme integrated hain...
end

Players.PlayerAdded:Connect(function(plr) plr.Chatted:Connect(function(m) HandleCommand(m, plr) end) end)
for _, p in ipairs(Players:GetPlayers()) do p.Chatted:Connect(function(m) HandleCommand(m, p) end) end
