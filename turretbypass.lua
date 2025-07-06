local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local plr = Players.LocalPlayer
local chr = plr.Character or plr.CharacterAdded:Wait()
local root = chr:WaitForChild("HumanoidRootPart")
local humanoid = chr:WaitForChild("Humanoid")

local function getModelCenter(model)
    return model:GetPivot().Position
end

local function sitAtMaximGun()
    local maximGun = nil
    local turretSeat = nil

    repeat
        RunService.Heartbeat:Wait()

        maximGun = workspace:FindFirstChild("RuntimeItems")
            and workspace.RuntimeItems:FindFirstChild("MaximGun")

        if maximGun then
            turretSeat = maximGun:FindFirstChildWhichIsA("VehicleSeat") or maximGun:FindFirstChildWhichIsA("Seat")
        end
    until turretSeat

    local seated = false

    while not seated do
        pcall(function()
            if humanoid.SeatPart ~= turretSeat then
                turretSeat:Sit(humanoid)
            else
                seated = true
            end
        end)
        RunService.Heartbeat:Wait()
    end
end

sitAtMaximGun()
