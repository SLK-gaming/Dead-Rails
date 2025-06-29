local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local plr = Players.LocalPlayer
local chr = plr.Character or plr.CharacterAdded:Wait()
local root = chr:WaitForChild("HumanoidRootPart")
local humanoid = chr:WaitForChild("Humanoid")

local function sitAtMaximGunOnce()
    -- Nếu đã ngồi thì không làm gì
    if humanoid.SeatPart and humanoid.SeatPart:IsDescendantOf(workspace) then
        return
    end

    local castle
    repeat
        RunService.Heartbeat:Wait()
        castle = workspace:FindFirstChild("VampireCastle")
    until castle

    local turretSeat = nil
    local maximGun = nil

    repeat
        RunService.Heartbeat:Wait()
        maximGun = workspace:FindFirstChild("RuntimeItems")
            and workspace.RuntimeItems:FindFirstChild("MaximGun")
        if maximGun then
            turretSeat = maximGun:FindFirstChildWhichIsA("VehicleSeat") or maximGun:FindFirstChildWhichIsA("Seat")
        end
    until turretSeat

    -- Chỉ gọi Sit nếu chưa ngồi
    if humanoid.SeatPart ~= turretSeat then
        pcall(function()
            turretSeat:Sit(humanoid)
        end)
    end
end

-- Chạy 1 lần duy nhất
sitAtMaximGunOnce()
