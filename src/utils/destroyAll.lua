function destroyAll()
    clearColliderTable(walls)
    clearColliderTable(transitions)


    for i=#world.enemies, 1, -1 do
        if world.enemies[i] ~= nil then
            local enemyData = world.enemies[i]:getObject()
            if enemyData then 
                enemyData.collider:destroy()
            end
        end
    end
    clearTable(world.enemies)
    clearTable(world.coins)
    clearTable(world.food)
    clearTable(world.NPCs)
    clearTable(world.sommelier)

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