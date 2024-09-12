map = {}
map.mudou = false

function map:loadMap()
    gameMap = sti(world.mapaAtual)

    walls = {}

    if gameMap.layers['walls'] then
        for i, obj in pairs(gameMap.layers['walls'].objects) do
            local wall = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
            wall:setType('static')
            wall:setCollisionClass('Wall')
            table.insert(walls, wall)
        end
    end
    map.mudou = false
end

function map:update(dt)
    for i, obj in pairs(walls) do 
        obj:destroy()
    end
    map:loadMap()
end