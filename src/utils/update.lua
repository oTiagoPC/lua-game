function updateAll(dt)
    world:update(dt)
    player:update(dt)
    if #world.enemies > 0 then    
        for i, enemy in ipairs(world.enemies) do
            enemy:update(dt)
        end 
    end
    if #world.coins > 0 then
        for i, coin in ipairs(world.coins) do
            coin:update(dt)
        end 
    end 
    if #world.food > 0 then
        for i, food in ipairs(world.food) do 
            food:update(dt)
        end
    end
    cam:update(dt)
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