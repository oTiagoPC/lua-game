local Bullet = require('src.bullet')
player = world:newBSGRectangleCollider(234, 184, 12, 12, 3)
player.x = 0
player.y = 0
player.dirX = 1
player.dirY = 1
player.speed = 90
player.health = 5
player.walking = false
player.dashCooldown = 2 -- Tempo de cooldown em segundos
player.lastDashTime = 0 -- Tempo do último dash

player.bullets = {}
player.shootCooldown = 0.5  -- segundos
player.lastShootTime = 0

player:setCollisionClass('Player')
player:setFixedRotation(true)
player:setLinearDamping(12)

player.spritesheet = love.graphics.newImage('sprites/charSheet.png')
player.grid = anim8.newGrid(19, 21, player.spritesheet:getWidth(), player.spritesheet:getHeight())

player.animations = {}
player.animations.downRight = anim8.newAnimation(player.grid('1-2', 1), 0.2)
player.animations.downLeft = anim8.newAnimation(player.grid('1-2', 1), 0.2)
player.animations.upRight = anim8.newAnimation(player.grid('1-2', 2), 0.2)
player.animations.upLeft = anim8.newAnimation(player.grid('1-2', 2), 0.2)

player.anim = player.animations.downRight

function player:update(dt)
    player:setLinearDamping(12)

    local dirX, dirY = 0, 0

    if enemy then
        if player:enter('Enemy') then
            player.health = player.health - 1
            knockback("player")
        end
    end

    if #self.bullets > 0 then
        for i = #self.bullets, 1, -1 do
            local bullet = self.bullets[i]
            bullet:update(dt)

            -- Verifica colisão com inimigos
            local enemyColliders = world:queryCircleArea(bullet.x, bullet.y, bullet.width / 2, {'Enemy'})
            local mapColliders = world:queryCircleArea(bullet.x, bullet.y, bullet.width / 2, {'Wall'})
            
            if #enemyColliders + #mapColliders > 0 then table.remove(self.bullets, i)
            elseif bullet:isOffScreen() then table.remove(self.bullets, i) end

            for _, enemyCollider in ipairs(enemyColliders) do
                local enemy = enemyCollider:getObject()
                enemy:takeDamage(bullet.damage)
                table.remove(self.bullets, i)
            end
        end
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

    -- atira por clique esquerdo do mouse tambem
    if love.mouse.isDown(1) and love.timer.getTime() - player.lastShootTime >= player.shootCooldown then
        player:shoot()
    end

end

function player:dash()
    if not player:canDash() then
        return -- Ainda está em cooldown
    end

    local dirX, dirY = 0, 0

    if love.keyboard.isDown('d', 'right') then dirX = 1
    elseif love.keyboard.isDown('a', 'left') then dirX = -1 end

    if love.keyboard.isDown('s', 'down') then dirY = 1
    elseif love.keyboard.isDown('w', 'up') then dirY = -1 end

    if dirX == 0 and dirY == 0 then return end

    local dashForce = 40000
    local dirVec = vector(dirX, dirY):normalized() * dashForce
    player:setLinearVelocity(dirVec.x, dirVec.y)
    
    player.lastDashTime = love.timer.getTime()
end

function player:canDash()
    return love.timer.getTime() - player.lastDashTime >= player.dashCooldown
end

function knockback(obj)
    local playerPosition = vector(player.x, player.y)
    local enemyPosition = vector(enemy.x, enemy.y)
    local knockbackX = 0 
    local knockbackY = 0 
    local knockbackValue = 20 

    if obj == "player" then
        knockbackX = playerPosition.x - enemyPosition.x 
        knockbackY = playerPosition.y - enemyPosition.y 
        local knockbackVec = vector(knockbackX, knockbackY) * knockbackValue
        player:setLinearVelocity(knockbackVec.x, knockbackVec.y) 
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
    local bullet = Bullet.new(player.x, player.y, direction.x, direction.y)
    table.insert(player.bullets, bullet)
    player.lastShootTime = love.timer.getTime()
end

