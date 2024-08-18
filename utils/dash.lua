-- -- checa se player está se movendo
-- if not isMoving then
--     player.anim:gotoFrame(2)
-- end

-- -- Dash
-- if love.keyboard.isDown("lshift") and canDash then
--     isDashing = true
--     canDash = false
--     dashDirection.x, dashDirection.y = vx, vy
-- end

-- if isDashing then
--     vx, vy = dashDirection.x * dashSpeed, dashDirection.y * dashSpeed
--     dashTime = dashTime - dt -- dt é o tempo que passou desde o último frame
--     if dashTime <= 0 then
--         isDashing = false
--         dashTime = 0.2
--     end
-- end

-- -- Dash cooldown
-- if not canDash then
--     dashCooldown = dashCooldown - dt
--     if dashCooldown <= 0 then
--         canDash = true
--         dashCooldown = 1
--     end
-- end


-- local dashSpeed = 5 -- velocidade do dash
-- local dashTime = 0.2 -- tempo de duração do dash
-- local dashCooldown = 0.5 -- tempo de cooldown do dash
-- local canDash = true -- se pode dar dash
-- local isDashing = false -- se está dando dash
-- local dashDirection = {x = 0, y = 0} -- direção do dash

function dash(player, vx, vy, isMoving, dt)
    local dashSpeed = 5 -- velocidade do dash
    local dashTime = 0.2 -- tempo de duração do dash
    local dashCooldown = 0.5 -- tempo de cooldown do dash
    local canDash = true -- se pode dar dash
    local isDashing = false -- se está dando dash
    local dashDirection = {x = 0, y = 0} -- direção do dash
    
    -- Ver porque o dt não está funcionando
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

    return vx, vy, isMoving
end

return dash