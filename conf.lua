-- conf.lua
-- LÖVE configuration file

love.conf = function(app)
  app.console = true        -- Enable the debug console for Windows.
  app.window.width = 1280   -- Game's screen width (number of pixels)
  app.window.height = 720   -- Game's screen height (number of pixels)
  app.window.title = 'The Choice Engine'
  app.window.icon = nil
  app.modules.joystick = false
end