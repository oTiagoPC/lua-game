pavMap = {}


pavMap.goingMapPath = "maps/mainMap.lua"
pavMap.spawnPosition = {x = 328, y = 377}


function pavMap:create()
    sommelier:start()
    pavMap.insideDoorCollider = world:newBSGRectangleCollider(526, 55, 30, 10, 3) -- x-pos,y-pos,width,height,shape-concavity
    pavMap.insideDoorCollider:setCollisionClass('PavInsideDoor')
    pavMap.insideDoorCollider:setType('static')
end 



function pavMap:pavDialogo()
    pavMap.dialogoCollider = world:newBSGRectangleCollider(342, 214, 20, 50, 3)
    pavMap.dialogoCollider:setCollisionClass("DialogoPav")
    pavMap.dialogoCollider:setType("static") 
end