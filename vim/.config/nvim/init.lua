local utils = require('utils')

local is_bootstrap = utils.bootstrap_lazy()
require('plugins').load(is_bootstrap)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

require('base_options')
require('plugins.configs')

require('autocmds')
require('keymaps')
