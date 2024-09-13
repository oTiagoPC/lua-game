function createBullet(x, y, dirX, dirY)
    local bullet = {}
    bullet.x = x
    bullet.y = y
    bullet.width = 10
    bullet.height = 2
    bullet.speed = 300
    bullet.damage = 1
    bullet.direction = vector(dirX, dirY):normalized()

    bullet.grid = anim8.newGrid(16, 16, sprites.bulletSheet:getWidth(), sprites.bulletSheet:getHeight())
    bullet.animation = anim8.newAnimation(bullet.grid('1-5', 1), 0.1)

    bullet.collider = world:newRectangleCollider(bullet.x, bullet.y, bullet.width, bullet.height)
    bullet.collider:setCollisionClass('Bullet')
    bullet.collider:setObject(bullet)

    function bullet:update(dt)
        bullet.x = bullet.x + bullet.direction.x * bullet.speed * dt
        bullet.y = bullet.y + bullet.direction.y * bullet.speed * dt
        
        if bullet.x ~= nil and bullet.y ~= nil then
            bullet.collider:setPosition(bullet.x, bullet.y)
        end

        bullet.animation:update(dt)

        -- Destroi o projétil se ele sair da tela
        if bullet:isOffScreen() then
            bullet:destroy()
        end
    end

    function bullet:draw()
        love.graphics.push()
        love.graphics.translate(bullet.x, bullet.y)
        love.graphics.rotate(math.atan2(bullet.direction.y, bullet.direction.x))

        local scaleX = bullet.direction.x < 0 and -0.6 or 0.6
        local scaleY = bullet.direction.x < 0 and -0.6 or 0.6

        bullet.animation:draw(sprites.bulletSheet, -bullet.width / 2, -bullet.height / 2, nil, scaleX, scaleY)
        love.graphics.pop()
    end

    function bullet:isOffScreen()
        return bullet.x < 0 or bullet.x > world.mapWidth or
               bullet.y < 0 or bullet.y > world.mapHeight
    end

    function bullet:destroy()
        bullet.collider:destroy()
        for i, b in ipairs(player.bullets) do
            if b == bullet then
                table.remove(player.bullets, i)
                break
            end
        end
    end

    function bullet:enter(collisionClass)
        return bullet.collider:enter(collisionClass)
    end

    return bullet
end
