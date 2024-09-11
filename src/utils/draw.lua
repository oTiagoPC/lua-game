function drawInCamera()
    gameMap:drawLayer(gameMap.layers["ground"])
    gameMap:drawLayer(gameMap.layers["details"])
    gameMap:drawLayer(gameMap.layers["buildings"])
    gameMap:drawLayer(gameMap.layers["barriers"])

    if #world.NPCs > 0 then 
        for i, npc in ipairs(world.NPCs) do
           -- npc.anim:draw(sprites.vagnerSheet, npc.x, npc.y, nil, nil, 1, 2, 4)
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
            enemy.anim:draw(sprites.enemySheet, enemy.x, enemy.y, nil, 6, nil, 6, 9)
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
end