function drawInCamera()
    
    gameMap:drawLayer(gameMap.layers["ground"])
    gameMap:drawLayer(gameMap.layers["trees"])

    player.anim:draw(player.spritesheet, player.x, player.y, nil, 6, nil, 6, 9)
    
    gameMap:drawLayer(gameMap.layers["buildings"])
end