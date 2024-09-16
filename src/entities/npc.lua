npc = {}

function createNpc(x, y)
    npc.collider = world:newBSGRectangleCollider(x, y, 12, 12, 3)
    npc.speed = player.speed * 0.7
    npc.targetX, npc.targetY = nil, nil
    npc.walking = false

    npc.collider:setCollisionClass('Npc')
    npc.collider:setFixedRotation(true)
    npc.collider:setLinearDamping(12)

    npc.grid = anim8.newGrid(19, 20, sprites.vagnerSheet:getWidth(), sprites.vagnerSheet:getHeight())

    npc.animations = {}
    npc.animations.downRight = anim8.newAnimation(npc.grid('1-2', 1), 0.18)
    npc.animations.downLeft = anim8.newAnimation(npc.grid('1-2', 1), 0.18)
    npc.animations.upRight = anim8.newAnimation(npc.grid('1-2', 2), 0.18)
    npc.animations.upLeft = anim8.newAnimation(npc.grid('1-2', 2), 0.18)


    npc.anim = npc.animations.downRight

    function npc:update(dt)
        npc.x, npc.y = npc.collider:getPosition()

        if npc.targetX and npc.targetY then
            local dist = distanceBetween(npc.x, npc.y, npc.targetX, npc.targetY)

            if dist > 1 then
                local dir = vector(npc.targetX - npc.x, npc.targetY - npc.y):normalized()
                npc.collider:setLinearVelocity(dir.x * npc.speed, dir.y * npc.speed)
                npc.walking = true
            else
                npc.collider:setLinearVelocity(0, 0)
                npc.targetX, npc.targetY = nil, nil
                npc.walking = false
                npc.anim:gotoFrame(1)
            end
        end

        if npc.walking then
            npc.anim:update(dt)
        end
    end

    return npc
end

function npc:getObject()
    return npc
end

function npcGoTo(npc, x, y)
    npc.targetX = x
    npc.targetY = y
end
