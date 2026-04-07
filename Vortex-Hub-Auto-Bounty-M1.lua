local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Stats = game:GetService("Stats")

local player = Players.LocalPlayer

-- Clear old UI
if player.PlayerGui:FindFirstChild("VortexHubUI") then
    player.PlayerGui.VortexHubUI:Destroy()
end

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "VortexHubUI"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player.PlayerGui

----------------------------------------------------------------
-- LOGO TOGGLE UI (TOP LEFT)
----------------------------------------------------------------
local logoBtn = Instance.new("ImageButton")
logoBtn.Name = "ToggleLogo"
logoBtn.Size = UDim2.new(0,46,0,46)
logoBtn.Position = UDim2.new(0,14,0,14)
logoBtn.BackgroundColor3 = Color3.fromRGB(22,22,28)
logoBtn.Image = "rbxassetid://126810629094811"
logoBtn.AutoButtonColor = false
logoBtn.Parent = gui

local logoCorner = Instance.new("UICorner", logoBtn)
logoCorner.CornerRadius = UDim.new(1,0)

local logoStroke = Instance.new("UIStroke", logoBtn)
logoStroke.Color = Color3.fromRGB(150,0,255)
logoStroke.Thickness = 2
logoStroke.Transparency = 0.2

task.spawn(function()
    while task.wait(0.03) do
        logoStroke.Transparency = 0.2 + math.abs(math.sin(tick()*1.5))*0.35
    end
end)

----------------------------------------------------------------
-- MAIN UI FRAME
----------------------------------------------------------------
local main = Instance.new("Frame")
main.Size = UDim2.new(0,480,0,380)
main.Position = UDim2.new(0.5,-240,0.5,-190)
main.BackgroundColor3 = Color3.fromRGB(22,22,28)
main.BorderSizePixel = 0
main.Visible = true
main.Parent = gui

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0,22)

-- Neon Border
local neon = Instance.new("UIStroke", main)
neon.Color = Color3.fromRGB(150,0,255)
neon.Thickness = 2
neon.Transparency = 0.18

task.spawn(function()
    while task.wait(0.03) do
        neon.Transparency = 0.18 + math.abs(math.sin(tick()*1.4))*0.28
    end
end)

-- Background Image
local bg = Instance.new("ImageLabel")
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundTransparency = 1
bg.Image = "rbxassetid://126810629094811"
bg.ImageTransparency = 0.1
bg.ScaleType = Enum.ScaleType.Crop
bg.Parent = main

local bgCorner = Instance.new("UICorner", bg)
bgCorner.CornerRadius = UDim.new(0,22)

-- Overlay
local overlay = Instance.new("Frame")
overlay.Size = UDim2.new(1,0,1,0)
overlay.BackgroundColor3 = Color3.fromRGB(30,30,38)
overlay.BackgroundTransparency = 0.65
overlay.Parent = main

local overlayCorner = Instance.new("UICorner", overlay)
overlayCorner.CornerRadius = UDim.new(0,22)

----------------------------------------------------------------
-- AVATAR & HEADER
----------------------------------------------------------------
local avatar = Instance.new("ImageLabel")
avatar.Size = UDim2.new(0,64,0,64)
avatar.Position = UDim2.new(0,18,0,18)
avatar.BackgroundTransparency = 1
avatar.Image = Players:GetUserThumbnailAsync(
    player.UserId,
    Enum.ThumbnailType.HeadShot,
    Enum.ThumbnailSize.Size150x150
)
avatar.ImageTransparency = 0.08
avatar.Parent = main

local avatarCorner = Instance.new("UICorner", avatar)
avatarCorner.CornerRadius = UDim.new(1,0)

local avatarStroke = Instance.new("UIStroke", avatar)
avatarStroke.Color = Color3.fromRGB(170,50,255)
avatarStroke.Thickness = 2
avatarStroke.Transparency = 0.25

-- Title
local title = Instance.new("TextLabel")
title.Text = "VORTEX HUB"
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.TextColor3 = Color3.fromRGB(170,50,255)
title.BackgroundTransparency = 1
title.Position = UDim2.new(0,98,0,22)
title.Size = UDim2.new(1,-110,0,30)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

local titleStroke = Instance.new("UIStroke", title)
titleStroke.Color = Color3.fromRGB(200,100,255)
titleStroke.Thickness = 1.2
titleStroke.Transparency = 0.35

