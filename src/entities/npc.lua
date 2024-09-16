npc = {}

function createNpc(x, y)
    npc.collider = world:newBSGRectangleCollider(x, y, 12, 12, 3)
    npc.speed = player.speed * 0.9
    npc.targetX, npc.targetY = nil, nil
    npc.walking = false
    npc.ready = true
    npc.destinationQueue = {}  -- Fila de destinos

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
        -- Adiciona destinos
        if dialogPosition == 1 and #world.enemies == 0 then
            if npc.ready == true then
                npcGoTo(vagner, 221, 170)
                npcGoTo(vagner, 221, 301)
                npcGoTo(vagner, 510, 300)
                npcGoTo(vagner, 588, 473)
                npc.ready = false
            end
        end

        -- Se não houver destino atual e a fila não estiver vazia, pegue o próximo
        if not npc.targetX and not npc.targetY and #npc.destinationQueue > 0 then
            local nextDestination = table.remove(npc.destinationQueue, 1)
            npcGoTo(npc, nextDestination.x, nextDestination.y)
        end

        npc.x, npc.y = npc.collider:getPosition()

        -- Se o NPC tiver um destino, mova-o até lá
        if npc.targetX and npc.targetY then
            if npc.y > npc.targetY then
                if npc.x > npc.targetX then
                    npc.anim = npc.animations.upLeft
                else
                    npc.anim = npc.animations.upRight
                end
            else
                if npc.x > npc.targetX then
                    npc.anim = npc.animations.downLeft
                else
                    npc.anim = npc.animations.downRight
                end
            end

            local dist = distanceBetween(npc.x, npc.y, npc.targetX, npc.targetY)

            -- Ajuste na precisão da verificação de distância
            if dist > 5 then  -- Aumente esse valor se o NPC ainda estiver travando
                local dir = vector(npc.targetX - npc.x, npc.targetY - npc.y):normalized()
                npc.collider:setLinearVelocity(dir.x * npc.speed, dir.y * npc.speed)
                npc.walking = true
            else
                npc.collider:setLinearVelocity(0, 0)
                npc.targetX, npc.targetY = nil, nil
                npc.walking = false
                if npc.anim == npc.animations.upLeft then
                    npc.anim = npc.animations.downLeft
                end
                if npc.anim == npc.animations.upRight then
                    npc.anim = npc.animations.downRight
                end
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

-- Modificação no método npcGoTo para adicionar destinos na fila
function npcGoTo(npc, x, y)
    -- Adiciona destino na fila se já houver um movimento em andamento
    if npc.targetX and npc.targetY then
        table.insert(npc.destinationQueue, {x = x, y = y})
    else
        -- Caso contrário, defina o novo destino e comece o movimento
        npc.targetX = x
        npc.targetY = y
    end
end
