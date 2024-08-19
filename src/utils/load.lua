function loadAll()
    -- Make pixels scale
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- Import libraries
    anim8 = require('libraries/anim8')
    sti = require('libraries/sti')

    -- Initializes world
    windfield = require('libraries/windfield')
    world = windfield.newWorld(0, 0)

    -- Other requirements
    require('src/utils/update')
    require('src/utils/draw')
    require('src/map')
    require('src/cam')
    require('src/player')

    -- Functions
    loadMap()
end