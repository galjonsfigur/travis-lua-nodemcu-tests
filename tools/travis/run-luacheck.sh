#!/bin/bash

set -e

LUA_FILES_TO_CHECK=`find lua_examples -iname "*.lua"`

echo "Installing Lua 5.3, LuaRocks and Luacheck"
(
  cd "$TRAVIS_BUILD_DIR" || exit
  bash localua.sh cache/localua || exit
  cache/localua/bin/luarocks install luacheck || exit
)

echo Static analysys of $LUA_FILES 
(
  cache/localua/bin/luacheck --config luacheck_config.lua $LUA_FILES_TO_CHECK || exit
)
