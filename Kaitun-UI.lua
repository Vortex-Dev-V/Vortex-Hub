-- ╔══════════════════════════════════════════════════════════════════╗
-- ║                    VORTEX HUB - PREMIUM LOGO V2                  ║
-- ║              Hiệu ứng sang trọng - Cực to - Cắt góc             ║
-- ╚══════════════════════════════════════════════════════════════════╝

local Players      = game:GetService("Players")
local RunService   = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer  = Players.LocalPlayer
local PlayerGui    = LocalPlayer:WaitForChild("PlayerGui")

-- ======= CẤU HÌNH =======
local MUSIC_ID     = "rbxassetid://1843671946"
local BPM          = 128
local TEXTURE_ID   = "rbxassetid://106076957031352"
-- =========================

if PlayerGui:FindFirstChild("VortexLogo") then
    PlayerGui.VortexLogo:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name           = "VortexLogo"
ScreenGui.ResetOnSpawn   = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder   = 9999
ScreenGui.Parent         = PlayerGui

-- ===== CLIP FRAME =====
local Clip = Instance.new("Frame")
Clip.Name                 = "Clip"
Clip.Size                 = UDim2.new(0.42, 0, 0.6, 0)
Clip.Position             = UDim2.new(0, 0, 0.4, 0)
Clip.BackgroundTransparency = 1
Clip.ClipsDescendants     = true
Clip.ZIndex               = 7
Clip.Parent               = ScreenGui

local LOGO_SIZE = 550

local POS_IN  = UDim2.new(0, -180, 1, -LOGO_SIZE + 100)
local POS_OUT = UDim2.new(0, -(LOGO_SIZE + 80), 1, -LOGO_SIZE + 100)

-- ===== LỚP BÓNG (Shadow) =====
local Shadow = Instance.new("ImageLabel")
Shadow.Name                   = "Shadow"
Shadow.Size                   = UDim2.new(0, LOGO_SIZE, 0, LOGO_SIZE)
Shadow.Position               = POS_OUT
Shadow.AnchorPoint            = Vector2.new(0, 0)
Shadow.BackgroundTransparency = 1
Shadow.Image                  = TEXTURE_ID
Shadow.ImageColor3            = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency      = 0.65
Shadow.ZIndex                 = 8
Shadow.Parent                 = Clip

-- ===== LỚP PHÁT SÁNG (Glow) =====
local Glow = Instance.new("ImageLabel")
Glow.Name                   = "Glow"
Glow.Size                   = UDim2.new(0, LOGO_SIZE + 50, 0, LOGO_SIZE + 50)
Glow.Position               = POS_OUT
Glow.AnchorPoint            = Vector2.new(0, 0)
Glow.BackgroundTransparency = 1
Glow.Image                  = TEXTURE_ID
Glow.ImageColor3            = Color3.fromRGB(138, 43, 226)
Glow.ImageTransparency      = 0.75
Glow.ZIndex                 = 9
Glow.Parent                 = Clip

-- ===== VIỀN SÁNG XUNG QUANH =====
local BorderGlow = Instance.new("ImageLabel")
BorderGlow.Name                   = "BorderGlow"
BorderGlow.Size                   = UDim2.new(0, LOGO_SIZE + 15, 0, LOGO_SIZE + 15)
BorderGlow.Position               = POS_OUT
BorderGlow.AnchorPoint            = Vector2.new(0, 0)
BorderGlow.BackgroundTransparency = 1
BorderGlow.Image                  = "rbxassetid://5028857084"
BorderGlow.ImageColor3            = Color3.fromRGB(138, 43, 226)
BorderGlow.ImageTransparency      = 0.5
BorderGlow.ZIndex                 = 8
BorderGlow.Parent                 = Clip

-- ===== LOGO CHÍNH =====
local Logo = Instance.new("ImageLabel")
Logo.Name                   = "Logo"
Logo.Size                   = UDim2.new(0, LOGO_SIZE, 0, LOGO_SIZE)
Logo.Position               = POS_OUT
Logo.AnchorPoint            = Vector2.new(0, 0)
Logo.BackgroundTransparency = 1
Logo.Image                  = TEXTURE_ID
Logo.ImageColor3            = Color3.fromRGB(255, 255, 255)
Logo.ImageTransparency      = 0
Logo.ZIndex                 = 10
Logo.Parent                 = Clip

-- ===== HIỆU ỨNG HẠT SÁNG (Particle) =====
local ParticleContainer = Instance.new("Frame")
ParticleContainer.Name = "Particles"
ParticleContainer.Size = UDim2.new(1, 0, 1, 0)
ParticleContainer.BackgroundTransparency = 1
ParticleContainer.Parent = Clip

local particles = {}
for i = 1, 30 do
    local particle = Instance.new("Frame")
    particle.Size = UDim2.new(0, math.random(2, 5), 0, math.random(2, 5))
    particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
    particle.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
    particle.BackgroundTransparency = 0.3
    particle.BorderSizePixel = 0
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = particle
    particle.Parent = ParticleContainer
    table.insert(particles, particle)
