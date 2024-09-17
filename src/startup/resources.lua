sprites = {}
sprites.playerSheet = love.graphics.newImage('sprites/sheets/playerSheet.png')
sprites.enemySheet = love.graphics.newImage('sprites/sheets/enemySheet.png')
sprites.vagnerSheet = love.graphics.newImage('sprites/sheets/vagnerSheet.png')
sprites.coinSheet = love.graphics.newImage('sprites/sheets/coinSheet.png')
sprites.burgerSheet = love.graphics.newImage('sprites/sheets/burgerSheet.png')
sprites.bulletSheet = love.graphics.newImage('sprites/sheets/bulletSheet.png')
sprites.upgradedBulletSheet = love.graphics.newImage('sprites/sheets/upgradedBulletSheet.png')
sprites.berriSheet = love.graphics.newImage('sprites/sheets/berriSheet.png')
sprites.bossSheet = love.graphics.newImage('sprites/sheets/bossSheet.png')
sprites.bookSheet = love.graphics.newImage('sprites/sheets/bookSheet.png')

sprites.characters = {}
sprites.characters.tiaguin = love.graphics.newImage('sprites/characters/tiaguin.png')
sprites.characters.tiago = love.graphics.newImage('sprites/characters/tiago.png')
sprites.characters.henrique = love.graphics.newImage('sprites/characters/henrique.png')
sprites.characters.vicenzo = love.graphics.newImage('sprites/characters/vicenzo.png')
sprites.characters.caio = love.graphics.newImage('sprites/characters/caio.png')
sprites.characters.bibliotecaria = love.graphics.newImage('sprites/characters/bibliotecaria.png')

sprites.portraits = {}
sprites.portraits.berri = love.graphics.newImage('sprites/portraits/berri-portrait.png')
sprites.portraits.vagner = love.graphics.newImage('sprites/portraits/vagner-portrait.png')
sprites.portraits.tiaguin = love.graphics.newImage('sprites/portraits/tiaguin-portrait.png')
sprites.portraits.tiago = love.graphics.newImage('sprites/portraits/tiago-portrait.png')
sprites.portraits.caio = love.graphics.newImage('sprites/portraits/caio-portrait.png')
sprites.portraits.henrique = love.graphics.newImage('sprites/portraits/henrique-portrait.png')
sprites.portraits.vicenzo = love.graphics.newImage('sprites/portraits/vicenzo-portrait.png')
sprites.portraits.bibliotecaria = love.graphics.newImage('sprites/portraits/bibliotecaria-portrait.png')

sprites.hud = {}
sprites.hud.fullHeart = love.graphics.newImage('sprites/ui/fullHeart.png')
sprites.hud.emptyHeart = love.graphics.newImage('sprites/ui/emptyHeart.png')
sprites.hud.berriFace = love.graphics.newImage('sprites/ui/berriFace.png')
sprites.hud.coinIcon = love.graphics.newImage('sprites/ui/coinIcon.png')
sprites.hud.hamburguer = love.graphics.newImage('sprites/ui/hamburguer.png')
sprites.hud.title = love.graphics.newImage('sprites/ui/title.png')
sprites.hud.startingText = love.graphics.newImage('sprites/ui/startingText.png')
sprites.hud.titleBackground = love.graphics.newImage('sprites/ui/titleBackground.png')
sprites.hud.textBox = love.graphics.newImage('sprites/ui/textBox.png')
sprites.hud.dialogBackground = love.graphics.newImage('sprites/ui/dialogBackground.png')
sprites.hud.credits = love.graphics.newImage('sprites/ui/credits.png')

fonts = {}
fonts.default = love.graphics.newFont('fonts/pixel-font.ttf', 20)
fonts.bigger = love.graphics.newFont('fonts/pixel-font.ttf', 30)

sounds = {}
sounds.menuSong = love.audio.newSource("sounds/musics/menuMusic.mp3" , "stream")
