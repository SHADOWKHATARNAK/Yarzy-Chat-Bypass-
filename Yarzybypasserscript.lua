--[[
    YARZY ADMIN & BYPASSER V2 (FLOWER & PROTECTED SPEED EDITION)
    Commands: !target, !who owner, !say, !byoff, !bylock, !byunlock, !byon, !who admin, !start spam, !hi, !speed, !ban
    Credits: Font Credit: Must
--]]

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
local ContentProvider = game:GetService("ContentProvider")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

-- Global States
local scriptLocked = false
local chatSpeed = 0.9 -- Default safe speed
local currentTarget = "None"
local currentMode = "Smart"
local autoFixTags = false

----------------------------------------------------
-- FONTS DICTIONARIES (BY MUST)
----------------------------------------------------
local fontSmart = {
    a = "ล", b = "lٌɔ", c = "c", d = "cٌlٌ", e = "e", f = "f", g = "ჭ",
    h = "lา", i = "i", j = "j", k = "ƙּ", l = "l", m = "ıาา", n = "ıา",
    o = "o", p = "p", q = "q", r = "ɽ", s = "ร", t = "ƚ", u = "ıɹ",
    v = "v", w = "w", x = "x", y = "ყ", z = "z"
}

local fontHindi = {
    a = "ล", b = "ҍ҉", c = "ƈ҉", d = "Ԁׁׁׅׅ҉", e = "ҿ҉", f = "ƒ҉", g = "ǥׁׁׅׅ",
    h = "ԋ҉", i = "เ่", j = "ʝ҉", k = "ҟׁׅ҉", l = "ʅ҉", m = "ᴍ҉", n = "ιา",
    o = "σ҉", p = "ρ҉", q = "ϙ҉", r = "ɾ҉", s = "ʂ҉", t = "ƚ҉", u = "ıɹ",
    v = "ʋ҉", w = "ɯ҉", x = "Ӽ҉", y = "Ƴ҉", z = "ȥ҉"
}

local fontEnglish = {
    a = "ล", b = "ҍ҉", c = "ςׁׅ", d = "Ԁׁׁׅׅ ", e = "ҿ҉", f = "ƒ҉", g = "ǥׁ",
    h = "ԋ҉", i = "เ่", j = "ʝ҉", k = "ҟׁׅ", l = "ʅ҉", m = "ӎִׄ", n = "ιา",
    o = "σ҉", p = "ƿׁׅ", q = "ϙ҉", r = "ɾ҉", s = "ऽ", t = "ƚ҉", u = "ıɹ",
    v = "ʋ҉", w = "ɯ҉", x = "Ӽ҉", y = "ឫ", z = "ȥ҉"
}

local fontClear = {
    a = "ล", b = "lٌɔ", c = "ჺ", d = "cٌlٌ", e = "e", f = "f", g = "ჭ",
    h = "lา", i = "เ่", j = "ʝ", k = "ƙּ", l = "ɭ", m = "ıาา", n = "ıา",
    o = "o", p = "p", q = "q", r = "ɽ", s = "န", t = "ƚ", u = "ıɹ",
    v = "v", w = "ıɹɹ", x = "א", y = "ყ", z = "z"
}

local fontStylish = {
    a = "ล", b = "lٌɔ", c = "ჺ", d = "cٌlٌ", e = "ㅌ", f = "Ŧ", g = "ჭ",
    h = "lา", i = "เ่", j = "ʝ", k = "қ", l = "ʅ", m = "ıาา", n = "ıา",
    o = "๏", p = "႞ↄ", q = "ϙ", r = "ɽ", s = "န", t = "ƚ", u = "ıɹ",
    v = "√", w = "ıɹɹ", x = "א", y = "ყ", z = "z"
}

local fontBest = {
    a = "ล", b = "ҍ", c = "ςׁׅ", d = "₫", e = "ҿ", f = "Ŧ", g = "ԍׁׁׅׅ",
    h = "ң", i = "เ่", j = "ʝ", k = "ҟׁׅ", l = "l", m = "ӎִׄ", n = "ภ",
    o = "๏", p = "ƿׁׅ", q = "ϙ", r = "ꞅׁׅ", s = "ร", t = "ƚ", u = "ıɹ",
    v = "√", w = "ฬ", x = "א", y = "ឫ", z = "z"
}

