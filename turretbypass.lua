local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local plr = Players.LocalPlayer
local chr = plr.Character or plr.CharacterAdded:Wait()
local root = chr:WaitForChild("HumanoidRootPart")
local humanoid = chr:WaitForChild("Humanoid")

local teleportPosition = Vector3.new(238, 6, -9096)

local function getModelCenter(model)
    return model:GetPivot().Position
end

local function sitAtMaximGun()
    local castle
    repeat
        root.CFrame = CFrame.new(teleportPosition)
        root.Anchored = true
        RunService.Heartbeat:Wait()
        castle = workspace:FindFirstChild("VampireCastle")
    until castle

    local centerPos = getModelCenter(castle)
    local turretSeat = nil
    local maximGun = nil

    repeat
        root.CFrame = CFrame.new(centerPos)
        chr:PivotTo(CFrame.new(centerPos))
        RunService.Heartbeat:Wait()

        maximGun = workspace:FindFirstChild("RuntimeItems")
            and workspace.RuntimeItems:FindFirstChild("MaximGun")

        if maximGun then
            turretSeat = maximGun:FindFirstChildWhichIsA("VehicleSeat") or maximGun:FindFirstChildWhichIsA("Seat")
        end
    until turretSeat

    root.Anchored = false
    local seated = false

    while not seated do
        pcall(function()
            local seatPos = turretSeat.CFrame + Vector3.new(0, 5, 0)
            root.CFrame = seatPos
            chr:PivotTo(seatPos)

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

task.wait(2)

for i = 1, 2 do
    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    task.wait(0.5)
end

sitAtMaximGun()
