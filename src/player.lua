player = world:newBSGRectangleCollider(326, 134, 12, 12, 3)
player.x = 0
player.y = 0
player.dirX = 1
player.dirY = 1
player.speed = 90
player.health = 5
player.maxHealth = 5
player.coins = 0
player.healing = 0
player.walking = false
player.dashForce = 4000
player.dashCooldown = 2 -- Tempo de cooldown em segundos
player.lastDashTime = 0 -- Tempo do último dash

player.bullets = {}
player.shootCooldown = 0.5 -- segundos
player.lastShootTime = 0

player:setCollisionClass('Player')
player:setFixedRotation(true)
player:setLinearDamping(12)

player.grid = anim8.newGrid(19, 21, sprites.playerSheet:getWidth(), sprites.playerSheet:getHeight())

player.animations = {}
player.animations.downRight = anim8.newAnimation(player.grid('1-2', 1), 0.2)
player.animations.downLeft = anim8.newAnimation(player.grid('1-2', 1), 0.2)
player.animations.upRight = anim8.newAnimation(player.grid('1-2', 2), 0.2)
player.animations.upLeft = anim8.newAnimation(player.grid('1-2', 2), 0.2)

player.anim = player.animations.downLeft

function player:update(dt)
    player:setLinearDamping(12)
    local dirX, dirY = 0, 0

    -- Door verifications
    if player:enter('C3InsideDoor') then
        world.currentMap = c3.goingMapPath
        player:spawn(c3.spawnPosition.x, c3.spawnPosition.y)
    end

    if player:enter('Enemy') then
        local enemyInstance = player:getEnterCollisionData('Enemy').collider:getObject()
        player.health = player.health - 1
        knockback("player", enemyInstance)
    end

    if player:enter("Coin") then
        local collisionData = player:getEnterCollisionData("Coin")
        if collisionData then -- Verificar se o dado de colisão existe
            local coin = collisionData.collider:getObject()
            if coin then
                player.coins = player.coins + 1
                if coin ~= nil then
                    coin:collect()
                end
            end
        end
    end

    if player:enter("Food") then
        local collisionData = player:getEnterCollisionData("Food")
        if collisionData then
            local food = collisionData.collider:getObject()
            if food then
                player.healing = player.healing + 1
                if food ~= nil then
                    food:collect()
                end
            end
        end
    end

    local bulletsToRemove = {}

    if #self.bullets > 0 then
        for i, bullet in ipairs(self.bullets) do
            if bullet:enter('Enemy') then
                local collisionData = bullet.collider:getEnterCollisionData('Enemy')
                if collisionData then
                    local enemyInstance = collisionData.collider:getObject()
                    if enemyInstance then
                        enemyInstance:takeDamage(bullet.damage)
                        knockback("enemy", enemyInstance)
                        bullet:destroy()
                        table.remove(self.bullets, i)
                    end
                end
            end

            if bullet:enter('Wall') then
                local collisionData = bullet.collider:getEnterCollisionData('Wall')
                if collisionData then
                    -- apenas removo a bala, mas poderia fazer algo mais interessante
                    bullet:destroy()
                    table.remove(self.bullets, i)
                end
            end
        end
    end

    for i = #bulletsToRemove, 1, -1 do
        table.remove(self.bullets, bulletsToRemove[i])
    end

    if love.keyboard.isDown('d', 'right') then
        dirX = 1
        player.dirX = 1
    end

    if love.keyboard.isDown('a', 'left') then
        dirX = -1
        player.dirX = -1
    end

    if love.keyboard.isDown('s', 'down') then
        dirY = 1
        player.dirY = 1
    end

    if love.keyboard.isDown('w', 'up') then
        dirY = -1
        player.dirY = -1
    end

    if dirY == 0 and dirX ~= 0 then
        player.dirY = 1
    end

    if player.walking then
        if player.dirX == 1 then
            if player.dirY == 1 then
                player.anim = player.animations.downRight
            else
                player.anim = player.animations.upRight
            end
        else
            if player.dirY == 1 then
                player.anim = player.animations.downLeft
            else
                player.anim = player.animations.upLeft
            end
        end
    end

    local vec = vector(dirX, dirY):normalized() * player.speed
    if vec.x ~= 0 or vec.y ~= 0 then
        player:setLinearVelocity(vec.x, vec.y)
    end

    if dirX == 0 and dirY == 0 then
        player.walking = false
        player.anim:gotoFrame(1)
    else
        player.walking = true
    end

    player.anim:update(dt)

    player.x = player:getX()
    player.y = player:getY()

    -- Atualiza o cooldown do dash
    if not player:canDash() then
        -- Ainda está em cooldown, adicionar som ou algo do tipo
    end

    if love.mouse.isDown(1) and love.timer.getTime() - player.lastShootTime >= player.shootCooldown then
        player:shoot()
        love.graphics.printf("Posiçao do mouse: " .. love.mouse.getX() .. " " .. love.mouse.getY(), 0, 0, 800, 'left')
    end

