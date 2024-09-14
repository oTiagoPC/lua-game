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

    -- Sets size
    windowHeight = love.graphics.getHeight()
    scale = (7.3 / 1200) * windowHeight

    -- Require all files
    require('src/startup/require')
    requireAll()
end