-- SCRIPT KẾT HỢP: TELEPORT & THẢ TNT (CHỜ 4S MỖI ĐIỂM)
local locations = {
    Vector3.new(-9530.0, 15.3, 206.4),
    Vector3.new(-9734.1, 17.3, 2185.6),
    Vector3.new(-11307.6, 15.3, 3278.5),
    Vector3.new(-11129.7, 15.3, 5228.8)
}

local player = game.Players.LocalPlayer
local Network = game:GetService("ReplicatedStorage"):WaitForChild("Network")

local function startSequence()
    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")

    for i, targetPos in ipairs(locations) do
        -- 1. Dịch chuyển đến điểm
        rootPart.CFrame = CFrame.new(targetPos)
        rootPart.Velocity = Vector3.new(0, 0, 0)
        print("Đã đến tọa độ " .. i)

        -- 2. Chờ 2 giây đầu tiên
        task.wait(2)

        -- 3. Thực hiện thả TNT
        pcall(function()
            Network.TNT_Consume:InvokeServer()
        end)
        print("--> Thả TNT tại điểm " .. i)

        -- 4. Chờ nốt 2 giây còn lại
        task.wait(2)
    end
    
    print("Hoàn thành chuỗi dịch chuyển và thả TNT!")
    
    -- Đợi 4 giây trước khi thực hiện chuỗi lệnh đổi thế giới
    print("Đang đợi 4 giây để chuyển sang World 3...")
    task.wait(3)
    
    -- BƯỚC XÁC NHẬN: Gửi lệnh Index để máy chủ phê duyệt trạng thái hợp lệ
    pcall(function()
        Network:WaitForChild("Index: Request Hatch Count"):InvokeServer()
    end)
    
    -- Chờ 1 giây ngắn theo đúng chuỗi tuần tự hệ thống
    task.wait(1)
    
    -- BƯỚC TELEPORT: Gọi chính xác mục con World3Teleport
    pcall(function()
        Network:WaitForChild("World3Teleport"):InvokeServer()
    end)
end

-- Chạy script
startSequence()
