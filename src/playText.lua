textBox = love.graphics.newImage('sprites/TextBox.png')
berriFace = love.graphics.newImage('sprites/portraits/berri-portrait.png')
vagnerFace = love.graphics.newImage('sprites/portraits/vagner-portrait.png')
vicenzoFace = love.graphics.newImage('sprites/portraits/vicenzo-portrait.png')
caioFace = love.graphics.newImage('sprites/portraits/caio-portrait.png')
tiagoFace = love.graphics.newImage('sprites/portraits/tiago.png')
tiaguinFace = love.graphics.newImage('sprites/portraits/tiaguin.png')
henriqueFace = love.graphics.newImage('sprites/portraits/henrique-portrait.png')
bibliotecariaFace = love.graphics.newImage('sprites/portraits/blibiotecaria.png')

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

        if dialog.character == "Berri" then 
            love.graphics.draw(berriFace, world.mapWidth - 75, world.mapHeight + 40, nil, 4)
        end
        if dialog.character == "Vagner" then 
            love.graphics.draw(vagnerFace, world.mapWidth - 75, world.mapHeight + 40, nil, 4)
        end
        if dialog.character == "Henrique Gabigol" then 
            love.graphics.draw(henriqueFace, world.mapWidth - 75, world.mapHeight + 40, nil, 4)
        end
        if dialog.character == "Fofinho" then 
            love.graphics.draw(vicenzoFace, world.mapWidth - 75, world.mapHeight + 40, nil, 4)
        end
        if dialog.character == "Tiago R.A." then 
            love.graphics.draw(tiagoFace, world.mapWidth - 75, world.mapHeight + 40, nil, 4)
        end
        if dialog.character == "Tiago P.C." then 
            love.graphics.draw(tiaguinFace, world.mapWidth - 75, world.mapHeight + 40, nil, 4)
        end
        if dialog.character == "Caio BB" then 
            love.graphics.draw(caioFace, world.mapWidth - 75, world.mapHeight + 40, nil, 4)
        end
        if dialog.character == "Moça da Portaria" then 
            love.graphics.draw(bibliotecariaFace, world.mapWidth - 75, world.mapHeight + 40, nil, 4)
        end

        love.graphics.draw(textBox, world.mapWidth - 90, world.mapHeight + 9, nil, 5)
        love.graphics.print(dialog.text, world.mapWidth + 200, world.mapHeight + 61)
    end
end

return dialog
