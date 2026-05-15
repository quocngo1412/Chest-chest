-- SCRIPT KẾT HỢP: TELEPORT & THẢ TNT (CHỜ 4S MỖI ĐIỂM)
local locations = {
    Vector3.new(137.7860870361328, 16.23735237121582, 564.4766845703125),
    Vector3.new(1476.7813720703125, 16.423439025878906, 1746.704833984375),
    Vector3.new(586.0607299804688, 16.237377166748047, 3273.010009765625),
    Vector3.new(-3.1557674407958984, 116.30023956298828, 5633.455078125)
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
    
    -- Đợi 4 giây rồi chuyển sang place chỉ định
    print("Đang đợi 4 giây để chuyển place...")
    task.wait(4)
    TeleportService:Teleport(16498369169, player)
end

-- Chạy script
startSequence()
