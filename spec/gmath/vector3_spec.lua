local Vector3 = require("src.gmath.vector3")

describe("gmath.Vector3", function()

  it("Vector3.isVector3", function()
    local vec3 = {0, 0, 0}
    assert.True(Vector3.isVector3(vec3))
    local vec2 = {0, 0}
    assert.False(Vector3.isVector3(vec2))
    assert.False(Vector3.isVector3(nil))
    assert.False(Vector3.isVector3({}))
    assert.False(Vector3.isVector3({"", "", ""}))
  end)

  it("Vector3.create", function()
    local v = Vector3.create(1, 2, 3)
    assert.True(v[1] == 1)
    assert.True(v[2] == 2)
    assert.True(v[3] == 3)
  end)

  it("Vector3.zero", function()
    local v = Vector3.zero()
    assert.True(v[1] == 0)
    assert.True(v[2] == 0)
    assert.True(v[3] == 0)
  end)

  it("Vector3.add", function()
    local a = Vector3.create(-1, -2, -3)
    local b = Vector3.create(1, 2, 3)
    local v = Vector3.add(a, b)
    assert.True(v[1] == 0)
    assert.True(v[2] == 0)
    assert.True(v[3] == 0)
  end)

  it("Vector3.sub", function()
    local a = Vector3.create(1, 2, 3)
    local b = Vector3.create(1, 2, 3)
    local v = Vector3.sub(a, b)
    assert.True(v[1] == 0)
    assert.True(v[2] == 0)
    assert.True(v[3] == 0)
  end)

  it("Vector3.mul", function()
    local a = Vector3.create(1, 2, 3)
    local b = Vector3.create(1, 2, 3)
    local v = Vector3.mul(a, b)
    assert.True(v[1] == 1)
    assert.True(v[2] == 4)
    assert.True(v[3] == 9)
  end)

  it("Vector3.mulScalar", function()
    local a = Vector3.create(1, 2, 3)
    local v = Vector3.mulScalar(a, -1)
    assert.True(v[1] == -1)
    assert.True(v[2] == -2)
    assert.True(v[3] == -3)
  end)

  it("Vector3.dot", function()
    local a = Vector3.create(3, 2, 0)
    local b = Vector3.create(1, 4, 0)
    local dot = Vector3.dot(a, b)
    assert.True(dot == 11)
  end)

  it("Vector3.length", function()
    local v = Vector3.create(4, 3, 0)
    local len = Vector3.length(v)
    assert.True(len == 5)
  end)

  it("Vector3.lengthWidthoutSqrt", function()
    local v = Vector3.create(4, 3, 0)
    local len = Vector3.lengthWidthoutSqrt(v)
    assert.True(len == 25)
  end)

  it("Vector3.normalize", function()
    local v = Vector3.create(3, 4, 0)
    local unit = Vector3.normalize(v)
    local len = Vector3.length(unit)
    assert.True(len == 1)
  end)

  it("Vector3.cross", function()
    local a = Vector3.create(0, 1, 0)
    local b = Vector3.create(1, 0, 2)
    local v = Vector3.cross(a, b)
    assert.True(v[1] == 2)
    assert.True(v[2] == 0)
    assert.True(v[3] == -1)
  end)

end)
