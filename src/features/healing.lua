function createBurger(x, y)
    local food = {}
    food.x = x
    food.y = y
    food.collider = world:newCircleCollider(food.x, food.y, 4)
    food.collider:setCollisionClass('Food')
    food.collider:setFixedRotation(true)
    food.collider:setType("static")
    food.collider:setObject(food)

    food.grid = anim8.newGrid(20, 19, sprites.burgerSheet:getWidth(), sprites.burgerSheet:getHeight())
    food.animation = anim8.newAnimation(food.grid('1-7', 1), 0.1)
    food.collected = false

    function food:draw()
        if not food.collected then
            food.animation:draw(sprites.burgerSheet, food.x-5, food.y-5, nil, 0.6)
        end
    end
    
    function food:getObject()
        return food
    end

    function food:collect()
        food.collected = true
    end

    function food:update(dt)
        if distanceBetween(food.x, food.y, player.x, player.y) < 30 then
            local speed = 100

            local dirX = player.x - food.x
            local dirY = player.y - food.y
            local length = math.sqrt(dirX^2 + dirY^2)


            dirX = dirX / length
            dirY = dirY / length


            food.x = food.x + dirX * speed * dt
            food.y = food.y + dirY * speed * dt


            food.collider:setPosition(food.x, food.y)
        end

        if not self.collected then
            food.animation:update(dt)
        else
            food.collider:destroy()
            for i, e in ipairs(world.food) do
                if e == food then
                    table.remove(world.food, i)
                    break
                end
            end
        end
    end

    return food
end

world.food = {}