credits = {}  
credits.teste = love.graphics.newImage('sprites/testeCreditos.png')

-- Variável para controlar o deslocamento vertical da imagem
credits.offsetY = 0
-- Velocidade de descida da imagem (píxeis por segundo)
credits.speed = 50

function credits:update(dt)
    -- Atualiza a posição vertical da imagem, fazendo ela descer com base no tempo
    credits.offsetY = credits.offsetY + credits.speed * dt
end

function credits:draw()
    -- Obter o tamanho da tela
    local screenWidth = love.graphics.getWidth()
    local screenHeight = love.graphics.getHeight()
    
    -- Obter o tamanho da imagem
    local imageWidth = credits.teste:getWidth()
    local imageHeight = credits.teste:getHeight()
    
    -- Calcular a escala para dar zoom na imagem
    local scaleX = screenWidth / imageWidth
    local scaleY = screenHeight / imageHeight
    
    -- Usar a maior escala para garantir que a imagem cubra toda a tela
    local scale = math.max(scaleX, scaleY)
    
    -- Desenhar a imagem começando pelo topo, com um deslocamento Y para controle
    love.graphics.draw(
        credits.teste, 
        screenWidth / 2, 
        credits.offsetY,  -- Controla a posição vertical da imagem
        0, 
        scale, 
        scale, 
        imageWidth / 2, 
        0  -- Coloca o ponto de origem no topo da imagem
    )
end
