mainMap = {}

mainMap.mapPath = "maps/mainMap.lua"

mainMap.c3DoorCollider = world:newBSGRectangleCollider(x, y, 169, 275, 3)
mainMap.c3DoorCollider:setCollisionClass('C3Door')
mainMap.c3DoorCollider:setType('static')

function mainMap.c3DoorCollider:spawn()
    player:spawn(540, 500)
    world.currentMap = "maps/biblioMap.lua"
end


