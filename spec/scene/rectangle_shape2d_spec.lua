local RectangleShape2D = require("scene.rectangle_shape2d")

local Vector3 = require("gmath.vector3")

describe("RectangleShape2D", function()

  it("RectangleShape2D.create", function()
    local shape = RectangleShape2D.create()
    assert.equal(0, shape.extents[1])
    assert.equal(0, shape.extents[2])
    assert.equal(0, shape.extents[3])
  end)

  it("RectangleShape2D.setExtents", function()
    local shape = RectangleShape2D.create()
    RectangleShape2D.setExtents(shape, Vector3.create(1, 2, 3))
    assert.equal(1, shape.extents[1])
    assert.equal(2, shape.extents[2])
    assert.equal(3, shape.extents[3])
  end)
end)
