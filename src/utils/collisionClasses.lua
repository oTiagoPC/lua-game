function createCollisionClasses()
    world:addCollisionClass('Player')
    world:addCollisionClass('Enemy')
    world:addCollisionClass('Bullet')
    world:addCollisionClass('Wall')
    world:addCollisionClass('Coin', {ignores = {'Enemy'}})
    world:addCollisionClass('Food', {ignores = {'Enemy'}})
    world:addCollisionClass('Npc')

    world:addCollisionClass('C3Door')
    world:addCollisionClass('C3InsideDoor')
    world:addCollisionClass('PavDoor')
    world:addCollisionClass('BiblioDoor')
end