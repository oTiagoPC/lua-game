function drawHUD()
    drawChar()
    drawHearts()
    drawCoins()
    drawHamburguer()
    drawDashMeter()
    drawDebug()
end

function drawChar()
    berriFace = love.graphics.newImage("sprites/berriFace.png")
    love.graphics.draw(berriFace, 15, 15, nil, 4)
end

function drawHearts()
    for i = 0, player.maxHealth - 1 do
        local heartSpr = love.graphics.newImage("sprites/brokenHeart.png")
        if player.health > i then
            heartSpr = love.graphics.newImage("sprites/heart.png")
        end
        love.graphics.draw(heartSpr, 90 + (i * 40), 10, nil, 4)
    end
end

function drawCoins()
    local coin = love.graphics.newImage("sprites/littleCoin.png")
    love.graphics.draw(coin, 93, 50, nil, 4)
    love.graphics.setFont(font)
    love.graphics.print("X" .. player.coins, 147, 70)
end

function drawHamburguer()
    local hamburguer = love.graphics.newImage("sprites/hamburguer.png")
    love.graphics.draw(hamburguer, 200, 50, nil, 4)
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