----------------------------------------------------
-- 1. STARTING KEY SYSTEM (FLOWER BACKGROUND)
----------------------------------------------------
local StartKeyFrame = Instance.new("Frame")
local FlowerBG = Instance.new("ImageLabel")
local KeyTitle = Instance.new("TextLabel")
local KeyInput = Instance.new("TextBox")

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

FlowerBG.Name = "FlowerBG"
FlowerBG.Size = UDim2.new(1, 0, 1, 0)
FlowerBG.Image = "rbxassetid://18423419357" -- Flower Image Label
FlowerBG.ImageTransparency = 0.45
FlowerBG.ScaleType = Enum.ScaleType.Crop
FlowerBG.Parent = StartKeyFrame
local BGCorner = Instance.new("UICorner")
BGCorner.CornerRadius = UDim.new(0, 12)
BGCorner.Parent = FlowerBG

KeyTitle.Size = UDim2.new(1, 0, 0, 45)
KeyTitle.Position = UDim2.new(0, 0, 0.1, 0)
KeyTitle.Text = "🔑 YARZY BYPASSER V2 🔑"
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.Font = Enum.Font.FredokaOne
KeyTitle.TextSize = 20
KeyTitle.BackgroundTransparency = 1
KeyTitle.Parent = StartKeyFrame

KeyInput.Size = UDim2.new(0, 320, 0, 38)
KeyInput.Position = UDim2.new(0.5, -160, 0.5, -10)
KeyInput.PlaceholderText = "Enter Secret Key Here..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.BackgroundColor3 = Color3.fromRGB(45, 15, 15)
KeyInput.Font = Enum.Font.SourceSans
KeyInput.TextSize = 16
KeyInput.Parent = StartKeyFrame
local InCorner = Instance.new("UICorner")
InCorner.CornerRadius = UDim.new(0, 8)
InCorner.Parent = KeyInput

----------------------------------------------------
-- 2. MAIN INTERFACE WITH CREDITS LABEL
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
local VipModeBtn = Instance.new("TextButton")
local CreditLabel = Instance.new("TextLabel")

MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 260, 0, 305) -- Slightly enlarged for credit layout
MainFrame.Position = UDim2.new(0.5, -130, 0.5, -152)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
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
ToggleMode.Text = "Smart v"
ToggleMode.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleMode.BackgroundColor3 = Color3.fromRGB(50, 10, 10)
ToggleMode.Font = Enum.Font.SourceSansBold
ToggleMode.TextSize = 13
ToggleMode.Parent = MainFrame

