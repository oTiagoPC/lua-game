shaders = {}

shaders.flash = love.graphics.newShader[[
    vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
        vec4 pixel = Texel(texture, texture_coords);
        if (pixel.a == 1) {
            pixel = vec4(1, 1, 1, 1);
        } else {
            pixel = vec4(0, 0, 0, 0);
        }
        return pixel * color;
    }
]]