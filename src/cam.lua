camera = require('libraries/hump/camera')
cam = camera()

function cam:update(dt)
    cam:lookAt(player.x, player.y)

    local w = love.graphics.getWidth()
    local h = love.graphics.getHeight()

    local mapW = gameMap.width * gameMap.tilewidth
    local mapH = gameMap.height * gameMap.tileheight

    -- Left
    if cam.x < w/2 then
        cam.x = w/2
    end
    -- Up
    if cam.y < h/2 then
        cam.y = h/2
    end
    -- Right
    if cam.x > (mapW - w/2) then
        cam.x = (mapW - w/2)
    end
    -- Down
    if cam.y > (mapH - h/2) then
        cam.y = (mapH - h/2)
    end

end