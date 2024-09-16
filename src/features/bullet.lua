function createBullet(playerX, playerY, dirX, dirY)
    local offset = 10
    local bulletX = playerX + dirX * offset
    local bulletY = playerY + dirY * offset

    local bullet = {
        x = bulletX,
        y = bulletY,
        width = 10,
        height = 2,
        speed = 100,
        damage = 1,
        direction = vector(dirX, dirY):normalized(),
        grid = anim8.newGrid(16, 16, sprites.bulletSheet:getWidth(), sprites.bulletSheet:getHeight()),
        animation = anim8.newAnimation(anim8.newGrid(16, 16, sprites.bulletSheet:getWidth(), sprites.bulletSheet:getHeight())('1-5', 1), 0.1),
        collider = world:newRectangleCollider(bulletX, bulletY, 10, 2)
    }

    bullet.collider:setCollisionClass('Bullet')
    bullet.collider:setObject(bullet)

    table.insert(player.bullets, bullet)

    function bullet:update(dt)
        if self.collider then
            self.x = self.x + self.direction.x * self.speed * dt
            self.y = self.y + self.direction.y * self.speed * dt
            self.collider:setPosition(self.x, self.y)
        end
        self.animation:update(dt)

        if self:isOffScreen() then
            self:destroy()
        end
    end

    function bullet:draw()
        love.graphics.push()
        love.graphics.translate(self.x, self.y)
        love.graphics.rotate(math.atan2(self.direction.y, self.direction.x))
        local scale = self.direction.x < 0 and -0.6 or 0.6
        self.animation:draw(sprites.bulletSheet, -self.width / 2, -self.height / 2, nil, scale, scale)
        love.graphics.pop()
    end

    function bullet:isOffScreen()
        return self.x + self.width / 2 < 0 or
               self.x - self.width / 2 > world.mapWidth or
               self.y + self.height / 2 < 0 or
               self.y - self.height / 2 > world.mapHeight
    end

    function bullet:destroy()
        if self.collider then
            self.collider:destroy()
            self.collider = nil
        end

        for i, b in ipairs(player.bullets) do
            if b == self then
                table.remove(player.bullets, i)
                break
            end
        end

    end

    function bullet:enter(collisionClass)
        return self.collider and self.collider:enter(collisionClass) or false
    end

    return bullet
end
