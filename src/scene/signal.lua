---@class gd.Signal
---@field listeners table<gd.Node, fun()>
local Signal = {}

---@return gd.Signal
function Signal.create()
  local signal = {
    listeners = {}
  }
  return signal
end

---@param signal gd.Signal
---@param node gd.Node
---@param fn fun()
function Signal.connect(signal, node, fn)
  assert(type(fn) == "function")

  signal.listeners[node] = fn
end

---@param signal gd.Signal
---@vararg any[]
function Signal.emit(signal, ...)
  for node, fn in pairs(signal.listeners) do
    fn(node, ...)
  end
end


return Signal
