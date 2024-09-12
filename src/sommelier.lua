sommelier = {}

function sommelier:start()
    tiaguin = love.graphics.newImage("sprites/sommelier/tiaguin.png")
    caio = love.graphics.newImage("sprites/sommelier/caio.png")
    henrique = love.graphics.newImage("sprites/sommelier/henrique.png")
    vicenzo = love.graphics.newImage("sprites/sommelier/vicenzo.png")
    tiago = love.graphics.newImage("sprites/sommelier/tiago.png")
    table.insert(world.sommelier, tiaguin)
    table.insert(world.sommelier, caio)
    table.insert(world.sommelier, henrique)
    table.insert(world.sommelier, vicenzo)
    table.insert(world.sommelier, tiago)    
end

function sommelier:draw(personagem,x,y)
    love.graphics.draw(personagem, x , y)
end

sommelier.collider = world:newBSGRectangleCollider(146, 214, 40, 70, 3)
sommelier.collider:setCollisionClass("Sommelier")
sommelier.collider:setType("static")