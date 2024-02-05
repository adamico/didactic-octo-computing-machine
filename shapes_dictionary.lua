-- shapes_dictionary.lua

local physics = love.physics

local shapesDict = {
  circle = {
    drawFunction = function (mode, body, shape)
      local positionX, positionY = body:getWorldCenter()
      return love.graphics.circle(mode, positionX, positionY, shape:getRadius())
    end,
    physicsFunction = function (dimensions)
      return physics.newCircleShape(dimensions.radius)
    end
  },
  rectangle = {
    drawFunction = function (mode, body, shape)
      return love.graphics.polygon(mode, body:getWorldPoints(shape:getPoints()))
    end,
    physicsFunction = function (dimensions)
      return physics.newRectangleShape(dimensions.width, dimensions.height)
    end
  }
}

return shapesDict