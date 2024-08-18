local dashSpeed = 5 -- velocidade do dash
local dashTime = 0.2 -- tempo de duração do dash
local dashCooldown = 0.5 -- tempo de cooldown do dash
local canDash = true -- se pode dar dash
local isDashing = false -- se está dando dash
local dashDirection = {
    x = 0,
    y = 0
} -- direção do dash

local dash = {}

function dash(player, vx, vy, isMoving, dt)
    if love.keyboard.isDown("lshift") and canDash then
        isDashing = true
        canDash = false
        dashDirection.x, dashDirection.y = vx, vy
        dashTime = 0.2 -- reset dash time
        dashCooldown = 0.5 -- reset dash cooldown
    end

    if isDashing then -- se está dando dash aumenta a velocidade e decrementa o tempo
        vx, vy = dashDirection.x * dashSpeed, dashDirection.y * dashSpeed
        dashTime = dashTime - dt
        if dashTime <= 0 then
            isDashing = false
        end
    end

    if not canDash then -- se não pode dar dash decrementa o cooldown
        dashCooldown = dashCooldown - dt
        if dashCooldown <= 0 then
            canDash = true
        end
    end

    return vx, vy, isMoving, isDashing, canDash -- retorna as variáveis para o main.lua
end

return dash
