walls = {}

function spawnWall(x, y, width, height)
    local wall = world:newRectangleCollider(x, y, width, height)
    wall:setType('static')
    wall:setCollisionClass('Wall')
    table.insert(walls, wall)
end