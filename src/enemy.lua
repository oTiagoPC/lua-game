function createEnemy(x, y)
    local enemy = {}
    enemy.collider = world:newBSGRectangleCollider(x, y, 12, 12, 3)
    enemy.x = x
    enemy.y = y
    enemy.speed = player.speed * 0.5
    enemy.health = 5
    enemy.damage = 1
    enemy.walking = false
    enemy.avoidanceTimer = 0
    enemy.avoidanceDirection = {x = 0, y = 0}
    enemy.atackRange = 120
    enemy.stuckTimer = 0
    enemy.lastPosition = {x = x, y = y}

    enemy.collider:setCollisionClass('Enemy')
    enemy.collider:setFixedRotation(true)
    enemy.collider:setLinearDamping(12)

    enemy.grid = anim8.newGrid(19, 21, sprites.enemySheet:getWidth(), sprites.enemySheet:getHeight())

    enemy.animations = {
        downRight = anim8.newAnimation(enemy.grid('1-2', 1), 0.2),
        downLeft = anim8.newAnimation(enemy.grid('1-2', 1), 0.2),
        upRight = anim8.newAnimation(enemy.grid('1-2', 2), 0.2),
        upLeft = anim8.newAnimation(enemy.grid('1-2', 2), 0.2)
    }

    enemy.anim = enemy.animations.downRight

    function enemy:takeDamage(damage)
        enemy.health = enemy.health - damage
    end

    function enemy:getObject()
        return enemy
    end

    enemy.collider:setObject(enemy)

    function enemy:checkCollision()
        local colliders = world:queryRectangleArea(enemy.x - 20, enemy.y - 20, 40, 40, {'Wall'})
        
        if #colliders > 0 then
            local avoidX, avoidY = 0, 0
            for _, collider in ipairs(colliders) do
                local cx, cy = collider:getPosition()
                avoidX = avoidX + (enemy.x - cx)
                avoidY = avoidY + (enemy.y - cy)
            end
    
            local len = math.sqrt(avoidX^2 + avoidY^2)
            if len > 0 then
                local smoothFactor = 0.025
                enemy.avoidanceDirection.x = enemy.avoidanceDirection.x * (1 - smoothFactor) + (avoidX / len) * smoothFactor
                enemy.avoidanceDirection.y = enemy.avoidanceDirection.y * (1 - smoothFactor) + (avoidY / len) * smoothFactor
            end
    
            enemy.avoidanceTimer = 4.0
        elseif enemy.avoidanceTimer > 0 then
            enemy.avoidanceTimer = enemy.avoidanceTimer - 1 / 60
        else
            local resetFactor = 0.05
            enemy.avoidanceDirection.x = enemy.avoidanceDirection.x * (1 - resetFactor)
            enemy.avoidanceDirection.y = enemy.avoidanceDirection.y * (1 - resetFactor)
        end
    end
    
    function enemy:checkIfStuck(dt)
        local currentX, currentY = enemy.collider:getPosition()
        local distance = math.sqrt((currentX - enemy.lastPosition.x)^2 + (currentY - enemy.lastPosition.y)^2)
        
        if distance < 0.1 then -- Se o inimigo se moveu menos que 0.1 unidade
            enemy.stuckTimer = enemy.stuckTimer + dt
        else
            enemy.stuckTimer = 0
        end
        
        enemy.lastPosition.x = currentX
        enemy.lastPosition.y = currentY
        
        return enemy.stuckTimer > 1 -- Consideramos preso se não se mover por mais de 1 segundo
    end

    function enemy:update(dt)
        if enemy.health <= 0 then
            enemy:onDeath()
            return
        end

        enemy:checkCollision()

        local dx = player.x - enemy.x
        local dy = player.y - enemy.y
        local distance = math.sqrt(dx^2 + dy^2)

        if distance < enemy.atackRange then
            local moveX = dx / distance
            local moveY = dy / distance

            if enemy.avoidanceTimer > 0 then
                moveX = moveX + enemy.avoidanceDirection.x
                moveY = moveY + enemy.avoidanceDirection.y
                local len = math.sqrt(moveX^2 + moveY^2)
                if len > 0 then
                    moveX = moveX / len
                    moveY = moveY / len
                end
            end

            local speed = enemy.speed

            enemy.collider:setLinearVelocity(moveX * speed, moveY * speed)
            enemy.walking = true

            if moveX > 0 then
                enemy.anim = moveY > 0 and enemy.animations.downRight or enemy.animations.upRight
            else
                enemy.anim = moveY > 0 and enemy.animations.downLeft or enemy.animations.upLeft
            end
        else
            enemy.walking = false
            enemy.collider:setLinearVelocity(0, 0)
        end

        local isStuck = enemy:checkIfStuck(dt)
        
        if enemy.walking and not isStuck then
            enemy.anim:update(dt)
        else
            enemy.anim:gotoFrame(1)
        end

        enemy.x = enemy.collider:getX()
        enemy.y = enemy.collider:getY()
    end

    function enemy:onDeath()
        local dropChance = math.random(1, 10)

        local drop
        if dropChance > 6 then
            drop = createCoin(enemy.x, enemy.y)
            table.insert(world.coins, drop)
        else
            drop = createBurger(enemy.x, enemy.y)
            table.insert(world.food, drop)
        end

        enemy.collider:destroy()
        for i, e in ipairs(world.enemies) do
            if e == enemy then
                table.remove(world.enemies, i)
                break
            end
        end
    end

    return enemy
end

-- Criando novos inimigos
local enemy4 = createEnemy(100, 400)
table.insert(world.enemies, enemy4)