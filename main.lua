function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    
    anim8 = require 'libraries/anim8'
    sti = require 'libraries/sti'
    camera = require 'libraries/camera'
    wf = require 'libraries/windfield'
    movements = require 'utils/movements' -- importa funcoes de movimento
    dash = require 'utils/dash' -- importa funcoes de dash

    font = love.graphics.newFont('fonts/pixel-font.ttf', 30)
    love.graphics.setFont(font)
    love.window.setMode(0,0,{fullscreen = true})
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

    -- robo teste
    robo = love.graphics.newImage('sprites/robot.png')
    
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

local dashSpeed = 5 -- velocidade do dash
local dashTime = 0.2 -- tempo de duração do dash
local dashCooldown = 0.5 -- tempo de cooldown do dash
local canDash = true -- se pode dar dash
local isDashing = false -- se está dando dash
local dashDirection = {x = 0, y = 0} -- direção do dash

function love.update(dt)
    local isMoving = false
    
    vx = 0
    vy = 0
    
    -- movimentação do player
    local vx, vy, isMoving = movements.basicMovement(player)
    vx, vy, isMoving, isDashing, canDash = dash(player, vx, vy, isMoving, dt)

    
    
    player.collider:setLinearVelocity(vx, vy)

    -- checa se player está se movendo
    if not isMoving then
        player.anim:gotoFrame(2)
    end

    -- Dash
    if love.keyboard.isDown("lshift") and canDash then
        isDashing = true
        canDash = false
        dashDirection.x, dashDirection.y = vx, vy
    end

    if isDashing then
        vx, vy = dashDirection.x * dashSpeed, dashDirection.y * dashSpeed
        dashTime = dashTime - dt -- dt é o tempo que passou desde o último frame
        if dashTime <= 0 then
            isDashing = false
            dashTime = 0.2
        end
    end

    -- Dash cooldown
    if not canDash then
        dashCooldown = dashCooldown - dt
        if dashCooldown <= 0 then
            canDash = true
            dashCooldown = 1
        end
    end

    
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

    -- sistema de interacao basico
    if player.x > 700 and player.x < 900 and player.y > 700 and player.y < 900 then
        texto = true
        if love.keyboard.isDown('space') then
            sounds.blip:play()
        end
    else
        texto = false
    end
    
    -- testando som
    if love.keyboard.isDown('z') then
        sounds.music:stop()
    end

    -- Botão para sair do jogo (esc)
    if love.keyboard.isDown("escape") then
        love.event.quit()
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
    -- robozin de teste
    love.graphics.draw(robo, 700, 700, nil, 0.5)
    -- ver colisões
    --world:draw()
    cam:detach()
    -- hud fora da câmera
    if texto then
        fala = love.graphics.print('Aperte [Espaço] para interagir!', 50, 550)
    end
end