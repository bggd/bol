local util = {}

--- degrees to radians
---@param x number
---@return number
function util.deg2rad(x)
  -- x * (math.pi / 180.0)
  return x * 0.017453292519943
end

return util
