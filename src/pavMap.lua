pavMap = {}

pavMap.goingMapPath = "maps/mainMap.lua"
pavMap.spawnPosition = {x = 328, y = 377}


function pavMap:create()
    pavMap.insideDoorCollider = world:newBSGRectangleCollider(526, 55, 30, 10, 3) -- x-pos,y-pos,width,height,shape-concavity
    pavMap.insideDoorCollider:setCollisionClass('PavInsideDoor')
    pavMap.insideDoorCollider:setType('static')
end 