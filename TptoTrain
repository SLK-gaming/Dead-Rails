local c = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
local found = false

for _, m in ipairs(workspace:GetDescendants()) do
    if m:IsA("Model") and m.Name == "ConductorSeat" then
        local s = m:FindFirstChildWhichIsA("VehicleSeat", true)
        if s then
            c:MoveTo(s.Position)
            found = true
            break
        end
    end
end

if not found then
    c:MoveTo(Vector3.new(60.55, 13.58, 29860.01))
end
