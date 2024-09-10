function createNpc(x, y)
    local npc = {}
    npc.collider = world:newBSGRectangleCollider(x, y, 12, 12, 3) -- X, Y, Width, Height, Border-Radius
    npc.x = x
    npc.y = y
    npc.speed = player.speed 

    npc.collider:setCollisionClass('Npc')
    npc.collider:setFixedRotation(true)
    npc.collider:setType("static")
    npc.collider:setLinearDamping(12)

    npc.grid = anim8.newGrid(15, 17, sprites.vagnerSheet:getWidth(), sprites.vagnerSheet:getHeight())

    npc.animations = {}
    npc.animations.right = anim8.newAnimation(npc.grid('1-4', 1), 0.2)
    npc.animations.left = anim8.newAnimation(npc.grid('1-4', 2), 0.2)
    npc.animations.down = anim8.newAnimation(npc.grid('1-4', 3), 0.2)
    npc.animations.up = anim8.newAnimation(npc.grid('1-4', 4), 0.2)

    npc.anim = npc.animations.down

    function npc:cena1()
        local finalX = 234
        local finalY = 184

        if npc.x > player.x then 
            npc.x = npc.x - 2
            npc.anim = npc.animations.left
        end
        if npc.y > player.y then 
            npc.y = npc.y - 2
            npc.anim = npc.animations.right
        end
    end

    function npc:getObject()
        return npc
    end

    npc.collider:setObject(npc) -- Adicionando o objeto ao collider para ser acessado posteriormente nas colisões

    function npc:update(dt)
        npc:cena1()
    end

    return npc
end

-- Criando novos inimigos
local vagner = createNpc(300, 200)
table.insert(world.NPCs, vagner)
