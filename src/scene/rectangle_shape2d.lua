local RectangleShape2D = {}

local Vector3 = require("gmath.vector3")

function RectangleShape2D.create()
  local obj = {
    extents = Vector3.zero()
  }
  return obj
end

function RectangleShape2D.setExtents(shape, valueVec3)
  assert(Vector3.isVector3(valueVec3))

  shape.extents = valueVec3
end

function RectangleShape2D.getExtents(shape)
  return shape.extents
end

return RectangleShape2D
