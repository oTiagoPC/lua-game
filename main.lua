function love.load()
    require('src/utils/load')
    loadAll()
end

function love.update(dt)
    updateAll(dt)
end

function love.draw()
    cam:attach()
        drawInCamera()
        world:draw()
    cam:detach()

    -- Adicione isso para desenhar a interface do usuário fora da câmera
    drawUI()
end

function love.keypressed(key)
    if key == 'lshift' then
        player:dash()
    end
end

function drawUI()
    -- Desenhe a barra de cooldown do dash
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Dash Cooldown:", 10, 10)
    love.graphics.rectangle("line", 10, 30, 100, 20)
    
    love.graphics.print("Health: " .. player.health, 10, 100)
    
    
    local cooldownProgress = math.min(1, (love.timer.getTime() - player.lastDashTime) / player.dashCooldown)
    love.graphics.rectangle("fill", 10, 30, 100 * cooldownProgress, 20)
end