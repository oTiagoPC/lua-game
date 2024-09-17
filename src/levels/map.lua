function loadMap(mapName)
    destroyAll()

    loadedMap = mapName
    gameMap = sti("maps/" .. mapName .. ".lua")

    if dialogPosition == 0  and loadedMap == 'c3Map' then
        vagner = createNpc(220, 273)
        table.insert(world.NPCs, vagner)
        npcGoTo(vagner, 220, 173)
        npcGoTo(vagner, 280, 173)
        table.insert(world.enemies, createEnemy(158, 440))
        table.insert(world.enemies, createEnemy(178, 519))
        table.insert(world.enemies, createEnemy(262, 478))
        table.insert(world.enemies, createEnemy(396, 302))
        table.insert(world.enemies, createEnemy(691, 283))
        table.insert(world.enemies, createEnemy(691, 198))
        table.insert(world.enemies, createEnemy(544, 403))
        table.insert(world.enemies, createEnemy(655, 447))
    end

    if dialogPosition == 2 and loadedMap == 'pavMap' then
        table.insert(world.enemies, createEnemy(368, 238))
        table.insert(world.enemies, createEnemy(562, 173))
        table.insert(world.enemies, createEnemy(500, 89))
        table.insert(world.enemies, createEnemy(274, 205))
        table.insert(world.enemies, createEnemy(214, 277))
        table.insert(world.enemies, createEnemy(113, 229))
    end

    if dialogPosition == 5 and loadedMap == 'biblioMap' then
        createUniqueBook(408, 288)
        table.insert(world.enemies, createEnemy(728, 272))
        table.insert(world.enemies, createEnemy(753, 178))
        table.insert(world.enemies, createEnemy(634, 178))
        table.insert(world.enemies, createEnemy(160, 184))
        table.insert(world.enemies, createEnemy(73, 223))
        table.insert(world.enemies, createEnemy(339, 289))
        table.insert(world.enemies, createEnemy(412, 158))
    end
    
    if gameMap.layers['walls'] then
        for i, obj in pairs(gameMap.layers['walls'].objects) do
            spawnWall(obj.x, obj.y, obj.width, obj.height)
        end
    end

    if gameMap.layers['transitions'] then
        for i, obj in pairs(gameMap.layers['transitions'].objects) do
            spawnTransition(obj.x, obj.y, obj.width, obj.height, obj.name, obj.properties.destX, obj.properties.destY)
        end
    end

    if gameMap.layers['dialogues'] then
        for i, obj in pairs(gameMap.layers['dialogues'].objects) do
            spawnDialog(obj.x, obj.y, obj.width, obj.height, obj.name, obj.properties.req)
        end
    end
end