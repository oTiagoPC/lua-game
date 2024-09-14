function requireAll()

    require('src/startup/collisionClasses')
    createCollisionClasses()
    
    require('src/startup/dialogs')
    require('src/startup/load')
    require('src/startup/resources')

    require('src/utils/cam')
    require('src/utils/destroyAll')
    require('src/utils/functions')

    require('src/map')
    require('src/draw')
    require('src/player')
    require('src/transition')
    require('src/update')
    require('src/wall')
    require('src/world')

    require('src/entities/enemy')
    require('src/entities/npc')
    require('src/entities/characters')

    require('src/features/bullet')
    require('src/features/coin')
    require('src/features/healing')

    require('src/ui/hud')
    require('src/ui/menu')
    require('src/ui/playText')
    
    require('src/utils/sounds')

end