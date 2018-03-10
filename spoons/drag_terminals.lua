local merge = pl.tablex.merge
local fromHexAlpha = poon.utils.colors.fromHexAlpha

local color = fromHexAlpha('#81ecec', 0.5)
local endColor = fromHexAlpha('#00cec9', 0.5)
local strokeColor = merge(color, { alpha=1 }, true)

local rectanglePreview = hs.drawing.rectangle(hs.geometry.rect(0, 0, 0, 0))
rectanglePreview:setStrokeWidth(2)
rectanglePreview:setStrokeColor(strokeColor)
rectanglePreview:setFillGradient(color, endColor, 45)
rectanglePreview:setRoundedRectRadii(2, 2)
rectanglePreview:setStroke(true):setFill(true)
rectanglePreview:setLevel("floating")

local function openIterm()
  local frame = rectanglePreview:frame()
  local createItermWithBounds = string.format([[
    if application "iTerm" is not running then
      activate application "iTerm"
    end if
    tell application "iTerm"
      set newWindow to (create window with default profile)
      set the bounds of newWindow to {%i, %i, %i, %i}
    end tell
  ]], frame.x, frame.y, frame.x + frame.w, frame.y + frame.h)
  hs.osascript.applescript(createItermWithBounds)
end

local fromPoint = nil

local drag_event = hs.eventtap.new(
  { hs.eventtap.event.types.mouseMoved },
  function(e)
    local toPoint = hs.mouse.getAbsolutePosition()
    local newFrame = hs.geometry.new({
      x1 = fromPoint.x,
      y1 = fromPoint.y,
      x2 = toPoint.x,
      y2 = toPoint.y,
    })
    rectanglePreview:setFrame(newFrame)

    return nil
  end
)

local flags_event = hs.eventtap.new(
  { hs.eventtap.event.types.flagsChanged },
  function(e)
    local flags = e:getFlags()
    if flags.ctrl and flags.shift then
      fromPoint = hs.mouse.getAbsolutePosition()
      local startFrame = hs.geometry.rect(fromPoint.x, fromPoint.y, 0, 0)
      rectanglePreview:setFrame(startFrame)
      drag_event:start()
      rectanglePreview:show()
    elseif fromPoint ~= nil then
      fromPoint = nil
      drag_event:stop()
      rectanglePreview:hide()
      openIterm()
    end
    return nil
  end
)
flags_event:start()

