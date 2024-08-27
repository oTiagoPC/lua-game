enemy = world:newBSGRectangleCollider(400, 250, 55, 90, 10) -- X, Y, Width, Height, Border-Radius
enemy.x = 0
enemy.y = 0
enemy.speed = player.speed * 0.5

enemy:setCollisionClass('Enemy')
enemy:setFixedRotation(true)
enemy:setLinearDamping(12)


enemy.spritesheet = love.graphics.newImage('sprites/enemySheet.png') -- Alterar para o spritesheet do inimigo
enemy.grid = anim8.newGrid(12, 18, enemy.spritesheet:getWidth(), enemy.spritesheet:getHeight())

enemy.animations = {}
enemy.animations.right = anim8.newAnimation(enemy.grid('1-4', 1), 0.2)
enemy.animations.left = anim8.newAnimation(enemy.grid('1-4', 2), 0.2)
enemy.animations.down = anim8.newAnimation(enemy.grid('1-4', 3), 0.2)
enemy.animations.up = anim8.newAnimation(enemy.grid('1-4', 4), 0.2)

enemy.anim = enemy.animations.down

function enemy:update(dt)
    playerPosition = vector(player.x, player.y)
    enemyPosition = vector(enemy.x, enemy.y)

    if playerPosition.x > enemyPosition.x then
        enemy.anim = enemy.animations.right
    elseif playerPosition.x < enemyPosition.x then
        enemy.anim = enemy.animations.left
    end

    if playerPosition.y > enemyPosition.y then
        enemy.anim = enemy.animations.down
    elseif playerPosition.y < enemyPosition.y then
        enemy.anim = enemy.animations.up
    end

    local vec = (playerPosition - enemyPosition):normalized() * enemy.speed
    if vec.x ~= 0 or vec.y ~= 0 then
        enemy:setLinearVelocity(vec.x, vec.y)
    end

    if vec.x == 0 and vec.y == 0 then
        enemy.anim:gotoFrame(2)
    end

    enemy.anim:update(dt)

    enemy.x = enemy:getX()
    enemy.y = enemy:getY()
end