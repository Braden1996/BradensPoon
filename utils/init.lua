local modulePath = (...):match("(.-)[^%.]+$")
require(modulePath .. 'dependencies')

return function()
  local utils = {}

  pl.tablex.update(utils, require(modulePath .. 'factories.init')(), true)

  return utils
end
