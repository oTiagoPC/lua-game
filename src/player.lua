player = {}
player.collider = world:newBSGRectangleCollider(400, 250, 50, 100, 10)
player.x = 400
player.y = 250
player.speed = 200
player.walking = false

--player.setCollisionClass('Player')
player.collider:setFixedRotation(true)

player.spritesheet = love.graphics.newImage('sprites/playerSheet.png')
player.grid = anim8.newGrid(12, 18, player.spritesheet:getWidth(), player.spritesheet:getHeight())

player.animations = {}
player.animations.right = anim8.newAnimation(player.grid('1-4', 1), 0.2)
player.animations.left = anim8.newAnimation(player.grid('1-4', 2), 0.2)
player.animations.down = anim8.newAnimation(player.grid('1-4', 3), 0.2)
player.animations.up = anim8.newAnimation(player.grid('1-4', 4), 0.2)
player.anim = player.animations.down

function player:update(dt)
    local previousX = player.x
    local previousY = player.y

    
    local vx = 0
    local vy = 0
    
    
    if love.keyboard.isDown('d') or love.keyboard.isDown('right') then
        vx = player.speed
        player.anim = player.animations.right
    end
    if love.keyboard.isDown('a') or love.keyboard.isDown('left') then
        vx = -player.speed
        player.anim = player.animations.left
    end
    if love.keyboard.isDown('s') or love.keyboard.isDown('down') then
        vy = player.speed
        player.anim = player.animations.down
    end
    if love.keyboard.isDown('w') or love.keyboard.isDown('up') then
        vy = -player.speed
        player.anim = player.animations.up
    end

    player.collider:setLinearVelocity(vx,vy)
    
    player.x = player.collider:getX()
    player.y = player.collider:getY()
    
    if previousX ~= player.x or previousY ~= player.y then
        player.walking = true
    else
        player.walking = false
        player.anim:gotoFrame(2)
    end
    

    if player.walking == true then
        player.anim:update(dt)
    end

end