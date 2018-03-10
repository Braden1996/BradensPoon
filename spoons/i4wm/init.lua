local modulePath = (...):match("(.-)[^%.]+$")

require(modulePath .. 'border')