end

-- ===== NHẠC NỀN =====
local Sound = Instance.new("Sound")
Sound.Name               = "VortexMusic"
Sound.SoundId            = MUSIC_ID
Sound.Volume             = 0.5
Sound.Looped             = true
Sound.RollOffMaxDistance = 999999
Sound.Parent             = workspace

local function playMusic()
    if not Sound.IsPlaying then Sound:Play() end
end
if Sound.IsLoaded then playMusic()
else Sound.Loaded:Once(playMusic) end

-- ===== HIỆU ỨNG SLIDE VÀO =====
local introDone = false
local particleTime = 0

task.delay(0.2, function()
    -- Slide logo chính
    local slideIn = TweenService:Create(Logo,
        TweenInfo.new(3.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Position = POS_IN,
        }
    )
    slideIn:Play()
    
    -- Slide shadow lệch
    TweenService:Create(Shadow, TweenInfo.new(3.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(POS_IN.X.Scale, POS_IN.X.Offset + 12,
                             POS_IN.Y.Scale, POS_IN.Y.Offset + 15),
    }):Play()
    
    -- Slide glow
    TweenService:Create(Glow, TweenInfo.new(3.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(POS_IN.X.Scale, POS_IN.X.Offset - 20,
                             POS_IN.Y.Scale, POS_IN.Y.Offset - 20),
    }):Play()
    
    -- Slide border glow
    TweenService:Create(BorderGlow, TweenInfo.new(3.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(POS_IN.X.Scale, POS_IN.X.Offset - 8,
                             POS_IN.Y.Scale, POS_IN.Y.Offset - 8),
    }):Play()
    
    slideIn.Completed:Connect(function()
        introDone = true
    end)
end)

-- ===== HIỆU ỨNG ROTATION + PULSE =====
local rotation = 0
local elapsed = 0
local beatTimer = 0
local beatInterval = 60 / BPM
local isBeat = false
local scaleDirection = 1
local currentScale = 1

local function doBeat()
    if isBeat or not introDone then return end
    isBeat = true
    
    -- Glow nhấp nháy theo nhạc
    TweenService:Create(Glow, TweenInfo.new(0.05), { ImageTransparency = 0.3 }):Play()
    TweenService:Create(BorderGlow, TweenInfo.new(0.05), { ImageTransparency = 0.2 }):Play()
    
    task.delay(0.1, function()
        TweenService:Create(Glow, TweenInfo.new(0.3), { ImageTransparency = 0.7 }):Play()
        TweenService:Create(BorderGlow, TweenInfo.new(0.3), { ImageTransparency = 0.5 }):Play()
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
    end
end

-- Chạy particle loop
task.spawn(function()
    while true do
        task.wait(4)
        if introDone then
            animateParticles()
        end
    end
end)

RunService.RenderStepped:Connect(function(dt)
    elapsed = elapsed + dt
    beatTimer = beatTimer + dt
    
    if not introDone then return end
    
    -- Xoay logo (rất chậm và mượt)
    rotation = (rotation + 25 * dt) % 360
    Logo.Rotation = rotation
    Shadow.Rotation = rotation
    Glow.Rotation = rotation
    BorderGlow.Rotation = rotation
    
    -- Hiệu ứng phồng xẹp nhẹ
    currentScale = 1 + math.sin(elapsed * 2) * 0.02
    Logo.Size = UDim2.new(0, LOGO_SIZE * currentScale, 0, LOGO_SIZE * currentScale)
    Shadow.Size = UDim2.new(0, LOGO_SIZE * currentScale, 0, LOGO_SIZE * currentScale)
    Glow.Size = UDim2.new(0, (LOGO_SIZE + 50) * currentScale, 0, (LOGO_SIZE + 50) * currentScale)
    BorderGlow.Size = UDim2.new(0, (LOGO_SIZE + 15) * currentScale, 0, (LOGO_SIZE + 15) * currentScale)
    
    -- Glow pulse theo sin
    Glow.ImageTransparency = 0.6 + 0.15 * math.sin(elapsed * 2.5)
    BorderGlow.ImageTransparency = 0.4 + 0.15 * math.sin(elapsed * 2.5)
    
    if beatTimer >= beatInterval then
        beatTimer = beatTimer - beatInterval
        doBeat()
    end
end)

-- Click để tắt/mở nhạc
Logo.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        if Sound.IsPlaying then 
            Sound:Pause()
        else 
            Sound:Play()
        end
    end
end)

-- Border glow animation khi hover (nếu muốn)
Logo.MouseEnter:Connect(function()
    TweenService:Create(BorderGlow, TweenInfo.new(0.3), { ImageTransparency = 0.15 }):Play()
end)

Logo.MouseLeave:Connect(function()
    TweenService:Create(BorderGlow, TweenInfo.new(0.3), { ImageTransparency = 0.5 }):Play()
end)

print("✅ Vortex Hub loaded!") 
