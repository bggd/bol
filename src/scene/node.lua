---@class gd.Node
---@field parent gd.Node
---@field children gd.Node[]
---@field globalPosition gmath.Vector3
---@field position gmath.Vector3
---@field isQueuedForDeletion boolean
---@field onReady fun(self:gd.Node)
---@field onProcess fun(self:gd.Node)
---@field onDraw fun(self:gd.Node)
local Node = {}

local Vector3 = require("gmath.vector3")


---@return gd.Node
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

---@param node gd.Node
---@param parent gd.Node
function Node.setParent(node, parent)
  assert(node ~= parent)
  assert(parent.parent ~= node)

  node.parent = parent
end

---@param node gd.Node
---@param child gd.Node
function Node.addChild(node, child)
  table.insert(node.children, child)
  Node.setParent(child, node)
end

---@param node gd.Node
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

---@param node gd.Node
function Node.queueFree(node)
  node.isQueuedForDeletion = true
end

---@param node gd.Node
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
