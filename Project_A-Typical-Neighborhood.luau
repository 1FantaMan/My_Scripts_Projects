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


--// Signals
plr.CharacterAdded:Connect(UpdateCharVariable)