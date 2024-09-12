function createEnemy(x, y)
    local enemy = {}
    enemy.collider = world:newBSGRectangleCollider(x, y, 12, 12, 3)
    enemy.x = x
    enemy.y = y
    enemy.originX = x
    enemy.originY = y
    enemy.speed = player.speed * 0.5
    enemy.patrollingSpeed = enemy.speed * 0.3  -- Nova velocidade para patrulha
    enemy.health = 5
    enemy.damage = 1
    enemy.walking = false
    enemy.avoidanceTimer = 0
    enemy.avoidanceDirection = {x = 0, y = 0}
    enemy.attackRange = 100
    enemy.stuckTimer = 0
    enemy.lastPosition = {x = x, y = y}
    enemy.directionChangeTimer = 0
    enemy.currentDirection = "downRight"
    
    -- Variáveis renomeadas para patrulha aleatória
    enemy.patrolTimer = 0
    enemy.patrolDirection = {x = 0, y = 0}
    enemy.patrolDuration = 0
    enemy.returningToOrigin = false

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
        
        if distance < 0.1 then
            enemy.stuckTimer = enemy.stuckTimer + dt
        else
            enemy.stuckTimer = 0
        end
        
        enemy.lastPosition.x = currentX
        enemy.lastPosition.y = currentY
        
        return enemy.stuckTimer > 1
    end

    function enemy:updateDirection(moveX, moveY)
        enemy.directionChangeTimer = enemy.directionChangeTimer - 1 / 60
        if enemy.directionChangeTimer <= 0 then
            local newDirection
            if moveX > 0 then
                newDirection = moveY > 0 and "downRight" or "upRight"
            else
                newDirection = moveY > 0 and "downLeft" or "upLeft"
            end
            
            if newDirection ~= enemy.currentDirection then
                enemy.currentDirection = newDirection
                enemy.anim = enemy.animations[enemy.currentDirection]
                enemy.directionChangeTimer = 0.5
            end
        end
    end

    function enemy:randomPatrol(dt)
        enemy.patrolTimer = enemy.patrolTimer - dt
        
        if enemy.patrolTimer <= 0 then
            if enemy.returningToOrigin then
                local dx = enemy.originX - enemy.x
                local dy = enemy.originY - enemy.y
                local distance = math.sqrt(dx^2 + dy^2)
                
                if distance < 5 then
                    enemy.returningToOrigin = false
                    enemy.patrolTimer = math.random(1, 3)
                else
                    enemy.patrolDirection.x = dx / distance
                    enemy.patrolDirection.y = dy / distance
                end
            else
                local angle = math.random() * 2 * math.pi
                enemy.patrolDirection.x = math.cos(angle)
                enemy.patrolDirection.y = math.sin(angle)
                enemy.patrolDuration = math.random(2, 4)
                enemy.patrolTimer = enemy.patrolDuration
            end
        end
        
        
        if not enemy.returningToOrigin and enemy.patrolTimer <= 0 then
            enemy.returningToOrigin = true
            enemy.patrolTimer = math.huge  -- Será resetado na próxima iteração
        end
        
        if enemy.collider:enter('Wall') then
            enemy.patrolTimer = 0
        end
        
        enemy.collider:setLinearVelocity(enemy.patrolDirection.x * enemy.patrollingSpeed, enemy.patrolDirection.y * enemy.patrollingSpeed)
        enemy:updateDirection(enemy.patrolDirection.x, enemy.patrolDirection.y)
        enemy.walking = true
    end

    function enemy:update(dt)
        if enemy.health <= 0 then
            enemy:onDeath()
            return
        end

        enemy:checkCollision()

        local dx = player.x - enemy.x
        local dy = player.y - enemy.y
        local distanceToPlayer = math.sqrt(dx^2 + dy^2)

        if distanceToPlayer < enemy.attackRange then
            local moveX = dx / distanceToPlayer
            local moveY = dy / distanceToPlayer

            if enemy.avoidanceTimer > 0 then
                moveX = moveX + enemy.avoidanceDirection.x
                moveY = moveY + enemy.avoidanceDirection.y
                local len = math.sqrt(moveX^2 + moveY^2)
                if len > 0 then
                    moveX = moveX / len
                    moveY = moveY / len
                end
            end

            enemy.collider:setLinearVelocity(moveX * enemy.speed, moveY * enemy.speed)
            enemy.walking = true
            enemy:updateDirection(moveX, moveY)
        else
            enemy:randomPatrol(dt)
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