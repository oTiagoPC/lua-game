function drawHUD()
    drawChar()
    drawHearts()
    drawCoins()
    drawHamburguer()
    drawDashMeter()
    drawDebug()
end

function drawHearts()
    for i = 0, player.maxHealth - 1 do
        local heartSpr = sprites.hud.emptyHeart
        if player.health > i then
            heartSpr = sprites.hud.fullHeart
        end
        love.graphics.draw(heartSpr, 90 + (i * 40), 10, nil, 4)
    end
end

function drawChar()
    love.graphics.draw(sprites.hud.berriFace, 15, 15, nil, 4)
end

function drawCoins()
    love.graphics.draw(sprites.hud.coinIcon, 93, 50, nil, 4)
    love.graphics.setFont(font)
    love.graphics.print("X" .. player.coins, 147, 70)
end

function drawHamburguer()
    love.graphics.draw(sprites.hud.hamburguer, 200, 50, nil, 4)
    love.graphics.setFont(font)
    love.graphics.print("X" .. player.healing, 262, 70)
end

function drawDashMeter()
    local cooldownProgress = math.min(1, (love.timer.getTime() - player.lastDashTime) / player.dashCooldown)
    if not player.canDash() then
        love.graphics.rectangle("fill", 10, love.graphics.getHeight() - 10, 20 , 100 * -cooldownProgress)
    end
end

function drawDebug()
    if #world.enemies > 0 then
        for i, enemy in ipairs(world.enemies) do
            love.graphics.print("Enemy " .. i .. " Health: " .. enemy.health, 10, 120 + 20 * i)
        end
    end
    love.graphics.print("Player Bullet Count: " .. #player.bullets, 10, 100)
end
