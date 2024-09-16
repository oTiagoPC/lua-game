function loadMap(mapName)
    destroyAll()

    loadedMap = mapName
    gameMap = sti("maps/" .. mapName .. ".lua")

    if dialogPosition == 0  and loadedMap == 'c3Map' then
        table.insert(world.NPCs, vagner)
        npcGoTo(vagner, 220, 160)
        npcGoTo(vagner, 260, 160)
    end

    if loadedMap == 'c3Map' then
        table.insert(world.enemies, createEnemy(140, 460))
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