-- Subtitle
local sub = Instance.new("TextLabel")
sub.Text = "Auto Bounty | Blox Fruits"
sub.Font = Enum.Font.GothamBold
sub.TextSize = 13
sub.TextColor3 = Color3.fromRGB(180,80,255)
sub.BackgroundTransparency = 1
sub.Position = UDim2.new(0,98,0,52)
sub.Size = UDim2.new(1,-110,0,18)
sub.TextXAlignment = Enum.TextXAlignment.Left
sub.Parent = main

----------------------------------------------------------------
-- TAB BUTTONS
----------------------------------------------------------------
local tabFrame = Instance.new("Frame")
tabFrame.Size = UDim2.new(1,-36,0,36)
tabFrame.Position = UDim2.new(0,18,0,85)
tabFrame.BackgroundTransparency = 1
tabFrame.Parent = main

local homeBtn = Instance.new("TextButton")
homeBtn.Size = UDim2.new(0,90,0,32)
homeBtn.Position = UDim2.new(0,0,0,2)
homeBtn.BackgroundColor3 = Color3.fromRGB(150,0,255)
homeBtn.BackgroundTransparency = 0.2
homeBtn.Text = "HOME"
homeBtn.TextColor3 = Color3.fromRGB(255,255,255)
homeBtn.TextSize = 14
homeBtn.Font = Enum.Font.GothamBold
homeBtn.Parent = tabFrame

local homeCorner = Instance.new("UICorner", homeBtn)
homeCorner.CornerRadius = UDim.new(0,8)

local settingsBtn = Instance.new("TextButton")
settingsBtn.Size = UDim2.new(0,90,0,32)
settingsBtn.Position = UDim2.new(0,100,0,2)
settingsBtn.BackgroundColor3 = Color3.fromRGB(35,35,45)
settingsBtn.BackgroundTransparency = 0.5
settingsBtn.Text = "SETTINGS"
settingsBtn.TextColor3 = Color3.fromRGB(200,200,200)
settingsBtn.TextSize = 14
settingsBtn.Font = Enum.Font.GothamBold
settingsBtn.Parent = tabFrame

local settingsCorner = Instance.new("UICorner", settingsBtn)
settingsCorner.CornerRadius = UDim.new(0,8)

local statsBtn = Instance.new("TextButton")
statsBtn.Size = UDim2.new(0,90,0,32)
statsBtn.Position = UDim2.new(0,200,0,2)
statsBtn.BackgroundColor3 = Color3.fromRGB(35,35,45)
statsBtn.BackgroundTransparency = 0.5
statsBtn.Text = "STATS"
statsBtn.TextColor3 = Color3.fromRGB(200,200,200)
statsBtn.TextSize = 14
statsBtn.Font = Enum.Font.GothamBold
statsBtn.Parent = tabFrame

local statsCorner = Instance.new("UICorner", statsBtn)
statsCorner.CornerRadius = UDim.new(0,8)

----------------------------------------------------------------
-- HOME TAB CONTENT
----------------------------------------------------------------
local homeTab = Instance.new("Frame")
homeTab.Size = UDim2.new(1,-36,0,200)
homeTab.Position = UDim2.new(0,18,0,130)
homeTab.BackgroundTransparency = 1
homeTab.Visible = true
homeTab.Parent = main

-- Team Selection
local teamLabel = Instance.new("TextLabel")
teamLabel.Size = UDim2.new(0,60,0,30)
teamLabel.Position = UDim2.new(0,0,0,5)
teamLabel.BackgroundTransparency = 1
teamLabel.Text = "Team:"
teamLabel.TextColor3 = Color3.fromRGB(255,255,255)
teamLabel.TextSize = 16
teamLabel.Font = Enum.Font.GothamBold
teamLabel.TextXAlignment = Enum.TextXAlignment.Left
teamLabel.Parent = homeTab

local piratesBtn = Instance.new("TextButton")
piratesBtn.Size = UDim2.new(0,100,0,32)
piratesBtn.Position = UDim2.new(0,70,0,4)
piratesBtn.BackgroundColor3 = Color3.fromRGB(0,100,200)
piratesBtn.Text = "PIRATES"
piratesBtn.TextColor3 = Color3.fromRGB(255,255,255)
piratesBtn.TextSize = 14
piratesBtn.Font = Enum.Font.GothamBold
piratesBtn.Parent = homeTab

local piratesCorner = Instance.new("UICorner", piratesBtn)
piratesCorner.CornerRadius = UDim.new(0,8)

local marinesBtn = Instance.new("TextButton")
marinesBtn.Size = UDim2.new(0,100,0,32)
marinesBtn.Position = UDim2.new(0,180,0,4)
marinesBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
marinesBtn.Text = "MARINES"
marinesBtn.TextColor3 = Color3.fromRGB(255,255,255)
marinesBtn.TextSize = 14
marinesBtn.Font = Enum.Font.GothamBold
marinesBtn.Parent = homeTab

