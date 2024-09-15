function destroyAll()
    clearColliderTable(walls)
    clearColliderTable(transitions)
    clearColliderTable(dialogues)

    clearTable(world.coins)
    clearTable(world.food)
    clearTable(world.NPCs)
    
    for i=#world.enemies, 1, -1 do
        if world.enemies[i] ~= nil then
            local enemyData = world.enemies[i]:getObject()
            if enemyData then 
                enemyData.collider:destroy()
            end
            table.remove(world.enemies, i)
        end
    end
end

function clearColliderTable(tableList)
    local i = #tableList
    while i > 0 do
        if tableList[i] ~= 0 then
            tableList[i]:destroy()
        end
        table.remove(tableList, i)
        i = i - 1
    end
end

function clearTable(tableList)
    local i = #tableList
    while i > 0 do 
        table.remove(tableList, i)
        i = i -1
    end
end