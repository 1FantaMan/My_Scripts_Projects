--// Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--// Player
local plr = Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hum: Humanoid = char:WaitForChild("Humanoid")

--// Variables
local configurations = {
    FarmingMethod = "Delivery", -- Avaliable Options: Cave, Delivery.
    Aimbot = {
        Active = false,
        VelocityPredictions = true -- Uses the Target's Root Velocity to Predict Where he goes.
    },
}
local rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local window = rayfield:CreateWindow({
    Name = "Rayfield Example Window",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "Rayfield Interface Suite",
    LoadingSubtitle = "by Sirius",
    ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
    Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

    ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

    DisableRayfieldPrompts = false,
})

--// Functions
local function UpdateCharVariable(newChar)
    char = newChar
    hum = newChar:WaitForChild("Humanoid")
end

local function GetRoot(): Part
    if hum == nil then return end
    return hum.RootPart
end

--// Script
local farmTab = window:CreateTab("Farming")

--// Signals
plr.CharacterAdded:Connect(UpdateCharVariable)