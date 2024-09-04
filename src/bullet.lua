Bullet = {}
Bullet.__index = Bullet -- descobrir que porra eh essa

local bulletSprite = love.graphics.newImage('sprites/bullet.png')

function Bullet.new(x, y, dirX, dirY)
    local self = setmetatable({}, Bullet)
    Bullet.x = x
    Bullet.y = y
    Bullet.width = 10
    Bullet.height = 2
    Bullet.speed = 500
    Bullet.direction = vector(dirX, dirY):normalized()
    Bullet.damage = 1

    Bullet.collider = world:newRectangleCollider(Bullet.x, Bullet.y, Bullet.width, Bullet.height)
    Bullet.collider:setCollisionClass('Bullet')
    Bullet.collider:setObject(Bullet)
    return Bullet
end

function Bullet:update(dt)
    Bullet.x = Bullet.x + Bullet.direction.x * Bullet.speed * dt
    Bullet.y = Bullet.y + Bullet.direction.y * Bullet.speed * dt
    
    Bullet.collider:setPosition(Bullet.x, Bullet.y)
end

function Bullet:draw()
    for _, bullet in ipairs(player.bullets) do
        love.graphics.push()
        love.graphics.translate(Bullet.x, Bullet.y)
        love.graphics.rotate(math.atan2(Bullet.direction.y, Bullet.direction.x))
        love.graphics.draw(bulletSprite, -Bullet.width/2, -Bullet.height/2, nil, 0.4)
        love.graphics.pop()
    end
end

function Bullet:isOffScreen()
    return Bullet.x < 0 or Bullet.x > love.graphics.getWidth() or
           Bullet.y < 0 or Bullet.y > love.graphics.getHeight()
end

function Bullet:destroy()
    Bullet.collider:destroy()
end

function Bullet:enter(collisionClass)
    return Bullet.collider:enter(collisionClass)
end

return Bullet
