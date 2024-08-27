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

    -- Adicione isso para desenhar a interface do usuário fora da câmera
    drawUI()
end

function love.keypressed(key)
    if key == 'lshift' then
        player:dash()
    end
end