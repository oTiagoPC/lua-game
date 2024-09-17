local bookInstance = nil
bookCollected = false

function createUniqueBook(x, y)
    if bookInstance then
        return -- Não permite criar mais de uma instância
    end

    local book = {}
    book.x = x
    book.y = y
    book.collider = world:newRectangleCollider(book.x, book.y, 12, 11)
    book.collider:setCollisionClass('Book')
    book.collider:setFixedRotation(true)
    book.collider:setType("static")
    book.collider:setObject(book)

    book.grid = anim8.newGrid(12, 11, sprites.bookSheet:getWidth(), sprites.bookSheet:getHeight())
    book.animation = anim8.newAnimation(book.grid('1-4', 1), 0.2)
    book.collected = false

    function book:draw()
        if not book.collected then
            book.animation:draw(sprites.bookSheet, book.x, book.y, nil, 1)
        end
    end

    function book:collect()
        book.collected = true
        bookCollected = true
        id = 'roteiro.biblio.dialogo2'
        previousDialog = 'roteiro.biblio.dialogo2'
        world.dialogoAtual = roteiro.biblio.dialogo2
        playDialog(id)
        player.maxHealth = 7
        player.health = player.health + 2 
    end

    function book:update(dt)
        if distanceBetween(book.x, book.y, player.x, player.y) < 30 and not book.collected then
            book:collect()
        end

        if not book.collected then
            book.animation:update(dt)
        else
            book.collider:destroy()
            bookInstance = nil -- Limpa a referência após ser coletado
        end
    end

    bookInstance = book
    return book
end

-- Funções de atualização e desenho para serem chamadas no loop principal
function updateBook(dt)
    if bookInstance then
        bookInstance:update(dt)
    end
end

function drawBook()
    if bookInstance then
        bookInstance:draw()
    end
end