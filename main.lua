local gamestate = require 'src.lib.gamestate'
local intro = require 'src.gamestate.intro'

function love.load()
    love.math.setRandomSeed(os.clock())
    love.graphics.setDefaultFilter("nearest", "nearest")
    gamestate.registerEvents()
    gamestate.switch(intro)
end
