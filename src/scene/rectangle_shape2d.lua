---@class gd.RectangleShape2D : gd.Node
---@field extents gmath.Vector3
local RectangleShape2D = {}

local Node = require("scene.node")
local Vector3 = require("gmath.vector3")

---@return gd.RectangleShape2D
function RectangleShape2D.create()
  local obj = Node.create()
  obj.extents = Vector3.zero()
  return obj
end

---@param shape gd.RectangleShape2D
---@param valueVec3 gmath.Vector3
function RectangleShape2D.setExtents(shape, valueVec3)
  assert(Vector3.isVector3(valueVec3))

  shape.extents = valueVec3
end

---@param shape gd.RectangleShape2D
---@return gmath.Vector3
function RectangleShape2D.getExtents(shape)
  return shape.extents
end

return RectangleShape2D
