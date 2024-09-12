function createNpc(x, y)
    local npc = {}
    npc.collider = world:newBSGRectangleCollider(x, y, 12, 12, 3) -- X, Y, Width, Height, Border-Radius
    npc.x = x
    npc.y = y
    npc.speed = player.speed 
    npc.dirX = 1
    npc.dirY = 1

    npc.collider:setCollisionClass('Npc')
    npc.collider:setFixedRotation(true)
    npc.collider:setType("static")
    npc.collider:setLinearDamping(12)

    npc.grid = anim8.newGrid(15, 17, sprites.vagnerSheet:getWidth(), sprites.vagnerSheet:getHeight())

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
        npc.anim:update(dt)
        npc.x, npc.y = npc.collider:getPosition()
        
        if player.x > npc.x then
            npc.dirX = 1
            if player.y > npc.y then 
                npc.anim = npc.animations.downRight
                npc.dirY = 1
            else
                npc.anim = npc.animations.upRight
                npc.dirY = -1
            end
        else
            npc.dirX = -1
            if player.y > npc.y then 
                npc.anim = npc.animations.downLeft
                npc.dirY = 1
            else
                npc.anim = npc.animations.upLeft
                npc.dirY = -1
            end
        end
        
    end

    return npc
end

-- Criando novos inimigos
local vagner = createNpc(160+10, 280+10)
table.insert(world.NPCs, vagner)
