dialogues = {}

function spawnDialog(x, y, width, height)
    local dialog = world:newRectangleCollider(x, y, width, height)
    dialog:setType('static')
    dialog:setCollisionClass('Dialogues')

    table.insert(dialogues, dialog)
end