local marinesCorner = Instance.new("UICorner", marinesBtn)
marinesCorner.CornerRadius = UDim.new(0,8)

-- Auto Bounty Button
local bountyFrame = Instance.new("Frame")
bountyFrame.Size = UDim2.new(1,0,0,50)
bountyFrame.Position = UDim2.new(0,0,0,50)
bountyFrame.BackgroundColor3 = Color3.fromRGB(35,35,45)
bountyFrame.BackgroundTransparency = 0.5
bountyFrame.Parent = homeTab

local bountyCorner2 = Instance.new("UICorner", bountyFrame)
bountyCorner2.CornerRadius = UDim.new(0,12)

local bountyBtn = Instance.new("TextButton")
bountyBtn.Size = UDim2.new(1,-20,0,38)
bountyBtn.Position = UDim2.new(0,10,0,6)
bountyBtn.BackgroundColor3 = Color3.fromRGB(150,0,255)
bountyBtn.BackgroundTransparency = 0.15
bountyBtn.Text = "START AUTO BOUNTY"
bountyBtn.TextColor3 = Color3.fromRGB(255,255,255)
bountyBtn.TextSize = 16
bountyBtn.Font = Enum.Font.GothamBold
bountyBtn.Parent = bountyFrame

local bountyBtnCorner2 = Instance.new("UICorner", bountyBtn)
bountyBtnCorner2.CornerRadius = UDim.new(0,8)

local bountyBtnStroke = Instance.new("UIStroke", bountyBtn)
bountyBtnStroke.Color = Color3.fromRGB(150,0,255)
bountyBtnStroke.Thickness = 1.5

-- Status Labels
local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(1,0,0,24)
statusText.Position = UDim2.new(0,0,0,110)
statusText.BackgroundTransparency = 1
statusText.Text = "Status: Idle"
statusText.TextColor3 = Color3.fromRGB(200,200,200)
statusText.TextSize = 14
statusText.Font = Enum.Font.Gotham
statusText.TextXAlignment = Enum.TextXAlignment.Left
statusText.Parent = homeTab

local targetText = Instance.new("TextLabel")
targetText.Size = UDim2.new(1,0,0,24)
targetText.Position = UDim2.new(0,0,0,135)
targetText.BackgroundTransparency = 1
targetText.Text = "Target: None"
targetText.TextColor3 = Color3.fromRGB(200,200,200)
targetText.TextSize = 14
targetText.Font = Enum.Font.Gotham
targetText.TextXAlignment = Enum.TextXAlignment.Left
targetText.Parent = homeTab

local skipBtn = Instance.new("TextButton")
skipBtn.Size = UDim2.new(0,100,0,32)
skipBtn.Position = UDim2.new(1,-105,0,130)
skipBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
skipBtn.BackgroundTransparency = 0.3
skipBtn.Text = "SKIP"
skipBtn.TextColor3 = Color3.fromRGB(255,255,255)
skipBtn.TextSize = 14
skipBtn.Font = Enum.Font.GothamBold
skipBtn.Parent = homeTab

local skipCorner2 = Instance.new("UICorner", skipBtn)
skipCorner2.CornerRadius = UDim.new(0,8)

----------------------------------------------------------------
-- SETTINGS TAB CONTENT
----------------------------------------------------------------
local settingsTab = Instance.new("Frame")
settingsTab.Size = UDim2.new(1,-36,0,200)
settingsTab.Position = UDim2.new(0,18,0,130)
settingsTab.BackgroundTransparency = 1
settingsTab.Visible = false
settingsTab.Parent = main

-- Auto Settings
local autoHopBtn = Instance.new("TextButton")
autoHopBtn.Size = UDim2.new(1,0,0,36)
autoHopBtn.Position = UDim2.new(0,0,0,5)
autoHopBtn.BackgroundColor3 = Color3.fromRGB(35,35,45)
autoHopBtn.BackgroundTransparency = 0.5
autoHopBtn.Text = "Auto Server Hop: OFF"
autoHopBtn.TextColor3 = Color3.fromRGB(200,200,200)
autoHopBtn.TextSize = 14
autoHopBtn.Font = Enum.Font.GothamBold
autoHopBtn.Parent = settingsTab

local autoHopCorner = Instance.new("UICorner", autoHopBtn)
autoHopCorner.CornerRadius = UDim.new(0,8)

