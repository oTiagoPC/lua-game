pavMap = {}

function pavMap:pavDialogo()
    pavMap.dialogoCollider = world:newBSGRectangleCollider(342, 214, 20, 50, 3)
    pavMap.dialogoCollider:setCollisionClass("DialogoPav")
    pavMap.dialogoCollider:setType("static") 
end