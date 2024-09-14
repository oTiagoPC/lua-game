sommelier = {}

function sommelier:start()
    table.insert(world.sommelier, sprites.characters.tiaguin)
    table.insert(world.sommelier, sprites.characters.caio)
    table.insert(world.sommelier, sprites.characters.henrique)
    table.insert(world.sommelier, sprites.characters.vicenzo)
    table.insert(world.sommelier, sprites.characters.tiago)    
end

function sommelier:draw(personagem, x, y)
    love.graphics.draw(personagem, x , y)
end