dialogues = {}
dialogPosition = 0

local previousDialog = nil

function spawnDialog(x, y, width, height, id, requiredDialog)
    if previousDialog == requiredDialog then
        local dialog = world:newRectangleCollider(x, y, width, height)
        dialog:setType('static')
        dialog:setCollisionClass('Dialogues')

        dialog.id = id

        table.insert(dialogues, dialog)
    end
end

function playDialog(id)
    if id == 'roteiro.c3.dialogo1' then
        npcGoTo(vagner, 190, 86)
        world.dialogoAtual = roteiro.c3.dialogo1
    elseif id == 'roteiro.c3.dialogo2' then
        player.healing = player.healing + 1
        world.dialogoAtual = roteiro.c3.dialogo2
    elseif id == 'roteiro.pav.dialogo1' then
        world.dialogoAtual = roteiro.pav.dialogo1
    elseif id == 'roteiro.pav.dialogo2' then
        vagner = createNpc(508, 306)
        table.insert(world.NPCs, vagner)
        npcGoTo(vagner, 497, 251)
        npcGoTo(vagner, 390, 226)
        world.dialogoAtual = roteiro.pav.dialogo2
    elseif id == 'roteiro.pav.dialogo3' then
        npcGoTo(vagner, 388, 248)
        npcGoTo(vagner, 216, 238)
        world.dialogoAtual = roteiro.pav.dialogo3
    elseif id == 'roteiro.biblio.dialogo1' then
        world.dialogoAtual = roteiro.biblio.dialogo1
    elseif id == 'roteiro.biblio.dialogo2' then
        world.dialogoAtual = roteiro.biblio.dialogo2
    elseif id == 'roteiro.c3Parte2.dialogo1' then
        world.dialogoAtual = roteiro.c3Parte2.dialogo1
    elseif id == 'roteiro.c3Parte2.dialogo2' then
        world.dialogoAtual = roteiro.c3Parte2.dialogo2
    elseif id == 'roteiro.c3Parte2.dialogo3' then
        world.dialogoAtual = roteiro.c3Parte2.dialogo3
    end

    dialog:start()
    
    dialogPosition = dialogPosition + 1
    
    for i, dialog in ipairs(dialogues) do
        if dialog.id == id then
            dialog:destroy()
            table.remove(dialogues, i)
            previousDialog = id
            break
        end
    end

    if gameMap.layers['dialogues'] then
        for i, obj in pairs(gameMap.layers['dialogues'].objects) do
            spawnDialog(obj.x, obj.y, obj.width, obj.height, obj.name, obj.properties.req)
        end
    end
    
end