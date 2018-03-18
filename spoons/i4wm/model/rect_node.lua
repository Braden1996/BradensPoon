local modulePath = (...):match("(.-)[^%.]+$")
local TreeNode = require(modulePath .. 'tree_node')

local class, copy, merge = pl.class, pl.tablex.copy, pl.tablex.merge

local RectNode = class(TreeNode)

function RectNode:_init(containerRect)
  self:super()

  self.containerRect = containerRect
  self.contentRect = nil

  self._margin = { top = 0, right = 0, bottom = 0, left = 0 }
  self:_updateContentRect()
end

function RectNode:setMargin(options)
  local o = type(options) == 'table' and copy(options) or { margin = options }

  if o.margin and not o.vertical then o.vertical = o.margin end
  if o.margin and not o.horizontal then o.horizontal = o.margin end
  if o.vertical and not o.top then o.top = o.vertical end
  if o.vertical and not o.bottom then o.bottom = o.vertical end
  if o.horizontal and not o.right then o.right = o.horizontal end
  if o.horizontal and not o.left then o.left = o.horizontal end

  self._margin = merge(
    self._margin,
    { top = o.top, right = o.right, bottom = o.bottom, left = o.left },
    true
  )
end

function RectNode:_applyMarginTransform(rect)
  return {
    x = rect.x + self._margin.left,
    y = rect.y + self._margin.top,
    w = rect.w - self._margin.left - self._margin.right,
    h = rect.h - self._margin.top - self._margin.bottom
  }
end

function RectNode:_updateContentRect()
  self.contentRect = self:_applyMarginTransform({
    x = self.containerRect.x,
    y = self.containerRect.y,
    w = self.containerRect.w,
    h = self.containerRect.h
  })
end

return RectNode
