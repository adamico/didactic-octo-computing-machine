-- components/physics.lua

local Concord = require 'lib.concord'
local physics = Concord.component('physics', function(component, body, shape, fixture)
  component.body = body
  component.shape = shape
  component.fixture = fixture
end)

return physics