local Sprite = require("scene.sprite")

describe("Sprite", function()

  it("Sprite.create", function()
    local spr = Sprite.create()
    assert.True(spr.image == nil)
    assert.True(spr.centered)
    assert.False(spr.flip_h)
    assert.False(spr.flip_v)
  end)

end)
