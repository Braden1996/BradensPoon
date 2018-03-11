local TreeNode = require('spoons.i4wm.model.tree_node')

describe('TreeNode', function()
  local rootNode = nil

  before_each(function()
    rootNode = TreeNode()
  end)

  describe('remove()', function()
    it('remove a node from its parent', function()
      local childNode = TreeNode()

      rootNode:addChild(childNode)

      childNode:remove()

      assert.is.equal(0, #rootNode.children)
      assert.is_nil(childNode.parent)
    end)
  end)

  describe('addChild()', function()
    it('add a node to be the child of another', function()
      local childNode = TreeNode()

      rootNode:addChild(childNode)

      assert.same(rootNode.children, { childNode })
      assert.is.equal(childNode.parent, rootNode)
    end)
  end)

  describe('insertChild()', function()
    it('add node between two existing child nodes', function()
      local childNode = TreeNode()
      local childNode2 = TreeNode()

      rootNode:addChild(childNode)
      rootNode:addChild(childNode2)

      local childNode3 = TreeNode()
      rootNode:insertChild(2, childNode3)

      assert.same(rootNode.children, { childNode, childNode2, childNode3 })
    end)
  end)

  describe('removeChild()', function()
    it('remove an unwanted child node', function()
      local childNode = TreeNode()

      rootNode:addChild(childNode)

      rootNode:removeChild(childNode)

      assert.is.equal(#rootNode.children, 0)
    end)
  end)
end)
