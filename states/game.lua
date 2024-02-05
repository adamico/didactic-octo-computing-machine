-- states/game.lua

local manager = StateManager

local game = {}

local pause = require 'states.pause'

local engine = require 'engine'
local world = require 'world'
local input = require 'input'

love.focus = function(focused)
  input.toggle_focus(focused)
end

function game:pause(...)
	print('pause', ...)
end

function game:resume(...)
	print('resume', ...)
end

function game:enter(previous, ...)
  require('entity_creator').createGame()
end

function game:leave(next, ...)
  engine.clear()
end

function game:update(dt)
  if input.paused then manager:push(pause) end
  engine:emit('update', dt)
  world:update(dt)
end

function game:draw()
  engine:emit('draw')
end

return game