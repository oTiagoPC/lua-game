textBox = love.graphics.newImage('sprites/TextBox.png')
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
    if roteiro.c3 and roteiro.c3.dialogo1 then
        dialog.LenDialog = #roteiro.c3.dialogo1  -- Define o número total de diálogos
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
    if roteiro.c3.dialogo1[dialog.currentText] then
        local fullText = roteiro.c3.dialogo1[dialog.currentText].text
        local wrappedText = wrapText(fullText, 42)
        dialog.text = table.concat(wrappedText, "\n")  -- Junta as linhas com quebras
        dialog.character = roteiro.c3.dialogo1[dialog.currentText].speaker
    else
        dialog.text = ""
        dialog.character = ""
    end
end

function dialog:draw()
    if world.dialog then
        love.graphics.draw(textBox, world.mapWidth - 90, world.mapHeight + 9, nil, 5)
        love.graphics.print(dialog.text, world.mapWidth + 200, world.mapHeight + 61)
    end
end

return dialog
