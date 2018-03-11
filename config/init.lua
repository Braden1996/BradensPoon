local modulePath = (...):match("(.-)[^%.]+$")
local defaults = require(modulePath .. 'default')
local personal = require(modulePath .. 'personal')

return pl.tablex.merge(defaults, personal, true)
