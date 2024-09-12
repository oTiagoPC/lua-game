gameState = "menu"

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
    if gameState == "menu" then
        love.graphics.print("Pressione 'W' para começar", 300, 300)
    else
        cam:attach()
        drawInCamera()
        if colliderToggle then
            world:draw()
        end
        cam:detach()

        drawAfterCamera()
    end
end

function love.keypressed(key)
    if key == 'w' then
        gameState = "game"
    end
    if gameState == "game" then      
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
            player:spawn(540, 500)
            world.currentMap = "maps/biblioMap.lua"
        end
    end
end
