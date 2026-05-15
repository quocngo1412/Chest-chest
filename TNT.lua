-- Lấy ID place và ép về chuỗi để so sánh tuyệt đối
local placeId = tostring(game.PlaceId)

-- Kiểm tra và chạy script tương ứng
if placeId == "8737899170" then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/quocngo1412/Chest-chest/refs/heads/main/Map1.lua"))()
elseif placeId == "16498369169" then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/quocngo1412/Chest-chest/refs/heads/main/Map2.lua"))()
elseif placeId == "17503543197" then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/quocngo1412/Chest-chest/refs/heads/main/Map3.lua"))()
else
    warn("Bạn đang ở Place ID không được hỗ trợ: " .. placeId)
end
