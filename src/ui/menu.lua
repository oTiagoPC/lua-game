menu = {}

berri = {}
berri.grid = anim8.newGrid(64, 64, sprites.berriSheet:getWidth(), sprites.berriSheet:getHeight())
berri.blink = anim8.newAnimation(berri.grid('1-4', 1), {4, 0.1, 0.1, 0.1})

function menu:draw()
    love.graphics.draw(sprites.hud.titleBackground, love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 0, 1, 1, sprites.hud.titleBackground:getWidth() / 2, sprites.hud.titleBackground:getHeight() / 2)
    berri.blink:draw(sprites.berriSheet, -65, love.graphics.getHeight() - (sprites.berriSheet:getHeight() * 13), 0, 13, 13)
    love.graphics.draw(sprites.hud.title, love.graphics.getWidth() / 2 + 330, love.graphics.getHeight() / 3, 0, 8, 8, sprites.hud.title:getWidth() / 2, sprites.hud.title:getHeight() / 2)
    love.graphics.draw(sprites.hud.startingText, love.graphics.getWidth() / 2 + 330, love.graphics.getHeight() / 1.2, 0, 8, 8, sprites.hud.startingText:getWidth() / 2, sprites.hud.startingText:getHeight() / 2)
end

function menu:update(dt)
    berri.blink:update(dt)
end