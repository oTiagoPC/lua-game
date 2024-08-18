function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    
    anim8 = require 'libraries/anim8'
    sti = require 'libraries/sti'
    camera = require 'libraries/camera'
    wf = require 'libraries/windfield'

    cam = camera()
    gameMap = sti('maps/test-map.lua')
    world = wf.newWorld(0, 0)

    -- efeitos sonoros e musicas
    sounds = {}
    sounds.blip = love.audio.newSource('sounds/blip.wav', 'static')
    sounds.music = love.audio.newSource('sounds/music.mp3', 'stream')
    sounds.music:setLooping(true)

    sounds.music:play()
    sounds.music:setVolume(.5)

    player = {}
    -- colisao de player
    player.collider = world:newBSGRectangleCollider(400, 250, 50, 100, 10)
    player.collider:setFixedRotation(true)
    player.x = 400
    player.y = 200
    player.speed = 300
    
    -- carrega spritesheet e separa cada animação
    player.spritesheet = love.graphics.newImage('sprites/player-sheet.png')
    player.grid = anim8.newGrid(12, 18, player.spritesheet:getWidth(), player.spritesheet:getHeight())

    -- animacao de andar do player
    player.animations = {}
    player.animations.down = anim8.newAnimation(player.grid('1-4', 1), 0.2)
    player.animations.left = anim8.newAnimation(player.grid('1-4', 2), 0.2)
    player.animations.right = anim8.newAnimation(player.grid('1-4', 3), 0.2)
    player.animations.up = anim8.newAnimation(player.grid('1-4', 4), 0.2)
    player.anim = player.animations.down

    -- colisão das paredes
    walls = {}
    if gameMap.layers['walls'] then
        for i, obj in pairs(gameMap.layers['walls'].objects) do
            local wall = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
            wall:setType('static')
            table.insert(walls, wall)
        end
    end
    
    
end

function love.update(dt)
    local isMoving = false
    
    vx = 0
    vy = 0
    
    -- movimentação do player
    if love.keyboard.isDown("d") then
        vx = player.speed
        player.anim = player.animations.right
        isMoving = true
    elseif love.keyboard.isDown("a") then
        vx = player.speed * -1
        player.anim = player.animations.left
        isMoving = true
    end
    if love.keyboard.isDown("w") then
        vy = player.speed * -1
        player.anim = player.animations.up
        isMoving = true
    elseif love.keyboard.isDown("s") then
        vy = player.speed
        player.anim = player.animations.down
        isMoving = true
    end
    
    player.collider:setLinearVelocity(vx, vy)
    
    -- checa se player está se movendo
    if isMoving == false then
        player.anim:gotoFrame(2)
    end
    
    world:update(dt)
    player.x = player.collider:getX()
    player.y = player.collider:getY()
    
    player.anim:update(dt)
    
    -- camera seguindo player
    cam:lookAt(player.x, player.y)
    
    -- pega tamanho do mapa pra camera nao ultrapassar
    w = love.graphics.getWidth()
    h = love.graphics.getHeight()
    local mapW = gameMap.width * gameMap.tilewidth
    local mapH = gameMap.height * gameMap.tileheight
    -- esquerda
    if cam.x < w/2 then
        cam.x = w/2
    end
    -- cima
    if cam.y < h/2 then
        cam.y = h/2
    end
    -- direita
    if cam.x > (mapW - w/2) then
        cam.x = (mapW - w/2)
    end
    -- baixo
    if cam.y > (mapH - h/2) then
        cam.y = (mapH - h/2)
    end
    
    -- testando som
    if love.keyboard.isDown('space') then
        sounds.blip:play()
    end
    if love.keyboard.isDown('z') then
        sounds.music:stop()
    end
end 
    
function love.draw()
    cam:attach()
    -- desenha layer do mapa primeiro
    gameMap:drawLayer(gameMap.layers["ground"])
    gameMap:drawLayer(gameMap.layers["trees"])
    -- desenha player
    player.anim:draw(player.spritesheet, player.x, player.y, nil, 6, nil, 6, 9)
    gameMap:drawLayer(gameMap.layers["buildings"])
    -- ver colisões
    --world:draw()
    cam:detach()
    -- hud fora da câmera
    love.graphics.print('TESTE', 20, 20)
end