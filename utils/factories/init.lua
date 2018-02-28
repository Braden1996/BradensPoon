local modulePath = (...):match("(.-)[^%.]+$")

return function()
  local factories = {}

  factories.colors = require(modulePath .. 'colors')

  return factories
end
