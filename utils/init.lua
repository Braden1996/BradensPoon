local modulePath = (...):match("(.-)[^%.]+$")
require(modulePath .. 'dependencies')

local utils = {}

utils.colors = require(modulePath .. 'colors')

return utils
