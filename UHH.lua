-- Setups
if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- Variables
local player = game.Players.LocalPlayer

-- Setup Window
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("UHH | Made by 1nf", "DarkTheme")

-- Player tab
local Player_T = Window:NewTab("Player")

local S_Health_Player = Player_T:NewSection("Health")
S_Health_Player:NewSlider("Health", "Modify player current health", 100, 0, function(s)
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.Health = s
    end
end)

S_Health_Player:NewToggle("God mode", "A toggle that make you immortal (not at all)", function(state)
    while state and player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.Health = player.Character.Humanoid.MaxHealth
        task.wait(0.000000000000000000001)
    end
end)
