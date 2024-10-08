return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.0",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 40,
  height = 20,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 8,
  nextobjectid = 90,
  properties = {},
  tilesets = {
    {
      name = "tileset",
      firstgid = 1,
      class = "",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 32,
      image = "newTileset.png",
      imagewidth = 512,
      imageheight = 256,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 512,
      tiles = {}
    },
    {
      name = "characters",
      firstgid = 513,
      class = "",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 4,
      image = "../sprites/characters/all-characters.png",
      imagewidth = 64,
      imageheight = 64,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 16,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 40,
      height = 20,
      id = 2,
      name = "ground",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297,
        297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297,
        297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297,
        297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297,
        297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297,
        297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297,
        297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297,
        297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297,
        297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297,
        297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297,
        297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297,
        297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297,
        297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297,
        297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297,
        297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297,
        297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297,
        297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297,
        297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297,
        297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297,
        297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297, 297
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 40,
      height = 20,
      id = 1,
      name = "buildings",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1073742150, 536871207, 536871207, 536871207, 536871207, 536871207, 536871207, 536871207, 536871207, 536871207, 536871207, 536871207, 536871238,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 295, 264, 265, 265, 265, 265, 265, 266, 264, 265, 265, 266, 2147483943,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 295, 296, 297, 297, 297, 298, 297, 297, 297, 297, 297, 297, 2147483943,
        1073742150, 2684354855, 2684354855, 2684354855, 2684354855, 2684354855, 2684354855, 2684354855, 2684354855, 2684354855, 2684354855, 2684354855, 2684354855, 2684354855, 2684354855, 2684354855, 2684354855, 2684354855, 536871238, 0, 0, 0, 0, 0, 0, 0, 0, 295, 328, 329, 330, 328, 329, 329, 329, 329, 329, 329, 330, 2147483943,
        295, 265, 265, 265, 265, 266, 264, 265, 265, 265, 265, 266, 264, 265, 265, 265, 265, 266, 2147483943, 0, 0, 0, 0, 0, 0, 0, 0, 295, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 2147483943,
        295, 297, 297, 298, 297, 297, 297, 297, 297, 296, 297, 297, 297, 297, 298, 297, 297, 297, 2147483943, 0, 0, 0, 0, 0, 0, 0, 0, 295, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 2147483943,
        295, 329, 330, 328, 329, 329, 329, 329, 330, 328, 329, 329, 329, 329, 329, 329, 329, 330, 2147483943, 0, 0, 0, 0, 0, 0, 0, 0, 295, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 2147483943,
        295, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 2147483943, 0, 0, 0, 0, 0, 0, 0, 0, 295, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 2147483943,
        295, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 2147483943, 0, 0, 0, 0, 0, 0, 0, 0, 295, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 2147483943,
        295, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 324, 536871207, 536871207, 536871207, 536871207, 536871207, 536871207, 536871207, 536871207, 2684354887, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 2147483943,
        295, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 3221225766, 264, 265, 266, 264, 265, 265, 265, 265, 266, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 2147483943,
        295, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 265, 297, 297, 297, 297, 297, 297, 297, 297, 298, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 2147483943,
        295, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 297, 328, 329, 329, 329, 329, 329, 329, 329, 330, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 2147483943,
        295, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 329, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 2147483943,
        295, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 2147483943,
        295, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 2147483943,
        295, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 1610613063, 3758096679, 3758096679, 3758096679, 3758096679, 3758096679, 3758096679, 3758096679, 3758096679, 327, 198, 197, 198, 197, 198, 197, 198, 197, 1610613063, 3758096679, 3758096679, 1610613062,
        295, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 230, 229, 2147483943, 0, 0, 0, 0, 0, 0, 0, 0, 1073742119, 230, 229, 230, 229, 230, 229, 230, 229, 2147483943, 0, 0, 0,
        295, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 198, 197, 2147483943, 0, 0, 0, 0, 0, 0, 0, 0, 295, 198, 197, 198, 197, 198, 197, 198, 197, 2147483943, 0, 0, 0,
        326, 1610613031, 1610613031, 1610613031, 1610613031, 1610613031, 1610613031, 1610613031, 1610613031, 1610613031, 1610613031, 1610613031, 1610613031, 1610613031, 1610613031, 1610613031, 1610613031, 1610613031, 2147483974, 0, 0, 0, 0, 0, 0, 0, 0, 295, 230, 229, 230, 229, 230, 229, 230, 229, 2147483943, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 40,
      height = 20,
      id = 3,
      name = "objects",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 77, 0, 0, 388, 388, 0, 356, 356, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 78, 0, 0, 0, 420, 420, 0, 0, 78, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 110, 0, 0, 0, 0, 0, 0, 0, 110, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 77, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 201, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2147483727, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 142, 0, 0, 0, 0, 0, 0, 0, 0, 0, 233, 0,
        0, 176, 0, 176, 0, 176, 523, 176, 0, 176, 0, 176, 0, 359, 0, 0, 0, 2147483759, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 174, 0, 109, 0, 169, 170, 171, 0, 109, 0, 0, 0,
        0, 176, 0, 176, 0, 176, 515, 176, 521, 176, 0, 176, 0, 359, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 141, 0, 0, 0, 0, 0, 141, 0, 0, 0,
        0, 176, 0, 176, 0, 176, 518, 176, 526, 176, 0, 176, 0, 359, 0, 108, 2147483792, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 173, 0, 0, 0, 0, 0, 173, 0, 0, 0,
        0, 176, 0, 176, 0, 176, 520, 176, 525, 176, 0, 176, 0, 0, 0, 140, 2147483824, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 109, 0, 0, 0, 0, 0, 109, 0, 0, 0,
        0, 176, 0, 176, 0, 176, 519, 176, 517, 176, 0, 176, 0, 0, 0, 172, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 141, 0, 0, 0, 0, 0, 141, 0, 0, 0,
        0, 176, 0, 176, 0, 176, 527, 176, 524, 176, 0, 176, 0, 0, 0, 0, 0, 0, 0, 0, 143, 0, 0, 0, 0, 0, 0, 0, 0, 0, 173, 0, 0, 0, 0, 0, 173, 0, 0, 0,
        0, 176, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 359, 0, 0, 0, 0, 0, 0, 175, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2147483790, 0,
        0, 176, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 359, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2147483822, 0,
        0, 176, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 359, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 202, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 176, 0, 176, 0, 176, 0, 176, 513, 176, 0, 176, 0, 359, 0, 0, 201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 234, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 176, 0, 176, 0, 176, 0, 176, 514, 176, 0, 176, 0, 359, 0, 0, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 79, 0, 0, 0, 0, 0, 0, 2147483824, 0, 0, 0, 0,
        0, 176, 0, 176, 0, 176, 0, 176, 522, 176, 0, 176, 0, 359, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 111, 0, 0, 0, 0, 0, 0, 2147483824, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2147483824, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 40,
      height = 20,
      id = 4,
      name = "objects2",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 144, 0, 144, 0, 144, 0, 144, 0, 144, 0, 144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 144, 0, 144, 0, 144, 0, 144, 0, 144, 0, 144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 144, 0, 144, 0, 144, 0, 144, 0, 144, 0, 144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 144, 0, 144, 0, 144, 0, 144, 0, 144, 0, 144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 144, 0, 144, 0, 144, 0, 144, 0, 144, 0, 144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 144, 0, 144, 0, 144, 0, 144, 0, 144, 0, 144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 144, 0, 144, 0, 144, 0, 144, 0, 144, 0, 144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 144, 0, 144, 0, 144, 0, 144, 0, 144, 0, 144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2147483792, 0, 0, 0, 0,
        0, 144, 0, 144, 0, 144, 0, 144, 0, 144, 0, 144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2147483792, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2147483792, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "walls",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 432,
          y = 64,
          width = 16,
          height = 144,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 624,
          y = 64,
          width = 16,
          height = 192,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 576,
          y = 256,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 576,
          y = 272,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 432,
          y = 256,
          width = 16,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 256,
          width = 144,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 272,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 96,
          width = 272,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 96,
          width = 16,
          height = 128,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "rectangle",
          x = 304,
          y = 192,
          width = 128,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "rectangle",
          x = 176.938,
          y = 112,
          width = 14.0625,
          height = 95,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "",
          type = "",
          shape = "rectangle",
          x = 48.9565,
          y = 257.875,
          width = 14.0657,
          height = 46.125,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 23,
          name = "",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 112,
          width = 15,
          height = 192,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 28,
          name = "",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 144,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 29,
          name = "",
          type = "",
          shape = "rectangle",
          x = 256.956,
          y = 162,
          width = 14.0464,
          height = 13,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "",
          type = "",
          shape = "rectangle",
          x = 272,
          y = 108.063,
          width = 16,
          height = 19.9375,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 34,
          name = "",
          type = "",
          shape = "rectangle",
          x = 512,
          y = 112,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 35,
          name = "",
          type = "",
          shape = "rectangle",
          x = 482.031,
          y = 123,
          width = 12,
          height = 35,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 38,
          name = "",
          type = "",
          shape = "rectangle",
          x = 610,
          y = 212.938,
          width = 14,
          height = 24.0625,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 39,
          name = "",
          type = "",
          shape = "rectangle",
          x = 448,
          y = 283.935,
          width = 16,
          height = 20.0653,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 40,
          name = "",
          type = "",
          shape = "rectangle",
          x = 560.913,
          y = 274,
          width = 15.087,
          height = 46,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 42,
          name = "",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 304,
          width = 272,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 46,
          name = "",
          type = "",
          shape = "rectangle",
          x = 465,
          y = 257.969,
          width = 13.9688,
          height = 14.0313,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 48,
          name = "",
          type = "",
          shape = "rectangle",
          x = 609.913,
          y = 101,
          width = 12.1304,
          height = 11,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 49,
          name = "",
          type = "",
          shape = "rectangle",
          x = 432,
          y = 48,
          width = 96,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 51,
          name = "",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 48,
          width = 80,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 55,
          name = "",
          type = "",
          shape = "rectangle",
          x = 578.031,
          y = 123,
          width = 12,
          height = 35,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 56,
          name = "",
          type = "",
          shape = "rectangle",
          x = 578.031,
          y = 171,
          width = 12,
          height = 35,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 57,
          name = "",
          type = "",
          shape = "rectangle",
          x = 482.031,
          y = 171,
          width = 12,
          height = 35,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 58,
          name = "",
          type = "",
          shape = "rectangle",
          x = 448,
          y = 101,
          width = 14,
          height = 24.0625,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 59,
          name = "",
          type = "",
          shape = "rectangle",
          x = 609.913,
          y = 101,
          width = 12.1304,
          height = 11,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 60,
          name = "",
          type = "",
          shape = "rectangle",
          x = 258,
          y = 277,
          width = 12.1304,
          height = 11,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 61,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144.938,
          y = 112,
          width = 14.0625,
          height = 95,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 62,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112.938,
          y = 112,
          width = 14.0625,
          height = 95,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 63,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80.938,
          y = 112,
          width = 14.0625,
          height = 95,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 64,
          name = "",
          type = "",
          shape = "rectangle",
          x = 49,
          y = 112,
          width = 14.0625,
          height = 95,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 65,
          name = "",
          type = "",
          shape = "rectangle",
          x = 49,
          y = 112,
          width = 14.0625,
          height = 95,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 89,
          name = "",
          type = "",
          shape = "rectangle",
          x = 49,
          y = 112,
          width = 14.0625,
          height = 95,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 66,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80.9565,
          y = 257.875,
          width = 14.0657,
          height = 46.125,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 67,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112.957,
          y = 257.875,
          width = 14.0657,
          height = 46.125,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 68,
          name = "",
          type = "",
          shape = "rectangle",
          x = 144.957,
          y = 257.875,
          width = 14.0657,
          height = 46.125,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 69,
          name = "",
          type = "",
          shape = "rectangle",
          x = 176.957,
          y = 257.875,
          width = 14.0657,
          height = 46.125,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 70,
          name = "",
          type = "",
          shape = "rectangle",
          x = 322.875,
          y = 196.938,
          width = 10.1875,
          height = 24.125,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 71,
          name = "",
          type = "",
          shape = "rectangle",
          x = 464,
          y = 60.063,
          width = 16,
          height = 19.9375,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 72,
          name = "",
          type = "",
          shape = "rectangle",
          x = 592,
          y = 60.063,
          width = 16,
          height = 19.9375,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 81,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 128,
          width = 16,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 83,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 256,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 84,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 256,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 86,
          name = "",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 112,
          width = 16,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
      name = "transitions",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 52,
          name = "toMain",
          type = "",
          shape = "rectangle",
          x = 528,
          y = 32,
          width = 32,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["destX"] = 325,
            ["destY"] = 355
          }
        },
        {
          id = 53,
          name = "toMain",
          type = "",
          shape = "rectangle",
          x = 448,
          y = 320,
          width = 128,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["destX"] = 325,
            ["destY"] = 470
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 7,
      name = "dialogues",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 76,
          name = "roteiro.pav.dialogo1",
          type = "",
          shape = "rectangle",
          x = 448,
          y = 256,
          width = 128,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["req"] = "roteiro.c3.dialogo2"
          }
        },
        {
          id = 77,
          name = "roteiro.pav.dialogo2",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 208,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["req"] = "roteiro.pav.dialogo1"
          }
        },
        {
          id = 78,
          name = "roteiro.pav.dialogo3",
          type = "",
          shape = "rectangle",
          x = 368,
          y = 208,
          width = 16,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {
            ["req"] = "roteiro.pav.dialogo2"
          }
        }
      }
    }
  }
}
