function createBurger(x, y)
    local food = {}
    food.x = x
    food.y = y
    food.collider = world:newCircleCollider(food.x, food.y, 4)
    food.collider:setCollisionClass('Food')
    food.collider:setFixedRotation(true)
    food.collider:setType("static")
    food.collider:setObject(food)

    food.grid = anim8.newGrid(14, 18, sprites.burgerSheet:getWidth(), sprites.burgerSheet:getHeight())
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
        -- Atualizar a animação
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