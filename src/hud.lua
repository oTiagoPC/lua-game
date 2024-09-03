hud = {}
function drawHud()
    -- Draw the dash cooldown bar
    love.graphics.setFont(font)
    love.graphics.setColor(1, 1, 1)

    berriFace = love.graphics.newImage("sprites/berriFace.png")
    love.graphics.draw(berriFace, 15, 15, nil, 4)

    heart = love.graphics.newImage("sprites/heart.png")
    brokenHeart = love.graphics.newImage("sprites/brokenHeart.png")

    hamburgue = love.graphics.newImage("sprites/hamburguer.png")
    love.graphics.draw(hamburgue, 200, 50, nil, 4)
    moeda = love.graphics.newImage("sprites/littleCoin.png")
    love.graphics.draw(moeda, 93, 50, nil, 4)
    playerHealth = player.health

    local vx = 90

    for i = 1, player.maxHealth do
        if i <= playerHealth then
            love.graphics.draw(heart, vx, 10, nil, 4)
        else
            love.graphics.draw(brokenHeart, vx, 10, nil, 4)
        end
        vx = vx + 40
        if playerHealth == 0 then 
            love.event.quit()
        end
    end

    if #world.enemies > 0 then
        for i, enemy in ipairs(world.enemies) do
            love.graphics.print("Enemy " .. i .. " Health: " .. enemy.health, 10, 120 + 20 * i)
        end
    end
    local cooldownProgress = math.min(1, (love.timer.getTime() - player.lastDashTime) / player.dashCooldown)
    if not player.canDash() then
        love.graphics.rectangle("fill", 10, love.graphics.getHeight() - 10, 20 , 100 * -cooldownProgress)
    end
end
