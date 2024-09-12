map = {}
map.renderizedMap = "maps/c3Map.lua"
world.currentMap = "maps/c3Map.lua"


function map:loadMap()
    gameMap = sti(map.renderizedMap)

    walls = {}

    if gameMap.layers['walls'] then
        for i, obj in pairs(gameMap.layers['walls'].objects) do
            local wall = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
            wall:setType('static')
            wall:setCollisionClass('Wall')
            table.insert(walls, wall)
        end
    end
end

function map:update(dt)
    if map.renderizedMap ~= world.currentMap then
        map.renderizedMap = world.currentMap
        for i, wall in ipairs(walls) do
            wall:destroy()
        end
        map:loadMap()
    end
end