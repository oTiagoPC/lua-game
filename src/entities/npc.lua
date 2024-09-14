function createNpc(x, y)
    local npc = {}
    npc.collider = world:newBSGRectangleCollider(x, y, 12, 12, 3) -- X, Y, Width, Height, Border-Radius
    npc.x = x
    npc.y = y
    npc.speed = player.speed * 0.7
    npc.dirX = 0
    npc.dirY = 0
    npc.distanceToPlayer = 0
    npc.canMove = true

    npc.collider:setCollisionClass('Npc')
    npc.collider:setFixedRotation(true)
    npc.collider:setLinearDamping(12)

    npc.grid = anim8.newGrid(19, 20, sprites.vagnerSheet:getWidth(), sprites.vagnerSheet:getHeight())

    npc.animations = {}
    npc.animations.downRight = anim8.newAnimation(npc.grid('1-2', 1), 0.2)
    npc.animations.downLeft = anim8.newAnimation(npc.grid('1-2', 1), 0.2)
    npc.animations.upRight = anim8.newAnimation(npc.grid('1-2', 2), 0.2)
    npc.animations.upLeft = anim8.newAnimation(npc.grid('1-2', 2), 0.2)

    npc.anim = npc.animations.downRight

    function npc:getObject()
        return npc
    end

    npc.collider:setObject(npc) -- Adicionando o objeto ao collider para ser acessado posteriormente nas colisões

    function npc:update(dt)
        npc.x, npc.y = npc.collider:getPosition()
        npc.distanceToPlayer = distanceBetween(npc.x, npc.y, player.x, player.y)
        local dirX = 0
        local dirY = 0
        
        if npc.distanceToPlayer < 15 and npc.canMove then
            dialog:start()
            table.insert(world.enemies, createEnemy(140, 460))
            table.insert(world.enemies, createEnemy(155, 460))
            table.insert(world.enemies, createEnemy(170, 460))
            table.insert(world.enemies, createEnemy(225, 365))
            table.insert(world.enemies, createEnemy(225, 300))
            table.insert(world.enemies, createEnemy(325, 300))
            table.insert(world.enemies, createEnemy(700, 380))
            table.insert(world.enemies, createEnemy(700, 330))
            table.insert(world.enemies, createEnemy(700, 260))
            table.insert(world.enemies, createEnemy(66, 300))
            if enemy then enemy.attackRange = 250 end
            npc.canMove = false
            npc.collider:setLinearVelocity(0, 0)
            npc.anim:gotoFrame(1)
            npc.collider:setType("static")
        end


        if npc.canMove then
            npc.anim:update(dt)
            if player.x > npc.x then
                npc.dirX = 1
                dirX = 1
                if player.y > npc.y then 
                    npc.anim = npc.animations.downRight
                    npc.dirY = 1
                    dirY = 1
                else
                    npc.anim = npc.animations.upRight
                    npc.dirY = -1
                    dirY = -1
                end

            else
                npc.dirX = -1
                dirX = -1
                if player.y > npc.y then 
                    npc.anim = npc.animations.downLeft
                    npc.dirY = 1
                    dirY = 1
                else
                    npc.anim = npc.animations.upLeft
                    npc.dirY = -1
                    dirY = -1
                end
            end

            if dirY == 0 and dirX ~= 0 then
                npc.dirY = 1
            end
            
            local vec = vector(npc.dirX, npc.dirY):normalized() * npc.speed
            if vec.x ~= 0 or vec.y ~= 0 then
                npc.collider:setLinearVelocity(vec.x, vec.y)
            end
        end
    end

    return npc
end

-- Criando novos inimigos


--local vagner = createNpc(223, 185)
--table.insert(world.NPCs, vagner)

