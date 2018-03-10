local modulePath = (...):match("(.-)[^%.]+$")
require(modulePath .. 'dependencies')

local utils = {}

utils.colors = require(modulePath .. 'colors')
utils.math = require(modulePath .. 'math')

return utils
