-- states/title.lua

local manager = StateManager

local title = {}

local game = require 'states.game'

local engine = require 'engine'

local creator = require('entity_creator')

function title:keypressed(key)
	if key == 'return' then
		manager:enter(game)
	end
end

function title:enter(previous, ...)
	local messageList = {
		'Game Title',
		'',
		'Press Enter to start'
	}
	creator.createTitle(messageList)
end

function title:leave(next, ...)
  engine:clear()
end

function title:update(dt)
	engine:emit('update', dt)
end

function title:draw()
	engine:emit('draw')
end

return title