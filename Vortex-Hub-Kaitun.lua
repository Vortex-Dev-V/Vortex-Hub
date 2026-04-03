-- Vortex Hub - Game Checker + Key System Loader

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Blox Fruits Game IDs
local BLOX_FRUITS_GAMES = {
    2753915549,  -- Blox Fruits (Main/First Sea)
    4442272183,  -- Blox Fruits (Second Sea)
    7449423635,  -- Blox Fruits (Third Sea)
}

local currentPlaceId = game.PlaceId

-- Check if current game is Blox Fruits
local function IsBloxFruits()
    for _, id in pairs(BLOX_FRUITS_GAMES) do
        if currentPlaceId == id then
            return true
        end
    end
    return false
end

-- Kick function
local function Kick(reason)
    LocalPlayer:Kick(reason or "Vortex Hub only works in Blox Fruits!")
end

-- Main execution
if IsBloxFruits() then
    print("✅ Vortex Hub: Blox Fruits detected! Loading key system...")
    -- Load the key system
    loadstring(game:HttpGet("https://keysystem.work.ink/scripts/019d521e-ba64-750f-95ac-2227cd0c0bf8"))()
else
    warn("❌ Vortex Hub: This game is NOT Blox Fruits!")
    warn("Current Place ID: " .. currentPlaceId)
    task.wait(1)
    Kick("Vortex Hub only works in Blox Fruits!\n\nJoin: https://www.roblox.com/games/2753915549/Blox-Fruits")
end
