function drawInCamera()
    if gameMap.layers["ground"] then
        gameMap:drawLayer(gameMap.layers["ground"])
    end
    if gameMap.layers["details"] then
        gameMap:drawLayer(gameMap.layers["details"])
    end
    if gameMap.layers["buildings"] then
        gameMap:drawLayer(gameMap.layers["buildings"])
    end
    if gameMap.layers["objects"] then
        gameMap:drawLayer(gameMap.layers["objects"])
    end
    if gameMap.layers["objects2"] then
        gameMap:drawLayer(gameMap.layers["objects2"])
    end
    if gameMap.layers["barriers"] then
        gameMap:drawLayer(gameMap.layers["barriers"])
    end
    
    if #world.NPCs > 0 then 
        for i, npc in ipairs(world.NPCs) do
           npc.anim:draw(sprites.vagnerSheet, npc.x-2, npc.y, nil, npc.dirX, 1, 11, 10.5)
        end
    end
    
    player:draw()
        
    if #world.coins > 0 then
        for i, coin in ipairs(world.coins) do
            coin:draw()
        end
    end

    if #world.enemies > 0 then
        for i, enemy in ipairs(world.enemies) do
            enemy.anim:draw(sprites.enemySheet, enemy.x, enemy.y-2, nil, enemy.dirX, 1, 11, 10.5)
        end
    end

    for _, bullet in ipairs(player.bullets) do
        bullet:draw()
    end

    if #world.food > 0 then
        for i, food in ipairs(world.food) do
            food:draw()
        end
    end
end

function drawAfterCamera()
    drawHUD()
    if world.dialog then
        dialog:draw()
    end
    
    love.graphics.printf("Posiçao do mouse: " .. player.x .. " " .. player.y, 0, 0, 800, 'left')
    

end