local utf8 = require("utf8")

dialog = {}

function wrapText(text, limit)
    local lines, currentLine = {}, ""
    for word in text:gmatch("%S+") do
        if #currentLine + #word + 1 <= limit then
            currentLine = currentLine == "" and word or currentLine .. " " .. word
        else
            table.insert(lines, currentLine)
            currentLine = word
        end
    end
    if currentLine ~= "" then table.insert(lines, currentLine) end
    return lines
end

function dialog:update(dt)
    if world.dialog then
        dialog.textTimer = dialog.textTimer + dt
        local speed = 0.02

        if dialog.textTimer >= speed then
            dialog.textTimer = 0
            dialog.currentTextProgress = dialog.currentTextProgress + 1

            local fullTextLen = utf8.len(dialog.fullText)
            if dialog.currentTextProgress <= fullTextLen then
                local bytePos = utf8.offset(dialog.fullText, dialog.currentTextProgress + 1) - 1
                dialog.text = string.sub(dialog.fullText, 1, bytePos)
                
            else
                dialog.text = dialog.fullText
            end
        end

        if dialog.currentTextProgress > utf8.len(dialog.fullText) then
            if love.keyboard.isDown("space") then
                dialog:next()
            end
        end
    end
end

function dialog:start()
    world.dialog, dialog.currentText, dialog.textTimer, dialog.currentTextProgress = true, 1, 0, 0
    dialog.LenDialog = world.dialogoAtual and #world.dialogoAtual or 0
    dialog:setText()
end

function dialog:next()
    dialog.currentText = dialog.currentText + 1
    if dialog.currentText <= dialog.LenDialog then
        dialog:setText()
    else
        world.dialog = false
    end
end

function dialog:setText()
    local dialogData = world.dialogoAtual[dialog.currentText]
    if dialogData then
        dialog.fullText = table.concat(wrapText(dialogData.text, 42), "\n")
        dialog.text, dialog.currentTextProgress, dialog.character = "", 0, dialogData.speaker
    else
        dialog.text, dialog.character = "", ""
    end
end

function dialog:draw()
    if not world.dialog then return end

    local windowWidth, windowHeight = love.graphics.getWidth(), love.graphics.getHeight()
    local textBoxWidth, textBoxHeight = sprites.hud.textBox:getWidth() * 5, sprites.hud.textBox:getHeight() * 5
    local textBoxX, textBoxY = (windowWidth - textBoxWidth) / 2, windowHeight - textBoxHeight - 50

    love.graphics.draw(sprites.hud.dialogBackground, textBoxX, textBoxY, nil, 5)

    local portrait
    if dialog.character == "Berri" then
        portrait = sprites.portraits.berri
    elseif dialog.character == "Vagner" then
        portrait = sprites.portraits.vagner
    elseif dialog.character == "Tiago Corpes" then
        portrait = sprites.portraits.tiaguin
    elseif dialog.character == "Tiago Azevedo" then
        portrait = sprites.portraits.tiago
    elseif dialog.character == "Caio Brito" then
        portrait = sprites.portraits.caio
    elseif dialog.character == "Henrique Bertochi" then
        portrait = sprites.portraits.henrique
    elseif dialog.character == "Vicenzo Copetti" then
        portrait = sprites.portraits.vicenzo
    elseif dialog.character == "Moça da Portaria" then
        portrait = sprites.portraits.bibliotecaria
    end

    love.graphics.draw(portrait,  textBoxX - 10, textBoxY + 10, nil, 4)

    love.graphics.draw(sprites.hud.textBox, textBoxX, textBoxY, nil, 5)
    love.graphics.print(dialog.text, textBoxX + 280, textBoxY + 40)
    love.graphics.print(dialog.character, textBoxX + textBoxWidth - 40 - utf8.len(dialog.character) * 10, textBoxY + textBoxHeight - 60)
end

return dialog
