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
    if dialog.currentText < dialog.LenDialog then
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
        local windowWidth = love.graphics.getWidth()
        local windowHeight = love.graphics.getHeight()

        local textBoxWidth = textBox:getWidth() * 5
        local textBoxHeight = textBox:getHeight() * 5

        local textBoxX = (windowWidth - textBoxWidth) / 2
        local textBoxY = windowHeight - textBoxHeight - 50

        love.graphics.draw(sprites.hud.dialogBackground, textBoxX, textBoxY, nil, 5)

        local portraitX = textBoxX - 10
        local portraitY = textBoxY + 10

        if dialog.character == "Berri" then 
            drawPortrait(sprites.portraits.berri, portraitX, portraitY)
        elseif dialog.character == "Vagner" then 
            drawPortrait(sprites.portraits.vagner, portraitX, portraitY)
        elseif dialog.character == "Tiago Corpes" then 
            drawPortrait(sprites.portraits.tiaguin, portraitX, portraitY)
        elseif dialog.character == "Tiago Azevedo" then 
            drawPortrait(sprites.portraits.tiago, portraitX, portraitY)
        elseif dialog.character == "Caio Barcelos" then 
            drawPortrait(sprites.portraits.caio, portraitX, portraitY)
        elseif dialog.character == "Henrique Bertochi" then 
            drawPortrait(sprites.portraits.henrique, portraitX, portraitY)
        elseif dialog.character == "Vicenzo Copetti" then 
            drawPortrait(sprites.portraits.vicenzo, portraitX, portraitY)
        elseif dialog.character == "Moça da Portaria" then 
            drawPortrait(sprites.portraits.bibliotecaria, portraitX, portraitY)
        end

        love.graphics.draw(sprites.hud.textBox, textBoxX, textBoxY, nil, 5)

        -- Centralizar o texto dentro da caixa de diálogo
        local textX = textBoxX + 280 -- Um pouco de margem à esquerda
        local textY = textBoxY + 40 -- Um pouco de margem no topo
        love.graphics.print(dialog.text, textX, textY)

        local charX = textBoxX + textBoxWidth - 40 - #dialog.character * 10
        local charY = textBoxY + textBoxHeight - 60
        love.graphics.print(dialog.character, charX, charY)
    end
end

function drawPortrait(portrait, x, y)
    love.graphics.draw(portrait, x, y, nil, 4)
end


return dialog
