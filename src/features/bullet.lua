function createBullet(playerX, playerY, dirX, dirY)
    local bullet = {}
    
    bullet.x = playerX + dirX * 10
    bullet.y = playerY + dirY * 10
    bullet.width = 10
    bullet.height = 2
    bullet.speed = 100
    bullet.damage = 1
    bullet.direction = vector(dirX, dirY):normalized()

    bullet.grid = anim8.newGrid(16, 16, sprites.bulletSheet:getWidth(), sprites.bulletSheet:getHeight())
    bullet.animation = anim8.newAnimation(bullet.grid('1-5', 1), 0.1)

    bullet.collider = world:newCircleCollider(bulletX, bulletY, 4)
    bullet.collider:setCollisionClass('Bullet')
    bullet.collider:setObject(bullet)

    table.insert(player.bullets, bullet)

    function bullet:update(dt)
        if bullet.collider then
            bullet.x = bullet.x + bullet.direction.x * bullet.speed * dt
            bullet.y = bullet.y + bullet.direction.y * bullet.speed * dt
            bullet.collider:setPosition(bullet.x, bullet.y)
        end
        bullet.animation:update(dt)

        if bullet:isOffScreen() then
            bullet:destroy()
        end
    end

    function bullet:draw()
        love.graphics.push()
        love.graphics.translate(bullet.x, bullet.y)
        love.graphics.rotate(math.atan2(bullet.direction.y, bullet.direction.x))
        local scale = bullet.direction.x < 0 and -0.6 or 0.6
        bullet.animation:draw(sprites.bulletSheet, -bullet.width / 2, -bullet.height / 2, nil, scale, scale)
        love.graphics.pop()
    end

    function bullet:isOffScreen()
        return bullet.x + bullet.width / 2 < 0 or
               bullet.x - bullet.width / 2 > world.mapWidth or
               bullet.y + bullet.height / 2 < 0 or
               bullet.y - bullet.height / 2 > world.mapHeight
    end

    function bullet:destroy()
        if bullet.collider then
            bullet.collider:destroy()
            bullet.collider = nil
        end

        for i, b in ipairs(player.bullets) do
            if b == bullet then
                table.remove(player.bullets, i)
                break
            end
        end

    end

    function bullet:enter(collisionClass)
        return bullet.collider and bullet.collider:enter(collisionClass) or false
    end

    return bullet
end
