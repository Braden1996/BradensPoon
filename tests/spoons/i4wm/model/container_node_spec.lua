local RectNode = require('spoons.i4wm.model.rect_node')
local ContainerNode = require('spoons.i4wm.model.container_node')

describe('ContainerNode', function()
  local rootNode = nil
  local initRect = { x = 0, y = 0, w = 100, h = 100 }

  before_each(function()
    rootNode = RectNode(initRect)
  end)

  describe('removeChild()', function()
    local containerNode, childNode, childNode2

    before_each(function()
      containerNode = ContainerNode(initRect)
      childNode = RectNode({ x = 0, y = 0, w = 50, h = 100 })
      childNode2 = RectNode({ x = 50, y = 0, w = 50, h = 100 })

      rootNode:addChild(containerNode)
      containerNode:addChild(childNode)
      containerNode:addChild(childNode2)
    end)

    it('should remove itself when left with a single child', function()
      assert.is.equal(rootNode, containerNode.parent)

      childNode2:remove()
      assert.is.equal(nil, containerNode.parent)
    end)

    it('should give up last child to parent', function()
      assert.is.equal(1, #rootNode.children)
      assert.is.equal(containerNode, rootNode.children[1])

      childNode2:remove()
      assert.is.equal(1, #rootNode.children)
      assert.is.equal(childNode, rootNode.children[1])
    end)
  end)
end)
