local fromHex = poon.utils.colors.fromHex
local round = poon.utils.math.round
local spaces = require "hs._asm.undocumented.spaces"

local borderSize = 3
local borderRadius = 6
local border = hs.drawing.rectangle(hs.geometry.rect(0, 0, 0, 0))
border:setStrokeWidth(borderSize)
border:setStrokeColor(fromHex('#81ecec'))
border:setRoundedRectRadii(borderRadius, borderRadius)
border:setStroke(true):setFill(false)
border:setLevel("floating")
border:setBehavior(hs.drawing.windowBehaviors.moveToActiveSpace)
border:hide()

function isValidTilingWindow(window)
    return window:isStandard() and
        window:isVisible() and
        not window:isFullscreen()
end

function updateWindowBorder()
    local window = hs.window.focusedWindow()
    if window == nil or not isValidTilingWindow(window) then
        border:hide()
        return
    end

    border:show()

    local borderSizeOffset = math.floor(borderSize / 2)
    local windowFrame = window:frame()
    border:setFrame(hs.geometry.rect(
        windowFrame.x - borderSizeOffset,
        windowFrame.y - borderSizeOffset,
        windowFrame.w + (borderSizeOffset * 2),
        windowFrame.h + (borderSizeOffset * 2)
    ))
end

updateWindowBorder()

local windows = hs.window.filter.new(nil)
windows:subscribe(hs.window.filter.windowFocused, updateWindowBorder)
windows:subscribe(hs.window.filter.windowUnfocused, updateWindowBorder)
windows:subscribe(hs.window.filter.windowMoved, updateWindowBorder)
windows:subscribe(hs.window.filter.windowDestroyed, updateWindowBorder)
local spaceChangeEvent = hs.spaces.watcher.new(updateWindowBorder)
spaceChangeEvent:start()
