local plugins = require('config.plugins')
local is_bootstraping = plugins.bootstrap()
plugins.init()

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstraping then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until instalation completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

require('config.options')
require('config.autocmds')
require('config.keymaps')
