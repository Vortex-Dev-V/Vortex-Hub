-- ╔══════════════════════════════════════════════════════════════════╗
-- ║                  VORTEX HUB - PREMIUM LOGO V3                    ║
-- ║              Premium Effects - Cut Corner - 3D                   ║
-- ╚══════════════════════════════════════════════════════════════════╝

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ======= CONFIGURATION =======
local MUSIC_ID = "rbxassetid://1843671946"
local BPM = 128
local TEXTURE_ID = "rbxassetid://75462758042657"
-- =============================

if PlayerGui:FindFirstChild("VortexLogo") then
    PlayerGui.VortexLogo:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VortexLogo"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 9999
ScreenGui.Parent = PlayerGui

-- ===== CLIP FRAME: Bottom left corner, cuts off half =====
local Clip = Instance.new("Frame")
Clip.Name = "Clip"
Clip.Size = UDim2.new(0.42, 0, 0.6, 0)
Clip.Position = UDim2.new(0, 0, 0.4, 0)
Clip.BackgroundTransparency = 1
Clip.ClipsDescendants = true
Clip.ZIndex = 7
Clip.Parent = ScreenGui

local LOGO_SIZE = 550

-- Positions
local POS_IN = UDim2.new(0, -180, 1, -LOGO_SIZE + 100)
local POS_OUT = UDim2.new(0, -(LOGO_SIZE + 80), 1, -LOGO_SIZE + 100)

-- ===== LAYER 1: DARK SHADOW =====
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.Size = UDim2.new(0, LOGO_SIZE, 0, LOGO_SIZE)
Shadow.Position = POS_OUT
Shadow.AnchorPoint = Vector2.new(0, 0)
Shadow.BackgroundTransparency = 1
Shadow.Image = TEXTURE_ID
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.65
Shadow.ZIndex = 8
Shadow.Parent = Clip

-- ===== LAYER 2: OUTER GLOW =====
local OuterGlow = Instance.new("ImageLabel")
OuterGlow.Name = "OuterGlow"
OuterGlow.Size = UDim2.new(0, LOGO_SIZE + 60, 0, LOGO_SIZE + 60)
OuterGlow.Position = POS_OUT
OuterGlow.AnchorPoint = Vector2.new(0, 0)
OuterGlow.BackgroundTransparency = 1
OuterGlow.Image = TEXTURE_ID
OuterGlow.ImageColor3 = Color3.fromRGB(138, 43, 226)
OuterGlow.ImageTransparency = 0.8
OuterGlow.ZIndex = 8
OuterGlow.Parent = Clip

-- ===== LAYER 3: INNER GLOW =====
local InnerGlow = Instance.new("ImageLabel")
InnerGlow.Name = "InnerGlow"
InnerGlow.Size = UDim2.new(0, LOGO_SIZE + 30, 0, LOGO_SIZE + 30)
InnerGlow.Position = POS_OUT
InnerGlow.AnchorPoint = Vector2.new(0, 0)
InnerGlow.BackgroundTransparency = 1
InnerGlow.Image = TEXTURE_ID
InnerGlow.ImageColor3 = Color3.fromRGB(186, 85, 211)
InnerGlow.ImageTransparency = 0.7
InnerGlow.ZIndex = 9
InnerGlow.Parent = Clip

-- ===== LAYER 4: BORDER GLOW =====
local BorderGlow = Instance.new("ImageLabel")
BorderGlow.Name = "BorderGlow"
BorderGlow.Size = UDim2.new(0, LOGO_SIZE + 15, 0, LOGO_SIZE + 15)
BorderGlow.Position = POS_OUT
BorderGlow.AnchorPoint = Vector2.new(0, 0)
BorderGlow.BackgroundTransparency = 1
BorderGlow.Image = "rbxassetid://5028857084"
BorderGlow.ImageColor3 = Color3.fromRGB(138, 43, 226)
BorderGlow.ImageTransparency = 0.5
BorderGlow.ZIndex = 9
BorderGlow.Parent = Clip

-- ===== LAYER 5: MAIN LOGO =====
local Logo = Instance.new("ImageLabel")
Logo.Name = "Logo"
Logo.Size = UDim2.new(0, LOGO_SIZE, 0, LOGO_SIZE)
Logo.Position = POS_OUT
Logo.AnchorPoint = Vector2.new(0, 0)
Logo.BackgroundTransparency = 1
Logo.Image = TEXTURE_ID
Logo.ImageColor3 = Color3.fromRGB(255, 255, 255)
Logo.ImageTransparency = 0
Logo.ZIndex = 10
Logo.Parent = Clip

