local AniModel = {}

local animodelcmod = require("animodelcmod")

function AniModel.loadModel(fileName)
  assert(type(fileName == "string"))

  local buffer, lenBuffer = love.filesystem.read(fileName)
  assert(buffer)
  assert(lenBuffer)

  local obj = animodelcmod.loadModelFromMemory(buffer, lenBuffer)
  return obj
end

return AniModel
