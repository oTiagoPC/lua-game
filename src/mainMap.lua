mainMap = {}

mainMap.goingPav = "maps/pavMap.lua"
mainMap.pavSpawnPosition = {x = 513, y = 319}

function mainMap:pavCreate()
    mainMap.pavDoorCollider = world:newBSGRectangleCollider(310, 460, 40, 5, 3)
    mainMap.pavDoorCollider:setCollisionClass('PavDoor')
    mainMap.pavDoorCollider:setType('static')
end


mainMap.goingBiblio = "maps/biblioMap.lua"
mainMap.biblioSpawnPosition = {x = 550, y= 490}

function mainMap:biblioCreate()
    mainMap.biblioDoorCollider = world:newBSGRectangleCollider(538, 190, 40, 5, 3)
    mainMap.biblioDoorCollider:setCollisionClass("BiblioDoor")
    mainMap.biblioDoorCollider:setType("static")
end

mainMap.goingC3 =  "maps/c3Map.lua"
mainMap.c3SpawnPosition = {x = 605,y = 545}

function mainMap:c3Create()
    mainMap.c3DoorCollider = world:newBSGRectangleCollider(164, 270, 20, 5, 3)
    mainMap.c3DoorCollider:setCollisionClass("C3Door")
    mainMap.c3DoorCollider:setType("static")
end