-- ===== LAYER 6: VORTEX TEXT UNDER LOGO =====
local VortexText = Instance.new("TextLabel")
VortexText.Name = "VortexText"
VortexText.Size = UDim2.new(0, LOGO_SIZE + 100, 0, 50)
VortexText.Position = UDim2.new(0, -230, 1, -30)
VortexText.AnchorPoint = Vector2.new(0, 1)
VortexText.BackgroundTransparency = 1
VortexText.Text = "VORTEX"
VortexText.TextColor3 = Color3.fromRGB(255, 255, 255)
VortexText.TextTransparency = 0.3
VortexText.TextScaled = true
VortexText.Font = Enum.Font.GothamBold
VortexText.ZIndex = 10
VortexText.Parent = Clip

-- ===== PARTICLES SYSTEM =====
local ParticleContainer = Instance.new("Frame")
ParticleContainer.Name = "Particles"
ParticleContainer.Size = UDim2.new(1, 0, 1, 0)
ParticleContainer.BackgroundTransparency = 1
ParticleContainer.Parent = Clip

local particles = {}
for i = 1, 40 do
    local particle = Instance.new("Frame")
    particle.Size = UDim2.new(0, math.random(2, 6), 0, math.random(2, 6))
    particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
    particle.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
    particle.BackgroundTransparency = 0.4
    particle.BorderSizePixel = 0
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = particle
    particle.Parent = ParticleContainer
    table.insert(particles, particle)
end

-- ===== MUSIC =====
local Sound = Instance.new("Sound")
Sound.Name = "VortexMusic"
Sound.SoundId = MUSIC_ID
Sound.Volume = 0.5
Sound.Looped = true
Sound.RollOffMaxDistance = 999999
Sound.Parent = workspace

local function playMusic()
    if not Sound.IsPlaying then Sound:Play() end
end
if Sound.IsLoaded then playMusic()
else Sound.Loaded:Once(playMusic) end

-- ===== SLIDE IN ANIMATION =====
local introDone = false

task.delay(0.2, function()
    -- Main logo slide
    local slideIn = TweenService:Create(Logo,
        TweenInfo.new(3.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Position = POS_IN,
        }
    )
    slideIn:Play()
    
    -- Shadow slide (offset for 3D effect)
    TweenService:Create(Shadow, TweenInfo.new(3.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(POS_IN.X.Scale, POS_IN.X.Offset + 15,
                             POS_IN.Y.Scale, POS_IN.Y.Offset + 18),
    }):Play()
    
    -- Outer glow slide
    TweenService:Create(OuterGlow, TweenInfo.new(3.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(POS_IN.X.Scale, POS_IN.X.Offset - 30,
                             POS_IN.Y.Scale, POS_IN.Y.Offset - 30),
    }):Play()
    
    -- Inner glow slide
    TweenService:Create(InnerGlow, TweenInfo.new(3.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(POS_IN.X.Scale, POS_IN.X.Offset - 15,
                             POS_IN.Y.Scale, POS_IN.Y.Offset - 15),
    }):Play()
    
    -- Border glow slide
    TweenService:Create(BorderGlow, TweenInfo.new(3.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(POS_IN.X.Scale, POS_IN.X.Offset - 8,
                             POS_IN.Y.Scale, POS_IN.Y.Offset - 8),
    }):Play()
    
    -- Text fade in
    TweenService:Create(VortexText, TweenInfo.new(2, Enum.EasingStyle.Quad), {
        TextTransparency = 0,
    }):Play()
    
    slideIn.Completed:Connect(function()
        introDone = true
    end)
end)

-- ===== ROTATION + PULSE EFFECTS =====
local rotation = 0
local elapsed = 0
local beatTimer = 0
local beatInterval = 60 / BPM
local isBeat = false
local scaleDirection = 1
local currentScale = 1
local pulseValue = 0

local function doBeat()
    if isBeat or not introDone then return end
    isBeat = true
    
    -- Pulse effect on beat
    TweenService:Create(InnerGlow, TweenInfo.new(0.05), { ImageTransparency = 0.3 }):Play()
    TweenService:Create(BorderGlow, TweenInfo.new(0.05), { ImageTransparency = 0.2 }):Play()
    TweenService:Create(OuterGlow, TweenInfo.new(0.05), { ImageTransparency = 0.5 }):Play()
    
    task.delay(0.1, function()
        TweenService:Create(InnerGlow, TweenInfo.new(0.3), { ImageTransparency = 0.7 }):Play()
        TweenService:Create(BorderGlow, TweenInfo.new(0.3), { ImageTransparency = 0.5 }):Play()
        TweenService:Create(OuterGlow, TweenInfo.new(0.3), { ImageTransparency = 0.8 }):Play()
        isBeat = false
    end)
end

