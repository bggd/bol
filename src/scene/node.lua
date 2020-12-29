local Node = {}
local Vector3 = require("gmath.vector3")

function Node.create()
  local obj = {
    parent = nil,
    children = {},

    -- properties
    globalPosition = Vector3.zero(),
    position = Vector3.zero(),
    isQueuedForDeletion = false,

    -- callbacks
    onReady = nil,
    onProcess = nil,
    onDraw = nil
  }
  return obj
end

function Node.setParent(node, parent)
  assert(node ~= parent)
  assert(parent.parent ~= node)

  node.parent = parent
end

function Node.addChild(node, child)
  table.insert(node.children, child)
  Node.setParent(child, node)
end

function Node.propagate(node)
  if node.onProcess then
    assert(type(node.onProcess) == "function")
    node:onProcess()
  end

  if node.parent then
    local p = node.parent
    node.globalPosition = Vector3.add(p.globalPosition, node.position)
  else
    node.globalPosition = node.position
  end

  if node.onDraw then
    assert(type(node.onDraw) == "function")
    node:onDraw()
  end

  for _, v in ipairs(node.children) do
    Node.propagate(v)
  end
end

function Node.queueFree(node)
  node.isQueuedForDeletion = true
end

function Node.freeRecursive(node)
  local freeRequest = false
  for _, v in ipairs(node.children) do
    if v.isQueuedForDeletion then
      freeRequest = true
      break
    end
  end

  if freeRequest then
    local tbl = {}
    for _, v in ipairs(node.children) do
      if not v.isQueuedForDeletion then table.insert(tbl, v) end
    end
    node.children = tbl
  end

  for _, v in ipairs(node.children) do
    Node.freeRecursive(v)
  end
end

return Node
