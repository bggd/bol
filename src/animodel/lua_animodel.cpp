extern "C" {
#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"
} // extern "C"

#include "animodel.hpp"

static int
animodelLoadModelFromMemory(lua_State* L) {
  size_t len{};
  const char* buffer = lua_tolstring(L, 1, &len);

  void* p = lua_newuserdata(L, sizeof(AniModel));
  luaL_getmetatable(L, "globalAniModelMetaTable");
  lua_setmetatable(L, -2);

  AniModel* model = new (p) AniModel();
  loadModel(model, buffer, len);

  return 1;
}

static int
animodelUnload(lua_State* L) {
  void* p = luaL_checkudata(L, 1, "globalAniModelMetaTable");
  assert(p);
  static_cast<AniModel*>(p)->~AniModel();
  return 0;
}

extern "C"
#ifdef _WIN32
    __declspec(dllexport)
#endif
        int luaopen_animodelcmod(lua_State* L) // animodel C module
{
  luaL_Reg methods[] = {
      {"__gc", animodelUnload},
      {NULL, NULL}};
  luaL_Reg functions[] = {
      {"loadModelFromMemory", animodelLoadModelFromMemory},
      {NULL, NULL}};

  luaL_newmetatable(L, "globalAniModelMetaTable");

  luaL_register(L, nullptr, methods);
  luaL_register(L, "animodel", functions);

  return 1;
}