-- Particle animation
local function animateParticles()
    for _, particle in pairs(particles) do
        local newX = math.random() * particle.Parent.AbsoluteSize.X / particle.Parent.AbsoluteSize.X
        local newY = math.random() * particle.Parent.AbsoluteSize.Y / particle.Parent.AbsoluteSize.Y
        TweenService:Create(particle, TweenInfo.new(math.random(3, 8), Enum.EasingStyle.Linear), {
            Position = UDim2.new(newX, 0, newY, 0)
        }):Play()
        
        -- Random transparency pulse
        task.spawn(function()
            while particle.Parent do
                task.wait(math.random(2, 5))
                TweenService:Create(particle, TweenInfo.new(0.5), { BackgroundTransparency = 0.1 }):Play()
                task.wait(0.3)
                TweenService:Create(particle, TweenInfo.new(0.5), { BackgroundTransparency = 0.6 }):Play()
            end
        end)
    end
end

-- Start particle loop
task.spawn(function()
    while true do
        task.wait(4)
        if introDone then
            animateParticles()
        end
    end
end)

-- Start particle twinkle
task.spawn(function()
    while true do
        task.wait(0.5)
        if introDone then
            for _, particle in pairs(particles) do
                if math.random(1, 10) > 7 then
                    TweenService:Create(particle, TweenInfo.new(0.2), { BackgroundTransparency = 0.1 }):Play()
                    task.delay(0.15, function()
                        TweenService:Create(particle, TweenInfo.new(0.3), { BackgroundTransparency = 0.6 }):Play()
                    end)
                end
            end
        end
    end
end)

-- ===== MAIN ANIMATION LOOP =====
RunService.RenderStepped:Connect(function(dt)
    elapsed = elapsed + dt
    beatTimer = beatTimer + dt
    
    if not introDone then return end
    
    -- Slow rotation (30 degrees per second)
    rotation = (rotation + 30 * dt) % 360
    Logo.Rotation = rotation
    Shadow.Rotation = rotation
    OuterGlow.Rotation = rotation
    InnerGlow.Rotation = rotation
    BorderGlow.Rotation = rotation
    
    -- Gentle breathing effect (scale)
    currentScale = 1 + math.sin(elapsed * 1.5) * 0.015
    Logo.Size = UDim2.new(0, LOGO_SIZE * currentScale, 0, LOGO_SIZE * currentScale)
    Shadow.Size = UDim2.new(0, LOGO_SIZE * currentScale, 0, LOGO_SIZE * currentScale)
    OuterGlow.Size = UDim2.new(0, (LOGO_SIZE + 60) * currentScale, 0, (LOGO_SIZE + 60) * currentScale)
    InnerGlow.Size = UDim2.new(0, (LOGO_SIZE + 30) * currentScale, 0, (LOGO_SIZE + 30) * currentScale)
    BorderGlow.Size = UDim2.new(0, (LOGO_SIZE + 15) * currentScale, 0, (LOGO_SIZE + 15) * currentScale)
    
    -- Glow pulse effect
    local sinVal = math.sin(elapsed * 2.5)
    InnerGlow.ImageTransparency = 0.6 + sinVal * 0.15
    OuterGlow.ImageTransparency = 0.75 + sinVal * 0.1
    BorderGlow.ImageTransparency = 0.45 + sinVal * 0.15
    
    -- Text pulse
    VortexText.TextTransparency = 0.25 + math.sin(elapsed * 1.8) * 0.1
    
    -- Beat detection
    if beatTimer >= beatInterval then
        beatTimer = beatTimer - beatInterval
        doBeat()
    end
end)

-- ===== CLICK TO TOGGLE MUSIC =====
Logo.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        if Sound.IsPlaying then
            Sound:Pause()
            -- Visual feedback
            TweenService:Create(Logo, TweenInfo.new(0.2), { ImageTransparency = 0.3 }):Play()
            task.delay(0.2, function()
                TweenService:Create(Logo, TweenInfo.new(0.2), { ImageTransparency = 0 }):Play()
            end)
        else
            Sound:Play()
            TweenService:Create(Logo, TweenInfo.new(0.1), { ImageTransparency = 0.1 }):Play()
            task.delay(0.1, function()
                TweenService:Create(Logo, TweenInfo.new(0.2), { ImageTransparency = 0 }):Play()
            end)
        end
    end
end)

-- ===== HOVER EFFECT =====
Logo.MouseEnter:Connect(function()
    TweenService:Create(BorderGlow, TweenInfo.new(0.2), { ImageTransparency = 0.2 }):Play()
    TweenService:Create(InnerGlow, TweenInfo.new(0.2), { ImageTransparency = 0.4 }):Play()
end)

Logo.MouseLeave:Connect(function()
    TweenService:Create(BorderGlow, TweenInfo.new(0.3), { ImageTransparency = 0.5 }):Play()
    TweenService:Create(InnerGlow, TweenInfo.new(0.3), { ImageTransparency = 0.7 }):Play()
end)

print("✅ Vortex Hub Premium Logo V3 loaded!")
