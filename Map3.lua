-- SCRIPT KẾT HỢP: TELEPORT & THẢ TNT (CHỜ 4S MỖI ĐIỂM)
local locations = {
    Vector3.new(1515.4498291015625, 19.4760684967041, -36308.44921875),
    Vector3.new(-2138.0859375, 215.59803771972656, -9582.7421875),
    Vector3.new(1432.350830078125, 17.238021850585938, -24886.34375),
    Vector3.new(7058.6513671875, 416.6647033691406, -20568.587890625)
}

local player = game.Players.LocalPlayer
local Network = game:GetService("ReplicatedStorage"):WaitForChild("Network")
local TeleportService = game:GetService("TeleportService")

local function startSequence()
    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")

    for i, targetPos in ipairs(locations) do
        -- 1. Dịch chuyển đến điểm
        rootPart.CFrame = CFrame.new(targetPos)
        rootPart.Velocity = Vector3.new(0, 0, 0)
        print("Đã đến tọa độ " .. i)

        -- 2. Chờ 2 giây đầu tiên (Đã chỉnh từ 1.5 -> 2)
        task.wait(2)

        -- 3. Thực hiện thả TNT
        pcall(function()
            Network.TNT_Consume:InvokeServer()
        end)
        print("--> Thả TNT tại điểm " .. i)

        -- 4. Chờ nốt 2 giây còn lại (Đã chỉnh từ 1.5 -> 2)
        task.wait(2)
    end
    
    print("Hoàn thành chuỗi dịch chuyển và thả TNT!")
    
    -- Đợi 4 giây rồi chuyển đến place chỉ định
    print("Đang đợi 4 giây để chuyển place...")
    task.wait(4)
    TeleportService:Teleport(8737899170, player)  -- Đã sửa place ID
end

-- Chạy script
startSequence()
