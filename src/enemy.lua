function createEnemy(x, y)
    local enemy = {}
    enemy.collider = world:newBSGRectangleCollider(x, y, 12, 12, 3) -- X, Y, Width, Height, Border-Radius
    enemy.x = x
    enemy.y = y
    enemy.dirX = 1
    enemy.dirY = 1
    enemy.speed = player.speed * 0.5
    enemy.health = 5
    enemy.damage = 1
    enemy.walking = false

    enemy.collider:setCollisionClass('Enemy')
    enemy.collider:setFixedRotation(true)
    enemy.collider:setLinearDamping(12)

    enemy.grid = anim8.newGrid(19, 21, sprites.enemySheet:getWidth(), sprites.enemySheet:getHeight())

    enemy.animations = {}
    enemy.animations.downRight = anim8.newAnimation(enemy.grid('1-2', 1), 0.2)
    enemy.animations.downLeft = anim8.newAnimation(enemy.grid('1-2', 1), 0.2)
    enemy.animations.upRight = anim8.newAnimation(enemy.grid('1-2', 2), 0.2)
    enemy.animations.upLeft = anim8.newAnimation(enemy.grid('1-2', 2), 0.2)

    enemy.anim = enemy.animations.downRight

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

        if enemy.walking then
            if playerPosition.x > enemyPosition.x then
                enemy.dirX = 1
                if playerPosition.y > enemyPosition.y then
                    enemy.anim = enemy.animations.downRight
                else
                    enemy.anim = enemy.animations.upRight
                end
            else
                enemy.dirX = -1
                if playerPosition.y > enemyPosition.y then
                    enemy.anim = enemy.animations.downLeft
                else
                    enemy.anim = enemy.animations.upLeft
                end
            end
        end

        local vec = (playerPosition - enemyPosition):normalized() * enemy.speed
        if vec.x ~= 0 or vec.y ~= 0 then
            enemy.collider:setLinearVelocity(vec.x, vec.y)
        end

        if enemy.dirX == 0 and enemy.dirY == 0 then
            enemy.walking = false
            enemy.anim:gotoFrame(1)
        else
            enemy.walking = true
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
