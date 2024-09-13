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

    -- Dialogues 
    require('src/utils/dialogos')
    require('src/playText')
    
    -- Other requirements
    require('src/utils/collisionClasses')
    createCollisionClasses()
    require('src/world')
    require('src/resources')
    require('src/player')
    require('src/bullet')
    require('src/utils/update')
    require('src/utils/draw')
    require('src/map')
    require('src/cam')
    require('src/enemy')
    require('src/hud')
    require('src/coin')
    require('src/healing')
    require('src/npc')
    require('src/utils/functions')
    require("src/c3Map")
    require("src/mainMap")
    require("src/biblioMap")
    require("src/pavMap")
    require("src/sommelier")
    require("src/menu")
    -- Functions
    map:loadMap()
end