-- entity_creator.lua

local creator = {}

local engine = require 'engine'

local screenWidth, screenHeight = love.window.getMode()

function creator.createTitle(message)
  local title = require('entities.title')(message)
  engine:addEntity(title)
end

function creator.createGame()
  creator.createPlayer()
end

function creator.createPlayer()
  local player = require('entities.player')(
    {
      x = screenWidth/2,
      y = screenHeight/2
    },
    'kinematic', 'circle', 'fill',
    { radius = 50 },
    {
      xValue = 500,
      yValue = 500,
      xDelta = 0,
      yDelta = 0
    }
  )
  engine:addEntity(player)
end

return creator