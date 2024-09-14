function loadMap(mapName)
    destroyAll()

    loadedMap = mapName
    gameMap = sti("maps/" .. mapName .. ".lua")

    walls = {}

    if gameMap.layers['walls'] then
        for i, obj in pairs(gameMap.layers['walls'].objects) do
            spawnWall(obj.x, obj.y, obj.width, obj.height)
        end
    end

    if loadedMap == "pavMap" then 
        sommelier:start()
        sommelier:create()
    end


    if gameMap.layers['transitions'] then
        for i, obj in pairs(gameMap.layers['transitions'].objects) do
            spawnTransition(obj.x, obj.y, obj.width, obj.height, obj.name, obj.properties.destX, obj.properties.destY)
        end
    end
end