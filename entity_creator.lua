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
local intervalsNumber = 7
local intervalWidth = timelineDimensions.width / intervalsNumber

function creator.createTitle(message)

  local title = require('entities.title')(message)
  engine:addEntity(title)
end

function creator.createGame()
  creator.createTimeline()
  creator.createIntervals()
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

-- TODO: fix pixel fraction glitch 
function creator.createIntervals()
  local intervalColor = {0, 0, 0}
  local data = { "", "", "", "", "", "", "! ???"}
  for i = 1, intervalsNumber do
    local interval = require('entities.interval')(
      data[i],
      { x = timelinePosition.x + (i - 1) * intervalWidth, y = timelinePosition.y },
      { width = intervalWidth, height = timelineDimensions.height },
      intervalColor
    )
    engine:addEntity(interval)
  end
end

function creator.createTimeArrow()
  local positionXLimits = {
    left = timelinePosition.x + intervalWidth / 2,
    right = timelinePosition.x + timelineDimensions.width - intervalWidth / 2
  }
  local bodyMovingStep = intervalWidth
  local timearrow = require('entities.timearrow')(
    {
      x = positionXLimits.right,
      y = screenHeight/2 - timelineThickness*2 + 20
    },
    'kinematic', 'triangle', 'line',
    {0.8, 0.2, 0.2},
    { side = 40 },
    positionXLimits,
    bodyMovingStep
  )
  engine:addEntity(timearrow)
end

return creator