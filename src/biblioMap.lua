biblio = {}

biblio.goingMapPath = "maps/mainMap.lua"
biblio.spawnPosition = {x = 550, y = 200}

biblio.insideDoorCollider = world:newBSGRectangleCollider(510, 475, 10, 30, 3) -- x-pos,y-pos,width,height,shape-concavity
biblio.insideDoorCollider:setCollisionClass('BiblioInsideDoor')
biblio.insideDoorCollider:setType('static')
