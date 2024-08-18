local movements = {}

movements.basicMovement = {}

function movements.basicMovement(player)
    local vx, vy = 0, 0
    local isMoving = false

    if love.keyboard.isDown("d") then
        vx = player.speed
        player.anim = player.animations.right
        isMoving = true
    elseif love.keyboard.isDown("a") then
        vx = -player.speed
        player.anim = player.animations.left
        isMoving = true
    end

    if love.keyboard.isDown("w") then
        vy = -player.speed
        player.anim = player.animations.up
        isMoving = true
    elseif love.keyboard.isDown("s") then
        vy = player.speed
        player.anim = player.animations.down
        isMoving = true
    end

    return vx, vy, isMoving
end

return movements