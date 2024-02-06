-- entities/timeline.lua

local Concord = require 'lib.concord'
Concord.utils.loadNamespace 'components'
local Entity = Concord.entity

return function (position, dimensions, color)
  local entity = Entity()

  function entity:draw()
    love.graphics.setColor(color)
    love.graphics.rectangle('fill', position.x, position.y, dimensions.width, dimensions.height)
  end
  
  function entity:update(dt)
  end

  entity
  :give('drawable')

  return entity
end