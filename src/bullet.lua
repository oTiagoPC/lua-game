local Bullet = {}
Bullet.__index = Bullet

function Bullet.new(x, y, dirX, dirY)
    local self = setmetatable({}, Bullet)
    self.x = x
    self.y = y
    self.width = 10
    self.height = 2
    self.speed = 500
    self.direction = vector(dirX, dirY):normalized()
    self.damage = 1

    self.collider = world:newRectangleCollider(self.x, self.y, self.width, self.height)
    self.collider:setCollisionClass('Bullet')
    self.collider:setObject(self)
    return self
end

function Bullet:update(dt)
    self.x = self.x + self.direction.x * self.speed * dt
    self.y = self.y + self.direction.y * self.speed * dt
    
    self.collider:setPosition(self.x, self.y)
end

function Bullet:draw()
    love.graphics.setColor(0, 0, 0)
    love.graphics.push()
    love.graphics.translate(self.x, self.y)
    love.graphics.rotate(math.atan2(self.direction.y, self.direction.x))
    love.graphics.rectangle("fill", -self.width/2, -self.height/2, self.width, self.height)
    love.graphics.pop()
    love.graphics.setColor(1, 1, 1)
end

function Bullet:isOffScreen()
    return self.x < 0 or self.x > love.graphics.getWidth() or
           self.y < 0 or self.y > love.graphics.getHeight()
end

function Bullet:destroy()
    self.collider:destroy()
end

function Bullet:enter(collisionClass)
    return self.collider:enter(collisionClass)
end

return Bullet
