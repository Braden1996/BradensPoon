local function set_local_module_paths()
  local sourcePath = debug.getinfo(1, 'S').source:match("@(.*)$")
    :gsub('/dependencies.lua$', '')
  local modulesPath = sourcePath .. '/lua_modules'

  local version = _VERSION:match("%d+%.%d+")
  package.path = modulesPath .. '/share/lua/' .. version .. '/?.lua;' ..
    modulesPath .. '/share/lua/' .. version .. '/?/init.lua;' ..
    package.path
  package.cpath = modulesPath .. '/lib/lua/' .. version .. '/?.so;' ..
    package.cpath
end

local function import_dependencies()
  pl = require('pl.import_into')()
  pl.stringx.import()
end

set_local_module_paths()
import_dependencies()
