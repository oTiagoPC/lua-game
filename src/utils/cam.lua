camera = require('libraries/hump/camera')
cam = camera(0, 0, scale)
cam.smoother = camera.smooth.damped(8)

function cam:update(dt)

    local camX, camY = player:getPosition()
    
    local w = love.graphics.getWidth() / scale  
    local h = love.graphics.getHeight() / scale

    world.mapWidth = gameMap.width * gameMap.tilewidth
    world.mapHeight = gameMap.height * gameMap.tileheight

    local mapW = gameMap.width * gameMap.tilewidth
    local mapH = gameMap.height * gameMap.tileheight

    
    
    -- Left
    if camX < w/2 then
        camX = w/2
    end
    -- Up
    if camY < h/2 then
        camY = h/2
    end
    -- Right
    if camX > (mapW - w/2) then
    camX = (mapW - w/2)
    end
    -- Down
    if camY > (mapH - h/2) then
        camY = (mapH - h/2)
    end
    
    cam:lockPosition(camX, camY)

end