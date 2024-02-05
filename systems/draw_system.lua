-- systems/draw_system.lua

local Concord = require 'lib.concord'
local components = require 'components'

local drawSystem = Concord.system({
  pool = { 'drawable' }
})

function drawSystem:draw()
  for _, entity in ipairs(self.pool) do
    if entity.draw then entity:draw() end
  end
end

return drawSystem