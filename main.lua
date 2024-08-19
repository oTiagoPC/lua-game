function love.load()
    require('src/utils/load')
    loadAll()
end

function love.update(dt)
    updateAll(dt)
end

function love.draw()
    cam:attach()

    drawInCamera()
    world:draw()

    cam:detach()
end