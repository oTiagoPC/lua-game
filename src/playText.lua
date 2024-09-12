textBox = love.graphics.newImage('sprites/TextBox.png')
berriFace = love.graphics.newImage('sprites/portraits/berri-portrait.png')
vagnerFace = love.graphics.newImage('sprites/portraits/vagner-portrait.png')
vicenzoFace = love.graphics.newImage('sprites/portraits/vicenzo-portrait.png')
caioFace = love.graphics.newImage('sprites/portraits/caio-portrait.png')
tiagoFace = love.graphics.newImage('sprites/portraits/tiago.png')
tiaguinFace = love.graphics.newImage('sprites/portraits/tiaguin.png')
henriqueFace = love.graphics.newImage('sprites/portraits/henrique-portrait.png')
bibliotecariaFace = love.graphics.newImage('sprites/portraits/blibiotecaria.png')
blueBg = love.graphics.newImage('sprites/blueBackground.png')

dialog = {}

function wrapText(text, limit)
    local lines = {}
    local currentLine = ""

    for word in text:gmatch("%S+") do
        if #currentLine + #word + 1 <= limit then
            if currentLine ~= "" then
                currentLine = currentLine .. " " .. word
            else
                currentLine = word
            end
        else
            table.insert(lines, currentLine)
            currentLine = word
        end
    end
    if currentLine ~= "" then
        table.insert(lines, currentLine)
    end

    return lines
end

function dialog:update(dt)
    -- Verifica se LenDialog está corretamente definido
    if dialog.LenDialog and dialog.currentText > dialog.LenDialog then
        world.dialog = false
    end
end

function dialog:start()
    world.dialog = true
    dialog.currentText = 1
    -- Verifica se o roteiro e a cena existem antes de definir LenDialog
    if world.dialogoAtual then
        dialog.LenDialog = #world.dialogoAtual  -- Define o número total de diálogos
    else
        dialog.LenDialog = 0  -- Caso o diálogo não exista, evita erro de comparação
    end
    dialog:setText()
end

function dialog:next()
    dialog.currentText = dialog.currentText + 1
    if dialog.currentText <= dialog.LenDialog then
        dialog:setText()  -- Atualiza o texto e o personagem
    else
        world.dialog = false
    end
end

function dialog:setText()
    -- Garante que o texto e o personagem sejam atualizados corretamente
    if world.dialogoAtual[dialog.currentText] then
        local fullText = world.dialogoAtual[dialog.currentText].text
        local wrappedText = wrapText(fullText, 42)
        dialog.text = table.concat(wrappedText, "\n")  -- Junta as linhas com quebras
        dialog.character = world.dialogoAtual[dialog.currentText].speaker
    else
        dialog.text = ""
        dialog.character = ""
    end
end

function dialog:draw()
    if world.dialog then

        love.graphics.draw(blueBg, world.mapWidth - 55, world.mapHeight + 104, nil, 5)

        if dialog.character == "Berri" then 
            drawPortrait(berriFace)
        end
        if dialog.character == "Vagner" then 
            drawPortrait(vagnerFace)
        end
        if dialog.character == "Henrique Gabigol" then 
            drawPortrait(henriqueFace)
        end
        if dialog.character == "Fofinho" then 
            drawPortrait(vicenzoFace)
        end
        if dialog.character == "Tiago R.A." then 
            drawPortrait(tiagoFace)
        end
        if dialog.character == "Tiago P.C." then 
            drawPortrait(tiaguinFace)
        end
        if dialog.character == "Caio BB" then 
            drawPortrait(caioFace)
        end
        if dialog.character == "Moça da Portaria" then 
            drawPortrait(bibliotecariaFace)
        end

        love.graphics.draw(textBox, world.mapWidth - 90, world.mapHeight + 9, nil, 5)
        love.graphics.print(dialog.text, world.mapWidth + 200, world.mapHeight + 124)
    end
end

function drawPortrait(portrait)
    love.graphics.draw(portrait, world.mapWidth - 80, world.mapHeight + 95, nil, 4)
end


return dialog
