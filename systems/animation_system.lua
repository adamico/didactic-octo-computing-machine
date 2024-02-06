-- systems/animation_system.lua

local Concord = require 'lib.concord'
local components = require 'components'

local animationSystem = Concord.system({
  pool = { 'animation' }
})

function animationSystem:update(dt)
  for _, entity in ipairs(self.pool) do
    if entity.animate then entity:animate(dt) end
  end
end

return animationSystem