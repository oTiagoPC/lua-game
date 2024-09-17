boss = {}

function boss:create(x, y)
    boss.x = x 
    boss.y = y 
    boss.health = 100
    boss.speed = player.speed * 0.8
    boss.isAlive = true

    boss.collider = world:newBSGRectangleCollider(x-20, y-25, 45, 55, 5)
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
    if boss.health <= 0 then
        boss.isAlive = false
        
    end
end

function boss:draw()
    boss.anim:draw(sprites.bossSheet, boss.x, boss.y-2, nil, 4, 4, 11, 10.5)
end 

function boss:update(dt)
    local bossX, bossY = boss.collider:getPosition()

    local directionX = player.x - bossX
    local directionY = player.y - bossY

    local distance = math.sqrt(directionX^2 + directionY^2)

    if directionX > 0 then 
        boss.anim = boss.animations.downRight
        if directionY > 0 then
            boss.anim = boss.animations.upLeft
        end
    else
        boss.anim = boss.animations.downLeft
        if directionY < 0 then 
            boss.anim = boss.animations.upRight
        end
    end

    if distance > 0 then
        directionX = directionX / distance
        directionY = directionY / distance
    end

    boss.anim:update(dt)

    boss.collider:setLinearVelocity(directionX * boss.speed, directionY * boss.speed)
    boss.x = bossX
    boss.y = bossY

end

boss:create(610,240)