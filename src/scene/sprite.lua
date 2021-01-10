---@class gd.Sprite : gd.Node
local Sprite = {}

local Node = require("scene.node")

---@return gd.Sprite
function Sprite.create()
  local obj = Node.create()

  obj.image = nil
  obj.centered = true
  obj.flip_h = false
  obj.flip_v = false

  obj.onDraw = Sprite.onDraw

  return obj
end

---@param spr gd.Sprite
---@param image any
function Sprite.setImage(spr, image)
  assert(image:typeOf("Image"))

  spr.image = image
end

function Sprite:onDraw()
  local pos = self.globalPosition
  love.graphics.draw(self.image, pos[1], pos[2])
end

return Sprite
