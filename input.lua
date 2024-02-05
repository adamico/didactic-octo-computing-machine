-- input.lua

local input = {}

local press_functions = {}
local release_functions = {}

input.left = false
input.right = false
input.up = false
input.down = false

input.paused = false

input.press = function(pressedKey)
  if press_functions[pressedKey] then
    press_functions[pressedKey]()
  end
end

input.release = function(releasedKey)
  if release_functions[releasedKey] then
    release_functions[releasedKey]()
  end
end

input.toggle_focus = function(focused)
  if not focused then
    input.paused = true
  end
end

function press_functions.left()
  input.left = true
end

function press_functions.right()
  input.right = true
end

function press_functions.up()
  input.up = true
end

function press_functions.down()
  input.down = true
end

function press_functions.space()
  input.paused = not input.paused
end

function press_functions.escape()
  love.event.quit()
end

function release_functions.left()
  input.left = false
end

function release_functions.right()
  input.right = false
end

function release_functions.up()
  input.up = false
end

function release_functions.down()
  input.down = false
end


return input