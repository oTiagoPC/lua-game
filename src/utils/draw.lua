function drawInCamera()
    gameMap:drawLayer(gameMap.layers["ground"])
    gameMap:drawLayer(gameMap.layers["objects"])

    player:draw()
    if #world.enemies > 0 then
        for i, enemy in ipairs(world.enemies) do
            enemy.anim:draw(sprites.enemySheet, enemy.x, enemy.y, nil, 6, nil, 6, 9)
        end
    end

    if #world.coins > 0 then
        for i, coin in ipairs(world.coins) do
            coin:draw()
        end
    end
    for _, bullet in ipairs(player.bullets) do
        bullet:draw()
    end
end

function drawAfterCamera()
    drawHUD()
end