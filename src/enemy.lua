function createEnemy(x, y)
    local enemy = {}
    enemy.collider = world:newBSGRectangleCollider(x, y, 55, 90, 10) -- X, Y, Width, Height, Border-Radius
    enemy.x = x
    enemy.y = y
    enemy.speed = player.speed * 0.5
    enemy.health = 5
    enemy.damage = 1

    enemy.collider:setCollisionClass('Enemy')
    enemy.collider:setFixedRotation(true)
    enemy.collider:setLinearDamping(12)

    enemy.grid = anim8.newGrid(12, 18, sprites.enemySheet:getWidth(), sprites.enemySheet:getHeight())

    enemy.animations = {}
    enemy.animations.right = anim8.newAnimation(enemy.grid('1-4', 1), 0.2)
    enemy.animations.left = anim8.newAnimation(enemy.grid('1-4', 2), 0.2)
    enemy.animations.down = anim8.newAnimation(enemy.grid('1-4', 3), 0.2)
    enemy.animations.up = anim8.newAnimation(enemy.grid('1-4', 4), 0.2)

    enemy.anim = enemy.animations.down

    function enemy:takeDamage(damage)
        enemy.health = enemy.health - damage
    end

    function enemy:getObject()
        return enemy
    end

    enemy.collider:setObject(enemy) -- Adicionando o objeto ao collider para ser acessado posteriormente nas colisões

    function enemy:update(dt)
        if enemy.health <= 0 then
            local num = math.random(1,10)

            if num > 9 then

                -- Cria uma moeda aonde o inimigo morreu 
                local coin = createCoin(enemy.x, enemy.y)
                table.insert(world.coins, coin)

                -- Destroi o inimigo
                enemy.collider:destroy()
                for i, e in ipairs(world.enemies) do
                    if e == enemy then
                        table.remove(world.enemies, i)
                        break
                    end
                end
                return
            

            else
                -- Cria uma moeda aonde o inimigo morreu 
                local burger = createBurger(enemy.x, enemy.y)
                table.insert(world.food, burger)

                -- Destroi o inimigo
                enemy.collider:destroy()
                for i, e in ipairs(world.enemies) do
                    if e == enemy then
                        table.remove(world.enemies, i)
                        break
                    end
                end
                return
            end
        end

        local playerPosition = vector(player.x, player.y)
        local enemyPosition = vector(enemy.x, enemy.y)

        if playerPosition.x > enemyPosition.x then
            enemy.anim = enemy.animations.right
        elseif playerPosition.x < enemyPosition.x then
            enemy.anim = enemy.animations.left
        end

        if playerPosition.y > enemyPosition.y then
            enemy.anim = enemy.animations.down
        elseif playerPosition.y < enemyPosition.y then
            enemy.anim = enemy.animations.up
        end

        local vec = (playerPosition - enemyPosition):normalized() * enemy.speed
        if vec.x ~= 0 or vec.y ~= 0 then
            enemy.collider:setLinearVelocity(vec.x, vec.y)
        end

        if vec.x == 0 and vec.y == 0 then
            enemy.anim:gotoFrame(2)
        end

        enemy.anim:update(dt)

        enemy.x = enemy.collider:getX()
        enemy.y = enemy.collider:getY()
    end

    return enemy
end

-- Criando novos inimigos
local enemy4 = createEnemy(100, 400)
table.insert(world.enemies, enemy4)
