-- Setups
if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- Variables
local player = game.Players.LocalPlayer
local godMode = false

repeat wait() until player.Character and player.Character:FindFirstChild("Humanoid")
local humanoid = player.Character:FindFirstChild("Humanoid")

-- Setup Window
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("UHH | Made by 1nf", "DarkTheme")

-- Player tab
local Player_T = Window:NewTab("Player")

local S_Health_Player = Player_T:NewSection("Health")
S_Player_Health:NewTextBox("Set Health", "Enter a number to set health", function(txt)
    local value = tonumber(txt)
    if value then
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.Health = value
        end
    else
        warn("Not a number")
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
local S_Other_Player = Player_T:NewSection("Other")
