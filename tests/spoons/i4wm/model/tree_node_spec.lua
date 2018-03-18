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

    it('remove node from former parent', function()
      local oldRootNode = TreeNode()
      local childNode = TreeNode()
      oldRootNode:addChild(childNode)

      rootNode:addChild(childNode)
      assert.is.equal(0, #oldRootNode.children)
      assert.same(rootNode.children, { childNode })
    end)
  end)

  describe('removeChild()', function()
    it('remove an unwanted child node', function()
      local childNode = TreeNode()
      rootNode:addChild(childNode)

      rootNode:removeChild(childNode)
      assert.is.equal(0, #rootNode.children)
    end)
  end)

  describe('adoptChildrenFrom()', function()
    it('remove all children and give them to the parent', function()
      local containerNode = TreeNode()
      local childNode = TreeNode()
      local childNode2 = TreeNode()
      rootNode:addChild(containerNode)
      containerNode:addChild(childNode)
      containerNode:addChild(childNode2)

      rootNode:adoptChildrenFrom(containerNode)
      assert.is.equal(0, #containerNode.children)
      assert.same({ containerNode, childNode, childNode2 }, rootNode.children)
    end)

    it('give children to the parent in its former place', function()
      local siblingNode1 = TreeNode()
      local containerNode = TreeNode()
      local siblingNode2 = TreeNode()
      local childNode = TreeNode()
      local childNode2 = TreeNode()
      rootNode:addChild(siblingNode1)
      rootNode:addChild(containerNode)
      rootNode:addChild(siblingNode2)
      containerNode:addChild(childNode)
      containerNode:addChild(childNode2)

      rootNode:adoptChildrenFrom(containerNode)
      assert.same(
        { siblingNode1, containerNode, childNode, childNode2, siblingNode2 },
        rootNode.children
      )
    end)
  end)
end)
