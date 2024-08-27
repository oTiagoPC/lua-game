function createCollisionClasses()
    world:addCollisionClass('Player')
    world:addCollisionClass('Enemy')
    -- por algum motivo só consegui fazer rodar usando diretamente o world:addCollisionClass no arquivo de load
end