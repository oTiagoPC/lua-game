c3 = {}

c3.goingMapPath = "maps/mainMap.lua"
c3.spawnPosition = {x = 166, y = 278}

c3.insideDoorCollider = world:newBSGRectangleCollider(560, 572, 100, 20, 3) -- x-pos,y-pos,width,height,shape-concavity
c3.insideDoorCollider:setCollisionClass('C3InsideDoor')
c3.insideDoorCollider:setType('static')

c3.chatCollider = world:newBSGRectangleCollider(566, 487, 100, 20, 3)
c3.chatCollider:setCollisionClass('C3Dialogo')
c3.chatCollider:setType('static')