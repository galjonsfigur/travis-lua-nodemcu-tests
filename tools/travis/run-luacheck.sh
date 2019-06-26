#!/bin/bash

set -e

LUA_FILES_TO_CHECK=$(find lua_examples -iname "*.lua")

echo "Installing Lua 5.3, LuaRocks and Luacheck"
(
  cd "$TRAVIS_BUILD_DIR" || exit
  bash tools/travis/localua.sh cache/localua || exit
  cache/localua/bin/luarocks install luacheck || exit
)

echo Static analysys of "$LUA_FILES_TO_CHECK"
(
  (find lua_examples -print0 -iname "*.lua" | xargs -0 cache/localua/bin/luacheck --config tools/luacheck_config.lua) || exit
)
