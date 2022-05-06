local M = {}

local userPlugins = require "custom.plugins" -- path to table
local pluginConfs = require "custom.plugins.configs"

M.ui = {
  theme = 'nord'
}

M.plugins = {
  user = userPlugins,

  override = {
   ["akinsho/bufferline.nvim"] = pluginConfs.bufferline,
   ["hrsh7th/nvim-cmp"] = pluginConfs.cmp,
   ["nvim-telescope/telescope.nvim"] = pluginConfs.telescope,
   ["kyazdani42/nvim-tree.lua"] = pluginConfs.nvim_tree
  },

  remove = {
    "kyazdani42/nvim-tree.lua"
  },

  options = {
    lspconfig = {
      setup_lspconf = "custom.lsp.lspconfig"
    }
  },
}

return M
