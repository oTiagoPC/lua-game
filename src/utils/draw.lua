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
end

function drawUI()
    -- Draw the dash cooldown bar
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Dash Cooldown:", 10, 10)
    love.graphics.rectangle("line", 10, 30, 100, 20)
    
    love.graphics.print("Health: " .. player.health, 10, 100)
    if #world.enemies > 0 then
        for i, enemy in ipairs(world.enemies) do
            love.graphics.print("Enemy " .. i .. " Health: " .. enemy.health, 10, 120 + 20 * i)
        end
    end
    local cooldownProgress = math.min(1, (love.timer.getTime() - player.lastDashTime) / player.dashCooldown)
    love.graphics.rectangle("fill", 10, 30, 100 * cooldownProgress, 20)
end