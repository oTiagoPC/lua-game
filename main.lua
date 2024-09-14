gameState = "menu"

function love.load()
    colliderToggle = false

    require('src/startup/load')
    loadAll()

    loadMap('c3Map')
end

function love.update(dt)
    updateAll(dt)
end

function love.draw()
    if gameState == "menu" then
        menu:draw()
        --credits:draw()
        sounds.menuSong:play()
    else
        sounds.menuSong:stop()
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
    end
end
