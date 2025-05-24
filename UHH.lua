-- Setups
if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- Variables
local player = game.Players.LocalPlayer
local godMode = false

-- Setup Window
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("UHH | Made by 1nf", "DarkTheme")

-- Player tab
local Player_T = Window:NewTab("Player")

local S_Health_Player = Player_T:NewSection("Health")
S_Health_Player:NewSlider("Health", "Modify player current health", player.Character.Humanoid.MaxHealth, 0, function(s)
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.Health = s
    end
end)
S_Health_Player:NewToggle("God mode", "A toggle that makes you immortal (not at all)", function(state)
    godMode = state
    spawn(function()
        while godMode do
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.Health = player.Character.Humanoid.MaxHealth
            end
            task.wait(0.1)
        end
    end)
end)
