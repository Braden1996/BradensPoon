local modulePath = (...):match("(.-)[^%.]+$")

if poon.config.debug_mode then
  require(modulePath .. 'i4wm.init')
end
require(modulePath .. 'drag_terminals')
