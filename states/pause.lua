-- states/pause.lua

local manager = StateManager

local pause = {}

local input = require 'input'

local windowWidth, windowHeight = love.window.getMode()

function pause:draw()
	love.graphics.print('Game paused', windowWidth/2, windowHeight/2)
end

function pause:update()
  if not input.paused then
    manager:pop(love.math.random(), love.math.random())
  end
end

return pause