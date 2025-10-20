run_on_actor(getactors()[1], [[
    local players = game:GetService("Players")
local replicatedStorage = game:GetService("ReplicatedStorage")

local localPlayer = players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")

-- build a lightweight screen gui + button
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RankedTeleportGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local button = Instance.new("TextButton")
button.Name = "JoinRankedButton"
button.Size = UDim2.new(0, 200, 0, 40)
button.Position = UDim2.new(0.5, -100, 0, 20) -- top-center
button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
button.BorderSizePixel = 0
button.Font = Enum.Font.GothamBold
button.TextSize = 18
button.TextColor3 = Color3.new(1, 1, 1)
button.Text = "Join Ranked"
button.Parent = screenGui

-- resolve Park module once
local parkModule
do
    local controllers = replicatedStorage:FindFirstChild("Controllers")
    local uiFolder = controllers and controllers:FindFirstChild("UIController")
    if uiFolder then
        local ok, park = pcall(function()
            local parkScript = uiFolder:FindFirstChild("Park") or uiFolder:WaitForChild("Park", 5)
            return parkScript and require(parkScript)
        end)
        if ok and type(park) == "table" and type(park.Teleport) == "function" then
            parkModule = park
        else
            warn("Ranked teleport: Park module not available.")
        end
    else
        warn("Ranked teleport: UIController folder not found.")
    end
end

button.MouseButton1Click:Connect(function()
    if not parkModule then
        warn("Ranked teleport unavailable right now.")
        return
    end
    local ok, err = pcall(function()
        parkModule:Teleport("Ranked")
    end)
    if not ok then
        warn("[Join Ranked] teleport failed: " .. tostring(err))
    end
end)
]])
