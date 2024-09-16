function destroyAll()
    clearColliderTable(walls)
    clearColliderTable(transitions)
    clearColliderTable(dialogues)
    
    clearCollider(world.coins)
    clearCollider(world.food)
    clearCollider(world.NPCs)
    clearCollider(world.enemies)

end

function clearCollider(collider)
    for i=#collider, 1, -1 do
        if collider[i] ~= nil then
            local data = collider[i]:getObject()
            if data then
                data.collider:destroy()
            end
            table.remove(collider, i)
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