end

function player:draw()
    player.anim:draw(sprites.playerSheet, player.x, player.y - 2, nil, player.dirX, 1, 11, 10.5)
end

function player:dash()
    if not player:canDash() then
        return -- Ainda está em cooldown
    end

    local dirX, dirY = 0, 0

    if love.keyboard.isDown('d', 'right') then
        dirX = 1
    elseif love.keyboard.isDown('a', 'left') then
        dirX = -1
    end

    if love.keyboard.isDown('s', 'down') then
        dirY = 1
    elseif love.keyboard.isDown('w', 'up') then
        dirY = -1
    end

    if dirX == 0 and dirY == 0 then
        return
    end

    local dirVec = vector(dirX, dirY):normalized() * player.dashForce
    player:setLinearVelocity(dirVec.x, dirVec.y)

    player.lastDashTime = love.timer.getTime()
end

function player:canDash()
    return love.timer.getTime() - player.lastDashTime >= player.dashCooldown
end

function knockback(obj, enemyInstance)
    local playerPosition = vector(player.x, player.y)
    local enemyPosition = vector(enemyInstance.x, enemyInstance.y)
    local knockbackX = 0
    local knockbackY = 0
    local knockbackValue = 20

    if obj == "player" then
        knockbackX = playerPosition.x - enemyPosition.x
        knockbackY = playerPosition.y - enemyPosition.y
        local knockbackVec = vector(knockbackX, knockbackY) * knockbackValue
        player:setLinearVelocity(knockbackVec.x, knockbackVec.y)
    end

    if obj == "enemy" then
        knockbackX = enemyPosition.x - playerPosition.x
        knockbackY = enemyPosition.y - playerPosition.y
        local knockbackVec = vector(knockbackX, knockbackY) * knockbackValue
        enemyInstance.collider:setLinearVelocity(knockbackVec.x, knockbackVec.y)
    end

end

function player:shoot()
    -- pega a posição do mouse em coordenadas do mundo
    local mouseX, mouseY = cam:mousePosition()
    local mousePos = vector(mouseX, mouseY)

    -- pega a posição do jogador em coordenadas do mundo
    local playerPos = vector(player.x, player.y)
    local direction = (mousePos - playerPos):normalized()

    -- cria e adiciona uma nova bala à lista de balas do jogador
    local bullet = createBullet(player.x, player.y, direction.x, direction.y)
    table.insert(player.bullets, bullet)
    player.lastShootTime = love.timer.getTime()
end

function player:spawn(x, y)
    player.x = x
    player.y = y
    player:setPosition(x, y)
    -- Transição de tela
end

function player:heal()
    if player.health < player.maxHealth and player.healing > 0 then
        player.health = player.health + 1
        player.healing = player.healing - 1
    end
end
