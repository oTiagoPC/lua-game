boss = {}

function boss:create(x, y)
    boss.x = x 
    boss.y = y 
    boss.health = 150
    boss.speed = player.speed * 0.8
    boss.isAlive = true
    boss.flashTimer = 0
    boss.summonTimer = 10
    boss.avoidanceTimer = 0
    boss.avoidanceDirection = {x = 0, y = 0}
    boss.stuckTimer = 0
    boss.lastPosition = {x = x, y = y}

    boss.collider = world:newBSGRectangleCollider(x, y, 35, 45, 5)
    boss.collider:setCollisionClass('Boss')
    boss.collider:setFixedRotation(true)
    boss.collider:setLinearDamping(12)
    boss.collider:setObject(boss)
    
    boss.grid = anim8.newGrid(19, 21, sprites.bossSheet:getWidth(), sprites.bossSheet:getHeight())
    boss.animations = {
        downRight = anim8.newAnimation(boss.grid('1-2', 1), 0.2),
        downLeft = anim8.newAnimation(boss.grid('1-2', 1), 0.2),
        upRight = anim8.newAnimation(boss.grid('1-2', 2), 0.2),
        upLeft = anim8.newAnimation(boss.grid('1-2', 2), 0.2)
    } 
    boss.anim = boss.animations.downRight
end

function boss:takeDamage(damage)
    boss.health = boss.health - damage
    boss.flashTimer = 0.12
    if boss.health <= 0 then
        boss.collider:destroy()
        boss.isAlive = false
        id = 'roteiro.c3Parte2.dialogo3'
        previousDialog = 'roteiro.c3Parte2.dialogo3'
        world.dialogoAtual = roteiro.c3Parte2.dialogo3
        playDialog(id)
    end
end

function boss:summonEnemy()
    local x = boss.x + math.random(-50, 50)
    local y = boss.y + math.random(-50, 50)
    table.insert(world.enemies, createEnemy(x, y))
end

function boss:draw()
    if boss.flashTimer > 0 then 
        love.graphics.setShader(shaders.flash)
    end
    boss.anim:draw(sprites.bossSheet, boss.x, boss.y-2, nil, 3, 3, 11, 10.5)
    love.graphics.setShader()
end 

function boss:drawLifeBarOnTop()
    local windowWidth, windowHeight = love.graphics.getWidth(), love.graphics.getHeight()
    local barWidth = 600
    local barHeight = 30
    local barX = windowWidth / 2 - barWidth / 2
    local barY = 60

    love.graphics.setFont(fonts.bigger)
    love.graphics.print('Artificialis Intellectus', windowWidth / 2 - 148, 15)
    love.graphics.setFont(fonts.default)
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle('fill', barX, barY, barWidth, barHeight)

    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle('fill', barX, barY, barWidth * (boss.health / 150), barHeight)

    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle('line', barX, barY, barWidth, barHeight)
end

function boss:checkCollision()
    local colliders = world:queryRectangleArea(boss.x - 30, boss.y - 30, 60, 60, {'Wall'})
    
    if #colliders > 0 then
        local avoidX, avoidY = 0, 0
        for _, collider in ipairs(colliders) do
            local cx, cy = collider:getPosition()
            avoidX = avoidX + (boss.x - cx)
            avoidY = avoidY + (boss.y - cy)
        end

        local len = math.sqrt(avoidX^2 + avoidY^2)
        if len > 0 then
            local smoothFactor = 0.025
            boss.avoidanceDirection.x = boss.avoidanceDirection.x * (1 - smoothFactor) + (avoidX / len) * smoothFactor
            boss.avoidanceDirection.y = boss.avoidanceDirection.y * (1 - smoothFactor) + (avoidY / len) * smoothFactor
        end

        boss.avoidanceTimer = 4.0
    elseif boss.avoidanceTimer > 0 then
        boss.avoidanceTimer = boss.avoidanceTimer - 1 / 60
    else
        local resetFactor = 0.05
        boss.avoidanceDirection.x = boss.avoidanceDirection.x * (1 - resetFactor)
        boss.avoidanceDirection.y = boss.avoidanceDirection.y * (1 - resetFactor)
    end
end

function boss:checkIfStuck(dt)
    local currentX, currentY = boss.collider:getPosition()
    local distance = math.sqrt((currentX - boss.lastPosition.x)^2 + (currentY - boss.lastPosition.y)^2)
    
    if distance < 0.1 then
        boss.stuckTimer = boss.stuckTimer + dt
    else
        boss.stuckTimer = 0
    end
    
    boss.lastPosition.x = currentX
    boss.lastPosition.y = currentY
    
    return boss.stuckTimer > 1
end

function boss:updateAnimation(moveX, moveY)
    if moveX > 0 then 
        boss.anim = boss.animations.downRight
        if moveY < 0 then
            boss.anim = boss.animations.upRight
        end
    else
        boss.anim = boss.animations.downLeft
        if moveY < 0 then 
            boss.anim = boss.animations.upLeft
        end
    end
end

function boss:update(dt)
    local bossX, bossY = boss.collider:getPosition()

    if boss.flashTimer > 0 then
            boss.flashTimer = boss.flashTimer - dt
            if boss.flashTimer < 0 then
                boss.flashTimer = 0
            end
        end

    if distanceBetween(bossX, bossY, player.x, player.y) < 80 then
        if dialogPosition == 9 then
            id = 'roteiro.c3Parte2.dialogo2'
            previousDialog = 'roteiro.c3Parte2.dialogo2'
            world.dialogoAtual = roteiro.c3Parte2.dialogo2
            playDialog(id)
        end 
    end

    local directionX = player.x - bossX
    local directionY = player.y - bossY

    local distance = math.sqrt(directionX^2 + directionY^2)

    if distance > 0 then
        directionX = directionX / distance
        directionY = directionY / distance
    end

    boss:checkCollision()

    if boss.avoidanceTimer > 0 then
        directionX = directionX + boss.avoidanceDirection.x
        directionY = directionY + boss.avoidanceDirection.y
        local len = math.sqrt(directionX^2 + directionY^2)
        if len > 0 then
            directionX = directionX / len
            directionY = directionY / len
        end
    end

    boss:updateAnimation(directionX, directionY)

    local isStuck = boss:checkIfStuck(dt)
    
    if not isStuck then
        boss.collider:setLinearVelocity(directionX * boss.speed, directionY * boss.speed)
        boss.anim:update(dt)
    else
        boss.collider:setLinearVelocity(0, 0)
        boss.anim:gotoFrame(1)
    end

    boss.x = bossX - 3.5 -- ajustes para centralizar com o sprite
    boss.y = bossY - 2

    -- every 10 seconds, summon 2 enemies
    boss.summonTimer = boss.summonTimer - dt
    if boss.summonTimer <= 0 then
        boss:summonEnemy()
        boss:summonEnemy()
        boss.summonTimer = 10
    end
end