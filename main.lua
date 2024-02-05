-- main.lua

local love = require 'love'

local vudu = require 'lib.vudu'
StateManager = require 'lib.roomy'.new()

local engine = require 'engine'
local world = require 'world'

local input = require 'input'

function love.load()
  vudu.initialize()
  vudu.physics.setWorld(world)
  StateManager:hook()
	StateManager:enter(require 'states.title')
  
  engine:addSystems(
    require('systems.draw_system'),
    require('systems.physics_system')
  )
end

love.keypressed = function(pressed_key)
  input.press(pressed_key)
end

love.keyreleased = function(released_key)
  input.release(released_key)
end