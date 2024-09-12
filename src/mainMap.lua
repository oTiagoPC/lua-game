mainMap = {}

mainMap.goingPav = "maps/pavMap.lua"
mainMap.pavSpawnPosition = {x = 513, y = 319}

mainMap.pavDoorCollider = world:newBSGRectangleCollider(310, 460, 40, 5, 3)
mainMap.pavDoorCollider:setCollisionClass('PavDoor')
mainMap.pavDoorCollider:setType('static')


mainMap.goingBiblio = "maps/biblioMap.lua"
mainMap.biblioSpawnPosition = {}
