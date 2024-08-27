function loadAll()
    -- Make pixels scale
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- Import libraries
    vector = require('libraries/hump/vector')
    anim8 = require('libraries/anim8')
    sti = require('libraries/sti')

    -- Initializes world
    local windfield = require('libraries/windfield')
    world = windfield.newWorld(0, 0, false)
    world:addCollisionClass('Player')
    world:addCollisionClass('Enemy')
    -- Other requirements
    require('src/utils/update')
    require('src/utils/draw')
    require('src/map')
    require('src/cam')
    require('src/player')
    require('src/enemy')
    require('src/utils/collisionClasses')
    -- Functions
    loadMap()
    
end