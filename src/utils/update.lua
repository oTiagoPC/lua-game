function updateAll(dt)
    world:update(dt)
    player:update(dt)
    enemy:update(dt)
    cam:update(dt)
    
    -- Update bullets
    for i = #player.bullets, 1, -1 do
        local bullet = player.bullets[i]
        bullet:update(dt)
        
        -- Remove bullets that are off-screen
        if bullet.x < 0 or bullet.x > love.graphics.getWidth() or
           bullet.y < 0 or bullet.y > love.graphics.getHeight() then
            table.remove(player.bullets, i)
        end
    end
end