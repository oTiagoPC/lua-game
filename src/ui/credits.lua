credits = {}

function credits:draw()
    love.graphics.draw(sprites.hud.titleBackground, love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 0, 1, 1, sprites.hud.titleBackground:getWidth() / 2, sprites.hud.titleBackground:getHeight() / 2)
    love.graphics.print("Codigos", love.graphics.getWidth() / 2  -35 , love.graphics.getHeight() - 50)
end
love.graphics.draw(sprites.hud.title, love.graphics.getWidth() / 2, love.graphics.getHeight() / 3, 0, 8, 8, sprites.hud.title:getWidth() / 2, sprites.hud.title:getHeight() / 2)
