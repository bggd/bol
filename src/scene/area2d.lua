---@class Area2D : gd.Node
---@field areaEntered gd.Signal
local Area2D = {}

local Node = require("scene.node")
local Signal = require("scene.signal")

function Area2D.create()
  local obj = Node.create()
  obj.areaEntered = Signal.create()
  return obj
end

return Area2D
