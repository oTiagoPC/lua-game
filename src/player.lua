player = world:newBSGRectangleCollider(400, 250, 55, 90, 10)
player.x = 0
player.y = 0
player.speed = 300
player.walking = false
player.dashCooldown = 2 -- Tempo de cooldown em segundos
player.lastDashTime = 0 -- Tempo do último dash

--player.setCollisionClass('Player')
player:setFixedRotation(true)
player:setLinearDamping(12)

player.spritesheet = love.graphics.newImage('sprites/playerSheet.png')
player.grid = anim8.newGrid(12, 18, player.spritesheet:getWidth(), player.spritesheet:getHeight())

player.animations = {}
player.animations.right = anim8.newAnimation(player.grid('1-4', 1), 0.2)
player.animations.left = anim8.newAnimation(player.grid('1-4', 2), 0.2)
player.animations.down = anim8.newAnimation(player.grid('1-4', 3), 0.2)
player.animations.up = anim8.newAnimation(player.grid('1-4', 4), 0.2)

player.anim = player.animations.down

function player:update(dt)
    local vectorX, vectorY = 0, 0

    if love.keyboard.isDown('d', 'right') then
        vectorX = 1
        player.anim = player.animations.right
    elseif love.keyboard.isDown('a', 'left') then
        vectorX = -1
        player.anim = player.animations.left
    end

    if love.keyboard.isDown('s', 'down') then
        vectorY = 1
        player.anim = player.animations.down
    elseif love.keyboard.isDown('w', 'up') then
        vectorY = -1
        player.anim = player.animations.up
    end

    local vec = vector(vectorX, vectorY):normalized() * player.speed
    if vec.x ~= 0 or vec.y ~= 0 then
        player:setLinearVelocity(vec.x, vec.y)
    end
    
    if vectorX == 0 and vectorY == 0 then
        player.walking = false
        player.anim:gotoFrame(2)
    else
        player.walking = true
    end
    
    if player.walking then
        player.anim:update(dt)
    end

    player.x = player:getX()
    player.y = player:getY()

    -- Atualiza o cooldown do dash
    if not player:canDash() then
        -- Ainda está em cooldown, adicionar som ou algo do tipo
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