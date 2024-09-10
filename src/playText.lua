function playDialogo()
    dialogo = {}
    dialogoAtual = roteiro.c3.dialogo1[1]
    return dialogo
end

function dialogo:draw()
    love.graphics.print(dialogo.dialogoAtual.text, 0, 0)
end
