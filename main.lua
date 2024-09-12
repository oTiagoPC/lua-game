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
        love.graphics.draw(sprites.hud.titleBackground, love.graphics.getWidth() / 2, love.graphics.getHeight() / 2, 0, 1, 1, sprites.hud.titleBackground:getWidth() / 2, sprites.hud.titleBackground:getHeight() / 2)
        love.graphics.draw(sprites.hud.title, love.graphics.getWidth() / 2, love.graphics.getHeight() / 3, 0, 8, 8, sprites.hud.title:getWidth() / 2, sprites.hud.title:getHeight() / 2)
        love.graphics.draw(sprites.hud.startingText, love.graphics.getWidth() / 2, love.graphics.getHeight() / 1.2, 0, 8, 8, sprites.hud.startingText:getWidth() / 2, sprites.hud.startingText:getHeight() / 2)
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
    if key == 'space' then
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
