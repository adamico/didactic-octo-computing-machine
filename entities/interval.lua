-- entities/interval.lua

local Concord = require 'lib.concord'
Concord.utils.loadNamespace 'components'
local Entity = Concord.entity

local function split(inputString, separator)
  if separator == nil then
    separator = "%s"
  end
  local returnTable = { }
  for str in string.gmatch(inputString, "([^"..separator.."]+)") do
    table.insert(returnTable, str)
  end
  return returnTable
end

return function (data, position, dimensions, color)
  local entity = Entity()

  function entity:draw()
    love.graphics.setColor(color)
    love.graphics.rectangle('line', position.x, position.y, dimensions.width, dimensions.height)
    love.graphics.setFont(love.graphics.newFont(20))
    local font = love.graphics.getFont()
    local text = love.graphics.newText(font)
    local fontHeight = font:getHeight()
    for index, datum in ipairs(split(data, " ")) do
      local datumWidth = font:getWidth(datum)
      local x = -datumWidth/2
      text:add(datum, x, 0, 0, 1, 1, 0, -fontHeight * (index - 1))
    end
    love.graphics.draw(text, position.x + dimensions.width/2, position.y)
  end

  function entity:update(dt)
  end

  entity
  :give('drawable')

  return entity
end