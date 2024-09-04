function drawInCamera()
    gameMap:drawLayer(gameMap.layers["ground"])
    gameMap:drawLayer(gameMap.layers["objects"])

    player.anim:draw(player.spritesheet, player.x, player.y-2, nil, player.dirX, 1, 9.5, 10.5)
    if #world.enemies > 0 then
        for i, enemy in ipairs(world.enemies) do
            enemy.anim:draw(enemy.spritesheet, enemy.x, enemy.y, nil, 6, nil, 6, 9)
        end
    end
    for _, bullet in ipairs(player.bullets) do
        bullet:draw()
    end

    if #world.coins > 0 then
        for i, coin in ipairs(world.coins) do
            coin:draw()
        end
    end
end