local fastAttackBtn = Instance.new("TextButton")
fastAttackBtn.Size = UDim2.new(1,0,0,36)
fastAttackBtn.Position = UDim2.new(0,0,0,48)
fastAttackBtn.BackgroundColor3 = Color3.fromRGB(35,35,45)
fastAttackBtn.BackgroundTransparency = 0.5
fastAttackBtn.Text = "Fast Attack: ON"
fastAttackBtn.TextColor3 = Color3.fromRGB(200,200,200)
fastAttackBtn.TextSize = 14
fastAttackBtn.Font = Enum.Font.GothamBold
fastAttackBtn.Parent = settingsTab

local fastAttackCorner = Instance.new("UICorner", fastAttackBtn)
fastAttackCorner.CornerRadius = UDim.new(0,8)

local whiteScreenBtn = Instance.new("TextButton")
whiteScreenBtn.Size = UDim2.new(1,0,0,36)
whiteScreenBtn.Position = UDim2.new(0,0,0,91)
whiteScreenBtn.BackgroundColor3 = Color3.fromRGB(35,35,45)
whiteScreenBtn.BackgroundTransparency = 0.5
whiteScreenBtn.Text = "White Screen: OFF"
whiteScreenBtn.TextColor3 = Color3.fromRGB(200,200,200)
whiteScreenBtn.TextSize = 14
whiteScreenBtn.Font = Enum.Font.GothamBold
whiteScreenBtn.Parent = settingsTab

local whiteScreenCorner = Instance.new("UICorner", whiteScreenBtn)
whiteScreenCorner.CornerRadius = UDim.new(0,8)

local lockCameraBtn = Instance.new("TextButton")
lockCameraBtn.Size = UDim2.new(1,0,0,36)
lockCameraBtn.Position = UDim2.new(0,0,0,134)
lockCameraBtn.BackgroundColor3 = Color3.fromRGB(35,35,45)
lockCameraBtn.BackgroundTransparency = 0.5
lockCameraBtn.Text = "Lock Camera: OFF"
lockCameraBtn.TextColor3 = Color3.fromRGB(200,200,200)
lockCameraBtn.TextSize = 14
lockCameraBtn.Font = Enum.Font.GothamBold
lockCameraBtn.Parent = settingsTab

local lockCameraCorner = Instance.new("UICorner", lockCameraBtn)
lockCameraCorner.CornerRadius = UDim.new(0,8)

----------------------------------------------------------------
-- STATS TAB CONTENT
----------------------------------------------------------------
local statsTab = Instance.new("Frame")
statsTab.Size = UDim2.new(1,-36,0,200)
statsTab.Position = UDim2.new(0,18,0,130)
statsTab.BackgroundTransparency = 1
statsTab.Visible = false
statsTab.Parent = main

-- Stats Display
local statsInfo = Instance.new("Frame")
statsInfo.Size = UDim2.new(1,0,0,180)
statsInfo.Position = UDim2.new(0,0,0,5)
statsInfo.BackgroundTransparency = 1
statsInfo.Parent = statsTab

local function statLabel(y, text)
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(1,0,0,28)
    l.Position = UDim2.new(0,0,0,y)
    l.BackgroundTransparency = 1
    l.Font = Enum.Font.GothamBold
    l.TextSize = 16
    l.TextColor3 = Color3.fromRGB(235,248,255)
    l.Text = text
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Parent = statsInfo
    return l
end

local fpsStat = statLabel(0, "FPS: --")
local pingStat = statLabel(30, "Ping: --")
local playerStat = statLabel(60, "Players: --")
local killStat = statLabel(90, "Total Kills: --")
local bountyStat = statLabel(120, "Current Bounty: --")
local runtimeStat = statLabel(150, "Runtime: 00h 00m 00s")

-- Update stats
local frames, last, fps = 0, tick(), 0
local kills = 0
local startTime = tick()

RunService.RenderStepped:Connect(function()
    frames += 1
    if tick() - last >= 1 then
        fps = frames
        frames = 0
        last = tick()
    end
    
    fpsStat.Text = "FPS: "..fps
    playerStat.Text = "Players: "..#Players:GetPlayers()
    killStat.Text = "Total Kills: "..kills
    
    pcall(function()
        bountyStat.Text = "Current Bounty: "..player.leaderstats["Bounty/Honor"].Value
    end)
    
    local ok, ping = pcall(function()
        return Stats.Network.ServerStatsItem["Data Ping"]:GetValueString()
    end)
    pingStat.Text = "Ping: "..(ok and ping or "N/A")
    
    local elapsed = tick() - startTime
    local hours = math.floor(elapsed / 3600)
    local minutes = math.floor((elapsed % 3600) / 60)
    local seconds = math.floor(elapsed % 60)
    runtimeStat.Text = string.format("Runtime: %02dh %02dm %02ds", hours, minutes, seconds)
end)

