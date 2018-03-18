local RectNode = require('spoons.i4wm.model.rect_node')

describe('RectNode', function()
  local rootNode = nil
  local initRect = { x = 0, y = 0, w = 100, h = 100 }

  before_each(function()
    rootNode = RectNode(initRect)
  end)

  describe('_applyMarginTransform()', function()
    it('should apply margin to all sides', function()
      rootNode:setMargin(10)
      local newRect = rootNode:_applyMarginTransform(rootNode.containerRect)
      assert.same({ x = 10, y = 10, w = 80, h = 80 }, newRect)
    end)

    it('should apply margin to only vertical sides', function()
      rootNode:setMargin{ vertical = 10 }
      local newRect = rootNode:_applyMarginTransform(rootNode.containerRect)
      assert.same({ x = 0, y = 10, w = 100, h = 80 }, newRect)
    end)

    it('should apply margin to only horizontal sides', function()
      rootNode:setMargin{ horizontal = 10 }
      local newRect = rootNode:_applyMarginTransform(rootNode.containerRect)
      assert.same({ x = 10, y = 0, w = 80, h = 100 }, newRect)
    end)

    it('should apply margin to individual sides', function()
      rootNode:setMargin{ top = 10, right = 20, bottom = 30, left = 40 }
      local newRect = rootNode:_applyMarginTransform(rootNode.containerRect)
      assert.same({ x = 40, y = 10, w = 40, h = 60 }, newRect)
    end)
  end)

  describe('_updateContentRect()', function()
    it('should apply our margin', function()
      rootNode:setMargin(10)
      rootNode:_updateContentRect()
      assert.same({ x = 10, y = 10, w = 80, h = 80 }, rootNode.contentRect)
    end)
  end)
end)
