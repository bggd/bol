local Node = require("scene.node")

describe("Node", function()

  it("Node.create", function()
    local n = Node.create()
    assert.True(n.parent == nil)
    assert.True(type(n.children) == "table")
    assert.True(#n.children == 0)
  end)

  it("Node.setParent", function()
    local parent = Node.create()
    local child = Node.create()
    assert.False(child.parent == parent)
    Node.setParent(child, parent)
    assert.True(child.parent == parent)
    assert.has.errors(function() Node.setParent(parent, child) end)
    assert.has.errors(function() Node.setParent(child, child) end)
  end)

  it("Node.addChild", function()
    local root = Node.create()
    local child = Node.create()
    assert.True(#root.children == 0)
    Node.addChild(root, child)
    assert.True(#root.children == 1)
    local foundChild = false
    for _, v in ipairs(root.children) do
      if v == child then foundChild = true end
    end
    assert.True(foundChild)
  end)

  it("Node.queueFree", function()
    local root = Node.create()
    local a = Node.create()
    local b = Node.create()
    local c = Node.create()

    Node.addChild(root, a)
    Node.addChild(root, b)
    Node.addChild(root, c)

    assert.False(c.isQueuedForDeletion)
    Node.queueFree(c)
    assert.True(c.isQueuedForDeletion)

    assert.True(#root.children == 3)

    Node.freeRecursive(root)

    assert.True(#root.children == 2)

  end)

end)
