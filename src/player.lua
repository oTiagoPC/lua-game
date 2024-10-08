player = world:newBSGRectangleCollider(326, 154, 12, 12, 3)
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
player.animations.downRight = anim8.newAnimation(player.grid('1-2', 1), 0.18)
player.animations.downLeft = anim8.newAnimation(player.grid('1-2', 1), 0.18)
player.animations.upRight = anim8.newAnimation(player.grid('1-2', 2), 0.18)
player.animations.upLeft = anim8.newAnimation(player.grid('1-2', 2), 0.18)

player.anim = player.animations.downLeft

function player:update(dt)
    player:setLinearDamping(12)
    local dirX, dirY = 0, 0

    if player.health <= 0 then 
        if loadedMap == "c3Map" then
            player:setPosition(318, 160)
        elseif loadedMap == "pavMap" then
            player:setPosition(516, 278)
        elseif loadedMap == "biblioMap" then
            player:setPosition(606, 483)
        end
        love.timer.sleep(1)
        player.health = player.maxHealth
    end

    if dialogPosition == 7 and #world.enemies == 0 then
        id = 'roteiro.biblio.dialogo3'
        previousDialog = 'roteiro.biblio.dialogo3'
        world.dialogoAtual = roteiro.biblio.dialogo3
        playDialog(id)
    end

    if player:enter('Enemy') then
        local enemyInstance = player:getEnterCollisionData('Enemy').collider:getObject()
        player.health = player.health - 1
        knockback("player", enemyInstance)
    end

    if player:enter('Boss') then
        local enemyInstance = player:getEnterCollisionData('Boss').collider:getObject()
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

            if bullet:enter('Boss') then
                local collisionData = bullet.collider:getEnterCollisionData('Boss')
                if collisionData then
                    local bossInstance = collisionData.collider:getObject()
                    if bossInstance then
                        bossInstance:takeDamage(bullet.damage)
                        bullet:destroy()
                        table.remove(self.bullets, i)
                    end
                end
            end

            if bullet:enter('Wall') then
                local collisionData = bullet.collider:getEnterCollisionData('Wall')
                if collisionData then
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
    
    player:checkTransition()
    player:checkDialog()

    if love.mouse.isDown(1) and love.timer.getTime() - player.lastShootTime >= player.shootCooldown then
        player:shoot()
    end

end

function player:draw()
    player.anim:draw(sprites.playerSheet, player.x, player.y - 2, nil, player.dirX, 1, 11, 10.5)
end

function player:checkTransition()
    if player:enter('Transitions') then
        if #world.enemies == 0 then
            local data = player:getEnterCollisionData('Transitions')
            enterTransition(data.collider.id, data.collider.destX, data.collider.destY)
        end
    end
end

function player:checkDialog()
    if player:enter('Dialogues') then
        local data = player:getEnterCollisionData('Dialogues')
        playDialog(data.collider.id)
    end
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
    local mouseX, mouseY = cam:mousePosition()
    local mousePos = vector(mouseX, mouseY)

    local playerPos = vector(player.x, player.y)
    local direction = (mousePos - playerPos):normalized()

    local bullet = createBullet(player.x, player.y, direction.x, direction.y)
    table.insert(player.bullets, bullet)
    player.lastShootTime = love.timer.getTime()
end

function player:heal()
    if player.health < player.maxHealth and player.healing > 0 then
        player.health = player.health + 1
        player.healing = player.healing - 1
    end
end