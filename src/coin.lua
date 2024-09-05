function createCoin(x, y)
    local coin = {}
    coin.x = x
    coin.y = y
    coin.collider = world:newCircleCollider(coin.x, coin.y, 4)
    coin.collider:setCollisionClass('Coin')
    coin.collider:setFixedRotation(true)
    coin.collider:setType("static")
    coin.collider:setObject(coin)

    coin.spritesheet = love.graphics.newImage('sprites/furgCoin.png')
    coin.grid = anim8.newGrid(16, 16, coin.spritesheet:getWidth(), coin.spritesheet:getHeight())
    coin.animation = anim8.newAnimation(coin.grid('1-8', 1), 0.1)
    coin.collected = false

    function coin:draw()
        if not coin.collected then
            coin.animation:draw(coin.spritesheet, coin.x-5, coin.y-5, nil, 0.6)
        end
    end
    
    function coin:getObject()
        return coin
    end

    function coin:collect()
        coin.collected = true
    end

    function coin:update(dt)
        -- Atualizar a animação
        if not self.collected then
            coin.animation:update(dt)
        else
            coin.collider:destroy()
            for i, e in ipairs(world.coins) do
                if e == coin then
                    table.remove(world.coins, i)
                    break
                end
            end
        end
    end

    return coin
end

world.coins = {}