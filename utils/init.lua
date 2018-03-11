local modulePath = (...):match("(.-)[^%.]+$")

local utils = {}

utils.colors = require(modulePath .. 'colors')
utils.math = require(modulePath .. 'math')

return utils