----------------------------------------------------------------
-- TAB SWITCHING
----------------------------------------------------------------
local function switchTab(tab)
    homeTab.Visible = (tab == "home")
    settingsTab.Visible = (tab == "settings")
    statsTab.Visible = (tab == "stats")
    
    homeBtn.BackgroundColor3 = (tab == "home") and Color3.fromRGB(150,0,255) or Color3.fromRGB(35,35,45)
    homeBtn.BackgroundTransparency = (tab == "home") and 0.2 or 0.5
    homeBtn.TextColor3 = (tab == "home") and Color3.fromRGB(255,255,255) or Color3.fromRGB(200,200,200)
    
    settingsBtn.BackgroundColor3 = (tab == "settings") and Color3.fromRGB(150,0,255) or Color3.fromRGB(35,35,45)
    settingsBtn.BackgroundTransparency = (tab == "settings") and 0.2 or 0.5
    settingsBtn.TextColor3 = (tab == "settings") and Color3.fromRGB(255,255,255) or Color3.fromRGB(200,200,200)
    
    statsBtn.BackgroundColor3 = (tab == "stats") and Color3.fromRGB(150,0,255) or Color3.fromRGB(35,35,45)
    statsBtn.BackgroundTransparency = (tab == "stats") and 0.2 or 0.5
    statsBtn.TextColor3 = (tab == "stats") and Color3.fromRGB(255,255,255) or Color3.fromRGB(200,200,200)
end

homeBtn.MouseButton1Click:Connect(function() switchTab("home") end)
settingsBtn.MouseButton1Click:Connect(function() switchTab("settings") end)
statsBtn.MouseButton1Click:Connect(function() switchTab("stats") end)

----------------------------------------------------------------
-- SETTINGS TOGGLES (UI only - you add logic)
----------------------------------------------------------------
local autoHopEnabled = false
autoHopBtn.MouseButton1Click:Connect(function()
    autoHopEnabled = not autoHopEnabled
    autoHopBtn.Text = "Auto Server Hop: " .. (autoHopEnabled and "ON" or "OFF")
end)

local fastAttackEnabled = true
fastAttackBtn.MouseButton1Click:Connect(function()
    fastAttackEnabled = not fastAttackEnabled
    fastAttackBtn.Text = "Fast Attack: " .. (fastAttackEnabled and "ON" or "OFF")
end)

local whiteScreenEnabled = false
whiteScreenBtn.MouseButton1Click:Connect(function()
    whiteScreenEnabled = not whiteScreenEnabled
    whiteScreenBtn.Text = "White Screen: " .. (whiteScreenEnabled and "ON" or "OFF")
end)

local lockCameraEnabled = false
lockCameraBtn.MouseButton1Click:Connect(function()
    lockCameraEnabled = not lockCameraEnabled
    lockCameraBtn.Text = "Lock Camera: " .. (lockCameraEnabled and "ON" or "OFF")
end)

----------------------------------------------------------------
-- LOGO TOGGLE FUNCTION
----------------------------------------------------------------
local uiOpen = true
logoBtn.MouseButton1Click:Connect(function()
    uiOpen = not uiOpen
    main.Visible = uiOpen
end)

----------------------------------------------------------------
-- RETURN FUNCTIONS FOR YOUR LOADSTRING
----------------------------------------------------------------
-- Expose functions so you can control UI from your loadstring
getgenv().VortexHub = {
    setStatus = function(text)
        statusText.Text = "Status: "..text
    end,
    setTarget = function(name)
        targetText.Text = "Target: "..(name or "None")
    end,
    addKill = function()
        kills = kills + 1
        killStat.Text = "Total Kills: "..kills
    end,
    setBountyBtn = function(running)
        if running then
            bountyBtn.Text = "STOP AUTO BOUNTY"
            bountyBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
        else
            bountyBtn.Text = "START AUTO BOUNTY"
            bountyBtn.BackgroundColor3 = Color3.fromRGB(150,0,255)
        end
    end,
    getButtons = function()
        return {
            bountyBtn = bountyBtn,
            piratesBtn = piratesBtn,
            marinesBtn = marinesBtn,
            skipBtn = skipBtn
        }
    end
}

print("Vortex Hub UI Loaded Successfully!")
print("Use getgenv().VortexHub to control the UI")
