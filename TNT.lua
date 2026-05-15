-- Lấy ID của Place hiện tại
local placeId = game.PlaceId

-- Kiểm tra và chạy script tương ứng
if placeId == 8737899170 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/quocngo1412/Chest-chest/refs/heads/main/Map1.lua"))()
elseif placeId == 16498369169 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/quocngo1412/Chest-chest/refs/heads/main/Map2.lua"))()
elseif placeId == 17503543197 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/quocngo1412/Chest-chest/refs/heads/main/Map3.lua"))()
else
    -- Không khớp ID nào, có thể thông báo nếu cần
    warn("Place ID không được hỗ trợ: " .. tostring(placeId))
end
