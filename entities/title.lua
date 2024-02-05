-- entities/title.lua

local Concord = require 'lib.concord'
Concord.utils.loadNamespace 'components'
local Entity = Concord.entity

return function(messageList)
  local entity = Entity()
  local windowWidth, windowHeight = love.window.getMode()

  function entity:draw()
    love.graphics.setFont(love.graphics.newFont(50))
    local font = love.graphics.getFont()
    local text = love.graphics.newText(font)
    local fontHeight = font:getHeight()
    for index, message in ipairs(messageList) do
      -- for syntax: https://love2d.org/wiki/Text:add
      text:add(message, -font:getWidth(message)/2, 0, 0, 1, 1, 0, -fontHeight * (index - 1))
    end
    love.graphics.draw(text, windowWidth/2, windowHeight/4)
  end

  entity
  :give('drawable')

  return entity
end