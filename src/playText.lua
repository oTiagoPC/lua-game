textBox = love.graphics.newImage('sprites/TextBox.png')

--[[function drawText(lugar, cena)
    local textoAtual = 1
    -- text = roteiro.lugar.cena[textoAtual].text
    -- text = roteiro.c3.dialogo1[1].text
    love.graphics.draw(textBox, love.graphics.getWidth() / 2 - 400, love.graphics.getHeight() / 2 + 9, nil, 5)
    love.graphics.print(text, love.graphics.getWidth() / 2 - 110, love.graphics.getHeight() / 2 + 61)
end]]

function c3Dialogo1()
    dialogo = {}
    dialogo.LenDialogo = #roteiro.c3.dialogo1
    dialogo.textoAtual = 1
    world.dialogo = true
    dialogo.atualiza = false

    dialogo.text = roteiro.c3.dialogo1[dialogo.textoAtual].text
    dialogo.personagem = roteiro.c3.dialogo1[dialogo.textoAtual].speaker
    love.graphics.draw(textBox, love.graphics.getWidth() / 2 - 400, love.graphics.getHeight() / 2 + 9, nil, 5)
    love.graphics.print(dialogo.text, love.graphics.getWidth() / 2 - 110, love.graphics.getHeight() / 2 + 61)
    
    function dialogo:update(dt)
        dialogo.textoAtual = dialogo.textoAtual + 1
        if dialogo.textoAtual == dialogo.LenDialogo then 
            world.dialogo = false 
        end 
        dialogo.atualiza = false
    end
    return dialogo
end