local modesList = {"Smart", "Hindi", "English", "Clear", "Stylish", "Best"}
ToggleMode.MouseButton1Click:Connect(function()
    local idx = 1
    for i, v in ipairs(modesList) do
        if v == currentMode then idx = i break end
    end
    idx = idx % #modesList + 1
    currentMode = modesList[idx]
    ToggleMode.Text = currentMode .. " v"
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

AutoBtn.MouseButton1Click:Connect(function()
    autoFixTags = not autoFixTags
    AutoBtn.Text = autoFixTags and "AUTO: ON" or "AUTO: OFF"
    AutoBtn.BackgroundColor3 = autoFixTags and Color3.fromRGB(0, 120, 0) or Color3.fromRGB(60, 10, 10)
end)

FixTagzBtn.MouseButton1Click:Connect(function()
    TextBox.Text = TextBox.Text .. "ajxjvnsiwurmxncncj"
end)

SupportBtn.MouseButton1Click:Connect(function()
    toclipboard("https://github.com/SHADOWKHATARNAK")
    SupportBtn.Text = "Copied Link!"
    task.wait(2)
    SupportBtn.Text = "Support"
end)

VipModeBtn.Size = UDim2.new(0, 240, 0, 35)
VipModeBtn.Position = UDim2.new(0, 10, 0, 220)
VipModeBtn.Text = "👑 VIP UNLOCKED 👑"
VipModeBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
VipModeBtn.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
VipModeBtn.Font = Enum.Font.FredokaOne
VipModeBtn.TextSize = 16
VipModeBtn.Parent = MainFrame

-- Required Font Credit Label Added Perfect at the bottom
CreditLabel.Size = UDim2.new(1, 0, 0, 20)
CreditLabel.Position = UDim2.new(0, 0, 1, -25)
CreditLabel.Text = "Font Credit: Must"
CreditLabel.TextColor3 = Color3.fromRGB(220, 30, 30)
CreditLabel.Font = Enum.Font.SourceSansBoldItalic
CreditLabel.TextSize = 14
CreditLabel.BackgroundTransparency = 1
CreditLabel.Parent = MainFrame

----------------------------------------------------
-- 3. CORE FUNCTIONAL ENGINE (CHATTING & RUNNING ENGINE)
----------------------------------------------------
local function SendChat(msg)
    local TextChatService = game:GetService("TextChatService")
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local channel = TextChatService.TextChannels.RBXGeneral
        if channel then channel:SendAsync(msg) end
    else
        local chatEvents = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
        if chatEvents then
            chatEvents.SayMessageRequest:FireServer(msg, "All")
        end
    end
end

local function ProcessAndSend()
    local text = TextBox.Text
    if text == "" then return end
    
    local activeFont = fontSmart
    if currentMode == "Hindi" then activeFont = fontHindi
    elseif currentMode == "English" then activeFont = fontEnglish
    elseif currentMode == "Clear" then activeFont = fontClear
    elseif currentMode == "Stylish" then activeFont = fontStylish
    elseif currentMode == "Best" then activeFont = fontBest
    end
    
    local bypassedText = ""
    for i = 1, #text do
        local char = text:sub(i, i):lower()
        if activeFont[char] then
            bypassedText = bypassedText .. activeFont[char]
        else
            bypassedText = bypassedText .. text:sub(i, i)
        end
    end
    
    if autoFixTags then
        bypassedText = bypassedText .. "ajxjvnsiwurmxncncj"
    end
    
    task.wait(chatSpeed) -- Respects the custom configured speed engine gap
    SendChat(bypassedText)
    TextBox.Text = ""
end

SendBtn.MouseButton1Click:Connect(ProcessAndSend)
TextBox.FocusLost:Connect(function(ep) if ep then ProcessAndSend() end end)

----------------------------------------------------
-- 4. POWERFUL ADMIN COMMAND TRACKER LAYER WITH SPEED WARNING
----------------------------------------------------
local function HandleCommand(msg, speaker)
    local args = string.split(msg, " ")
    local cmd = args[1]:lower()

    if cmd == "!target" then
        currentTarget = args[2] or "None"
        SendChat("Target Locked: " .. currentTarget)
    elseif cmd == "!who" and args[2] == "owner" then
        SendChat("Yarzy Abbu")
    elseif cmd == "!who" and args[2] == "admin" then
        SendChat("Admin: None")
    elseif cmd == "!say" then
        table.remove(args, 1)
        SendChat(table.concat(args, " "))
    elseif cmd == "!start" and args[2] == "spam" then
        SendChat("Ok Boss Start I'll Start Spamming After 10 Seconds")
    elseif cmd == "!hi" then
        SendChat("Hi " .. localPlayer.Name)
    elseif cmd == "!speed" then
        local targetSpeed = tonumber(args[2])
        if targetSpeed then
            -- Speed Input Validation System Loop
            if targetSpeed < 0.9 then
                SendChat("⚠️ Warning: Put 0.9 or above to stay safe from chat flags!")
                chatSpeed = 0.9
            else
                chatSpeed = targetSpeed
                SendChat("Chat Speed set to: " .. tostring(chatSpeed))
            end
        else
            chatSpeed = 0.9
        end
    elseif cmd == "!byoff" then
        ScreenGui:Destroy()
    elseif cmd == "!bylock" then
        scriptLocked = true
        MainFrame.Visible = false
        StartKeyFrame.Visible = false
    elseif cmd == "!byunlock" then
        scriptLocked = false
        MainFrame.Visible = true
    elseif cmd == "!byon" then
        scriptLocked = false
        MainFrame.Visible = true
    elseif cmd == "!ban" then
        localPlayer:Kick("You have been banned by Yarzy Admin System.")
    end
end

-- Hook up runtime listeners
Players.PlayerAdded:Connect(function(plr)
    plr.Chatted:Connect(function(msg) HandleCommand(msg, plr) end)
end)
for _, plr in ipairs(Players:GetPlayers()) do
    plr.Chatted:Connect(function(msg) HandleCommand(msg, plr) end)
end

-- Key Input Processing Hook
KeyInput.FocusLost:Connect(function(enter)
    if enter and KeyInput.Text == "YaRzYhIkEhdE" and not scriptLocked then
        StartKeyFrame.Visible = false
        MainFrame.Visible = true
    end
end)
