local Signal = require("scene.signal")

local Node = require("scene.node")
local Vector3 = require("gmath.vector3")

describe("Signal", function()

  it("Signal.create", function()
    local s = Signal.create()
    assert.True(type(s.listeners) == "table")
    assert.True(#s.listeners == 0)
  end)

  it("Signal.connect and Signal.emit", function()
    local n = Node.create()
    n.onCallback = function(self)
      self.position = Vector3.create(1, 2, 3)
    end
    assert.True(n.position[1] == 0)
    assert.True(n.position[2] == 0)
    assert.True(n.position[3] == 0)

    local s = Signal.create()
    Signal.connect(s, n, n.onCallback)
    Signal.emit(s)
    assert.True(n.position[1] == 1)
    assert.True(n.position[2] == 2)
    assert.True(n.position[3] == 3)
  end)

end)
