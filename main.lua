function love.load()
    colliderToggle = false

    require('src/utils/load')
    loadAll()
end

function love.update(dt)
    updateAll(dt)
end

function love.draw()
    cam:attach()
        drawInCamera()
        if colliderToggle then
            world:draw()
        end
    cam:detach()

    drawAfterCamera()
end

function love.keypressed(key)
    if key == 'q' then
        colliderToggle = not colliderToggle
    end
    if key == "x" then 
        world.dialogo = not world.dialogo
    end
    if world.dialogo then 
        if key == "space" then 
            dialogoAtual.atualiza = true
        end
    end

    if key == 'escape' then
        love.event.quit()
    end
    if key == 'lshift' then
        player:dash()
    end
    if key == "l" then
        table.insert(world.enemies, createEnemy(math.random(0, world.mapWidth), math.random(0, world.mapHeight)))
    end
    if key == "j" then
        player:heal()
    end
end