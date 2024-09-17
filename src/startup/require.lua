function requireAll()

    require('src/startup/collisionClasses')
    createCollisionClasses()
    
    require('src/startup/script')
    require('src/startup/load')
    require('src/startup/resources')

    require('src/utils/cam')
    require('src/utils/destroyAll')
    require('src/utils/functions')

    require('src/levels/dialogues')
    require('src/levels/map')
    require('src/levels/transition')
    require('src/levels/wall')

    require('src/draw')
    require('src/player')
    require('src/update')
    require('src/world')

    require('src/entities/enemy')
    require('src/entities/npc')
    require('src/entities/boss')

    require('src/features/bullet')
    require('src/features/coin')
    require('src/features/healing')
    require('src/features/book')

    require('src/ui/hud')
    require('src/ui/menu')
    require('src/ui/credits')
    require('src/ui/playText')

end