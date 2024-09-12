world.enemies = {}
world.coins = {}
world.food = {}
world.NPCs = {}
world.dialog = false 
world.dialogoAtual = roteiro.pav3.dialogo2
world.mapaAtual = 'maps/mainMap.lua'



local function distanceBetween(x1, y1, x2, y2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end

function world:raycast(x1, y1, x2, y2, classes)
    local dx, dy = x2 - x1, y2 - y1
    local distance = math.sqrt(dx^2 + dy^2)
    local nx, ny = dx / distance, dy / distance
    
    local step = 1 -- Passo para checagem de colisão
    local colliders = self:getColliders() -- Assume que existe um método para obter todos os colliders
    
    for i = 0, distance, step do
        local px, py = x1 + nx * i, y1 + ny * i
        
        for _, collider in ipairs(colliders) do
            if collider:getCollisionClass() and (not classes or table.contains(classes, collider:getCollisionClass())) then
                local cx, cy = collider:getPosition()
                local shape = collider:getShape()
                
                if shape:getType() == "CircleShape" then
                    local radius = shape:getRadius()
                    if distanceBetween(px, py, cx, cy) <= radius then
                        return {
                            x = px,
                            y = py,
                            collider = collider
                        }
                    end
                elseif shape:getType() == "PolygonShape" or shape:getType() == "RectangleShape" then
                    if shape:testPoint(0, 0, 0, px, py) then -- Assume que o shape está na origem do collider
                        return {
                            x = px,
                            y = py,
                            collider = collider
                        }
                    end
                end
            end
        end
    end
    
    return nil -- Nenhuma colisão encontrada
end

-- Função auxiliar para verificar se uma tabela contém um valor
function table.contains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end