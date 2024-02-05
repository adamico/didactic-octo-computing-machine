-- entities/player.lua

local Concord = require 'lib.concord'
Concord.utils.loadNamespace 'components'
local Entity = Concord.entity

local world = require 'world'
local input = require 'input'

local physics = love.physics

local shapesDict = require 'shapes_dictionary'

return function (position, bodyType, shapeType, drawMode, dimensions, velocity)
  local entity = Entity()

  local body = physics.newBody(world, position.x, position.y, bodyType)
  local shape = shapesDict[shapeType].physicsFunction(dimensions)
  local fixture = physics.newFixture(body, shape)
  fixture:setUserData(entity)

  function entity:draw()
    shapesDict[shapeType].drawFunction(drawMode, body, shape)
  end

  function entity:update(dt)
    if input.left then
      velocity.xDelta = -1
    elseif input.right then
      velocity.xDelta = 1
    else
      velocity.xDelta = 0
    end

    if input.up then
      velocity.yDelta = -1
    elseif input.down then
      velocity.yDelta = 1
    else
      velocity.yDelta = 0
    end

    if velocity.xDelta ~= 0 and velocity.yDelta ~= 0 then
      velocity.xDelta = velocity.xDelta * math.sqrt(2)/2
      velocity.yDelta = velocity.yDelta * math.sqrt(2)/2
    end
    body:setLinearVelocity(velocity.xValue * velocity.xDelta , velocity.yValue * velocity.yDelta )
  end

  entity
  :give('physics', body, shape, fixture)
  :give('drawable')

  return entity
end