local gamestate = require "src.lib.gamestate"
local Light = require "src.lib.light"

local game = {}

local physicsWorld = {}
local lightWorld = {}

local gameCanvas = love.graphics.newCanvas()

function game:enter()
    lightWorld = Light({
        ambient = {55,55,55},         --the general ambient light in the environment
    })

    light = lightWorld:newLight(0, 0, 255, 125, 0, 200)
    circle = lightWorld:newImage(love.graphics.newImage("assets/meteorSmall.png"), 300, 300)
    circle:setNormalMap(love.graphics.newImage("assets/meteorSmallNormal.png"))
    circle:setShadowType("circle", circle.img:getHeight()/2)
end

function game:update(dt)
    local x, y
    love.graphics.setCanvas(gameCanvas)
        x, y = circle:getPosition()
        love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
        x, y = circle:getPosition()
        love.graphics.draw(circle.img, x - circle.img:getWidth()/2, y - circle.img:getHeight()/2)
    love.graphics.setCanvas()

    light:setPosition(love.mouse.getX(), love.mouse.getY())
    lightWorld:update(dt)
end

function game:draw()
    love.graphics.push()
        lightWorld:draw(function(l, t, w, h, s)
            love.graphics.draw(gameCanvas)
        end)
    love.graphics.pop()
end

return game
