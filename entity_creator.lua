-- entity_creator.lua

local creator = {}

local engine = require 'engine'

local screenWidth, screenHeight = love.window.getMode()

local timelineThickness = 50
local timelinePosition = {
  x = timelineThickness,
  y = screenWidth/2 - screenHeight/2 + timelineThickness/2
}
local timelineDimensions = {
  width = screenWidth - timelineThickness*2,
  height = timelineThickness
}

function creator.createTitle(message)

  local title = require('entities.title')(message)
  engine:addEntity(title)
end

function creator.createGame()
  creator.createTimeline()
  creator.createTimeArrow()
end

function creator.createTimeline()
  local color = {1, 1, 1}
  local timeline = require('entities.timeline')(
    timelinePosition,
    timelineDimensions,
    color
  )
  engine:addEntity(timeline)
end

function creator.createTimeArrow()
  local positionLimits = {
    left = timelinePosition.x,
    right = timelinePosition.x + timelineDimensions.width
  }
  local timearrow = require('entities.timearrow')(
    {
      x = screenWidth/2,
      y = screenHeight/2 - timelineThickness*2 + 20
    },
    'kinematic', 'triangle', 'line',
    {0.8, 0.2, 0.2},
    { side = 40 },
    positionLimits
  )
  engine:addEntity(timearrow)
end

return creator