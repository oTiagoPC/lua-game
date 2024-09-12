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
        self.health = self.health - damage
    end

    function enemy:getObject()
        return self
    end

    enemy.collider:setObject(enemy)

    function enemy:checkCollision()
        -- Aumentar o raio da área de verificação de colisão para suavizar reações
        local colliders = world:queryRectangleArea(self.x - 20, self.y - 20, 40, 40, {'Wall'})
        
        if #colliders > 0 then
            local avoidX, avoidY = 0, 0
            for _, collider in ipairs(colliders) do
                local cx, cy = collider:getPosition()
                avoidX = avoidX + (self.x - cx)
                avoidY = avoidY + (self.y - cy)
            end
    
            local len = math.sqrt(avoidX^2 + avoidY^2)
            if len > 0 then
                -- Suavizar a mudança de direção usando interpolação linear
                local smoothFactor = 0.025  -- Quanto menor, mais suave a mudança de direção
                self.avoidanceDirection.x = self.avoidanceDirection.x * (1 - smoothFactor) + (avoidX / len) * smoothFactor
                self.avoidanceDirection.y = self.avoidanceDirection.y * (1 - smoothFactor) + (avoidY / len) * smoothFactor
            end
    
            -- Prolongar o tempo de desvio para evitar mudanças bruscas
            self.avoidanceTimer = 4.0
        elseif self.avoidanceTimer > 0 then
            -- Diminuir o timer suavemente
            self.avoidanceTimer = self.avoidanceTimer - 1 / 60 -- Supondo 60 FPS
        else
            -- Resetar a direção de desvio lentamente
            local resetFactor = 0.05  -- Mais lento que a mudança de direção
            self.avoidanceDirection.x = self.avoidanceDirection.x * (1 - resetFactor)
            self.avoidanceDirection.y = self.avoidanceDirection.y * (1 - resetFactor)
        end
    end
    

    function enemy:update(dt)
        if self.health <= 0 then
            self:onDeath()
            return
        end

        self:checkCollision()

        local dx = player.x - self.x
        local dy = player.y - self.y
        local distance = math.sqrt(dx^2 + dy^2)

        if distance < enemy.atackRange then
            local moveX = dx / distance
            local moveY = dy / distance

            if self.avoidanceTimer > 0 then
                moveX = moveX + self.avoidanceDirection.x
                moveY = moveY + self.avoidanceDirection.y
                local len = math.sqrt(moveX^2 + moveY^2)
                if len > 0 then
                    moveX = moveX / len
                    moveY = moveY / len
                end
            end

            local speed = self.speed

            self.collider:setLinearVelocity(moveX * speed, moveY * speed)
            self.walking = true

            if moveX > 0 then
                self.anim = moveY > 0 and self.animations.downRight or self.animations.upRight
            else
                self.anim = moveY > 0 and self.animations.downLeft or self.animations.upLeft
            end
        else
            self.walking = false
            self.collider:setLinearVelocity(0, 0)
        end

        if self.walking then
            self.anim:update(dt)
        else
            self.anim:gotoFrame(1)
        end

        self.x = self.collider:getX()
        self.y = self.collider:getY()
    end

    function enemy:onDeath()
        local dropChance = math.random(1, 10)

        local drop
        if dropChance > 6 then
            drop = createCoin(self.x, self.y)
            table.insert(world.coins, drop)
        else
            drop = createBurger(self.x, self.y)
            table.insert(world.food, drop)
        end

        self.collider:destroy()
        for i, e in ipairs(world.enemies) do
            if e == self then
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