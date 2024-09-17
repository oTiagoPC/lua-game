function createBullet(playerX, playerY, dirX, dirY)
    local bullet = {}
    
    -- Variáveis de controle para o desenho e collider
    bullet.x = playerX + dirX * 10
    bullet.y = playerY + dirY * 10
    bullet.width = 10
    bullet.height = 10

    bullet.speed = 100
    bullet.damage = 1
    bullet.direction = vector(dirX, dirY):normalized()

    bullet.grid = anim8.newGrid(16, 16, sprites.bulletSheet:getWidth(), sprites.bulletSheet:getHeight())
    bullet.animation = anim8.newAnimation(bullet.grid('1-5', 1), 0.1)

    -- Cria o collider centralizado na posição da bala
    bullet.collider = world:newRectangleCollider(
        bullet.x - bullet.width / 2,
        bullet.y - bullet.height / 2,
        bullet.width,
        bullet.height
    )
    bullet.collider:setCollisionClass('Bullet')
    bullet.collider:setObject(bullet)

    if bookCollected then
        bullet.damage = 5
        bullet.grid = anim8.newGrid(16, 16, sprites.upgradedBulletSheet:getWidth(), sprites.upgradedBulletSheet:getHeight())
        bullet.animation = anim8.newAnimation(bullet.grid('1-5', 1), 0.1)
    end

    table.insert(player.bullets, bullet)

    function bullet:update(dt)
        if bullet.collider then
            -- Atualiza a posição da bala
            bullet.x = bullet.x + bullet.direction.x * bullet.speed * dt
            bullet.y = bullet.y + bullet.direction.y * bullet.speed * dt
            
            -- Atualiza a posição do collider para coincidir com a bala
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
        local scale = 0.6
        bullet.animation:draw(sprites.bulletSheet, -bullet.width / 2, -bullet.height / 2, nil, scale, scale)
        if bookCollected then
            bullet.animation:draw(sprites.upgradedBulletSheet, -bullet.width / 2, -bullet.height / 2, nil, scale, scale)
        end
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