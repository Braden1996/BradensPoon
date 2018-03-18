local class, List = pl.class, pl.List

local TreeNode = class()

function TreeNode:_init()
  self.parent = nil
  self.children = List()
end

function TreeNode:remove()
  if self.parent == nil then
    error('Unable to remove a node that is without a parent.')
  end

  self.parent:removeChild(self)
end

function TreeNode:addChild(childNode)
  self:insertChild(#self.children + 1, childNode)
end

function TreeNode:removeChild(childNode)
  if self.children:index(childNode) == nil then
    error([[
      Unable to remove child, as the given node is not in the list of children.
    ]])
  end

  childNode.parent = nil
  self.children:remove_value(childNode)
end

function TreeNode:insertChild(index, childNode)
  if childNode.parent ~= nil then
    childNode.parent:removeChild(childNode);
  end

  childNode.parent = self;
  self.children:insert(index, childNode)
end

function TreeNode:adoptChildrenFrom(node)
  local adoptChildrenIndex = self.children:index(node)

  for adoptChild in node.children:clone():reverse():iter() do
    if adoptChildrenIndex == nil then
      self:addChild(adoptChild)
    else
      self:insertChild(adoptChildrenIndex + 1, adoptChild)
    end
  end
end

return TreeNode
