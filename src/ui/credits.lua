credits = {}  
credits.offsetY = love.graphics.getHeight()
credits.speed = 65

function credits:update(dt)
    credits.offsetY = credits.offsetY - credits.speed * dt
end

function credits:draw()
    local screenWidth = love.graphics.getWidth()
    local screenHeight = love.graphics.getHeight()
    local imageWidth = sprites.hud.credits:getWidth()
    local imageHeight = sprites.hud.credits:getHeight()
    
    local scaleX = screenWidth / imageWidth
    local scaleY = screenHeight / imageHeight
    
    local scale = math.max(scaleX, scaleY)
    
    love.graphics.draw(sprites.hud.credits, screenWidth / 2, credits.offsetY, 0, scale/2, scale/2, imageWidth / 2, 0)
end
