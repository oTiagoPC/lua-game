function love.load()
    colliderToggle = false

    require('src/utils/load')
    loadAll()
end

function love.update(dt)
    if world.dialog then
        dialog:update(dt)
    else
        updateAll(dt)
    end
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
        dialog:start()
    end
    if key == "space" then 
        if world.dialog then
            dialog:next()
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
    if key == "1" then 
        world.dialogoAtual = roteiro.c3.dialogo1
    end 
    if key == "2" then 
        world.dialogoAtual = roteiro.c3.dialogo2
    end 
    if key == "5" then 
        world.mapaAtual = "maps/biblioMap.lua"
        map.mudou = true
    end
end