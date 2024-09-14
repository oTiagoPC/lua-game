transitions = {}

function spawnTransition(x, y, width, height, id, destX, destY)
    local transition = world:newRectangleCollider(x, y, width, height)
    transition:setCollisionClass('Transitions')
    transition:setType('static')

    transition.id = id
    transition.destX = destX
    transition.destY = destY

    table.insert(transitions, transition)
end

function enterTransition(id, destX, destY)
    local newMap = 'c3Map'
    if id == 'toMain' then
        newMap = ('mainMap')
    elseif id == 'toC3' then
        newMap = ('c3Map')
    elseif id == 'toPav' then
        newMap = ('pavMap')
    elseif id == 'toBiblio' then
        newMap = ('biblioMap')
    end

    player:setPosition(destX, destY)
    loadMap(newMap)
end