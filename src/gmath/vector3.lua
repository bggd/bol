local Vector3 = {}

function Vector3.isVector3(v)
  return v ~= nil and #v == 3 and type(v[1]) == "number" and type(v[2]) == "number" and type(v[3]) == "number"
end

function Vector3.create(x, y, z)
  assert(type(x) == "number")
  assert(type(y) == "number")
  assert(type(z) == "number")

  local v = {x, y, z}
  return v
end

function Vector3.zero()
  return {0.0, 0.0, 0.0}
end

function Vector3.add(a, b)
  assert(Vector3.isVector3(a))
  assert(Vector3.isVector3(b))

  local v = {0.0, 0.0, 0.0}
  for i = 1, 3 do
    v[i] = a[i] + b[i]
  end
  return v
end

function Vector3.sub(a, b)
  assert(Vector3.isVector3(a))
  assert(Vector3.isVector3(b))

  local v = {0.0, 0.0, 0.0}
  for i = 1, 3 do
    v[i] = a[i] - b[i]
  end
  return v
end

function Vector3.mul(a, b)
  assert(Vector3.isVector3(a))
  assert(Vector3.isVector3(b))

  local v = {0.0, 0.0, 0.0}
  for i = 1, 3 do
    v[i] = a[i] * b[i]
  end
  return v
end

function Vector3.mulScalar(a, scalar)
  assert(Vector3.isVector3(a))

  local v = {0.0, 0.0, 0.0}
  for i = 1, 3 do
    v[i] = a[i] * scalar
  end
  return v
end

function Vector3.dot(a, b)
  assert(Vector3.isVector3(a))
  assert(Vector3.isVector3(b))

  local dot = 0
  for i = 1, 3 do
    dot = dot + a[i] * b[i]
  end
  return dot
end

function Vector3.length(v)
  assert(Vector3.isVector3(v))

  return math.sqrt(Vector3.dot(v, v))
end

function Vector3.lengthWidthoutSqrt(v)
  assert(Vector3.isVector3(v))

  return Vector3.dot(v, v)
end

function Vector3.normalize(v)
  assert(Vector3.isVector3(v))

  local n = {0.0, 0.0, 0.0}
  local len = 1.0 / Vector3.length(v)
  for i = 1, 3 do
    n[i] = v[i] * len
  end
  return n
end

function Vector3.cross(a, b)
  assert(Vector3.isVector3(a))
  assert(Vector3.isVector3(b))

  local v = {0.0, 0.0, 0.0}
  v[1] = a[2] * b[3] - a[3] * b[2]
  v[2] = a[3] * b[1] - a[1] * b[3]
  v[3] = a[1] * b[2] - a[2] * b[1]
  return v
end

return Vector3
