local Signal = {}

function Signal.create()
  local signal = {
    listeners = {}
  }
  return signal
end

function Signal.connect(signal, node, fn)
  assert(type(fn) == "function")

  signal.listeners[node] = fn
end

function Signal.emit(signal, ...)
  for node, fn in pairs(signal.listeners) do
    fn(node, ...)
  end
end


return Signal
