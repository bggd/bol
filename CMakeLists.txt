cmake_minimum_required(VERSION 3.12)

project(C_Module_For_Lua_Project CXX)

find_package(Lua REQUIRED)

add_subdirectory(external/assimp)

# animodel C module
add_library(animodelcmod SHARED
  src/animodel/animodel.cpp
  src/animodel/lua_animodel.cpp)
target_include_directories(animodelcmod PRIVATE assimp "${LUA_INCLUDE_DIR}")
target_link_libraries(animodelcmod PRIVATE assimp "${LUA_LIBRARIES}")
set_property(TARGET animodelcmod PROPERTY CXX_STANDARD 20)
