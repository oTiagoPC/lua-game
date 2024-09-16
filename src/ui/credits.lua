credits = {}  
credits.teste = love.graphics.newImage('sprites/testeCreditos.png')
credits.offsetY = 0
credits.speed = 50

function credits:update(dt)
    credits.offsetY = credits.offsetY + credits.speed * dt
end

function credits:draw()
    local screenWidth = love.graphics.getWidth()
    local screenHeight = love.graphics.getHeight()    
    local imageWidth = credits.teste:getWidth()
    local imageHeight = credits.teste:getHeight()
    
    local scaleX = screenWidth / imageWidth
    local scaleY = screenHeight / imageHeight
    
    local scale = math.max(scaleX, scaleY)
    
    love.graphics.draw(credits.teste, screenWidth / 2, credits.offsetY, 0, scale, scale, imageWidth / 2, 0)
end
