local modulePath = (...):match("(.-)[^%.]+$")
local RectNode = require(modulePath .. 'rect_node')

local class = pl.class

local ContainerNode = class(RectNode)

function ContainerNode:_init(containerRect)
  self:super(containerRect)

  self.adopting = false
end

function ContainerNode:removeChild(childNode)
  RectNode.removeChild(self, childNode);
  if not self.adopting and #self.children == 1 then
    self.adopting = true
    self.parent:adoptChildrenFrom(self)
    self.adopting = false

    self:remove()
  end
end

return ContainerNode
