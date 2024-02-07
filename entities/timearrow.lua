-- entities/timearrow.lua

local love = require 'love'

local Concord = require 'lib.concord'
Concord.utils.loadNamespace 'components'
local Entity = Concord.entity

local world = require 'world'
local input = require 'input'

local physics = love.physics
local lg = love.graphics

local shapesDict = require 'shapes_dictionary'

-- Clamps a value to a certain range.
-- @param min - The minimum value.
-- @param val - The value to clamp.
-- @param max - The maximum value.
--
function Clamp(min, val, max)
  return math.max(min, math.min(val, max));
end

return function (position, bodyType, shapeType, drawMode, color, dimensions, positionLimits, bodyMovingStep)
  local entity = Entity()

  local bodyPositionX, bodyPositionY = position.x, position.y
  local side = dimensions.side

  local body = physics.newBody(world, bodyPositionX, bodyPositionY, bodyType)

  local vertices = {
    -side/2, -side/2,
    side/2, -side/2,
    0, side/2
  }

  local shape = shapesDict[shapeType].physicsFunction(vertices)
  local fixture = physics.newFixture(body, shape)
  fixture:setUserData(entity)

  function entity:draw()
    lg.setColor(color)
    shapesDict[shapeType].drawFunction(drawMode, body, shape)
  end

  local leftWasNotPressed, rightWasNotPressed

  function entity:update(dt)
    local bodyMovingDirection = 0
    local currentBodyPositionX = body:getX()

    if not input.left then
      leftWasNotPressed = true
    end
    if not input.right then
      rightWasNotPressed = true
    end
    if input.left and leftWasNotPressed then
      leftWasNotPressed = false
      bodyMovingDirection = -1
    elseif input.right and rightWasNotPressed then
      rightWasNotPressed = false
      bodyMovingDirection = 1
    end

    currentBodyPositionX = currentBodyPositionX + bodyMovingStep * bodyMovingDirection
    body:setX(Clamp(positionLimits.left, currentBodyPositionX, positionLimits.right))
  end

  local animationTimer = 0
  function entity:animate(dt)
    animationTimer = animationTimer + dt
    local newBodyPositionY = math.floor(bodyPositionY + math.sin(animationTimer*8)*4)
    body:setY(newBodyPositionY)
  end

  entity
  :give('physics', body, shape)
  :give('drawable')
  :give('animation')

  return entity
end