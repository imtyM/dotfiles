local M = {}

local userPlugins = require "custom.plugins" -- path to table
local pluginConfs = require "custom.plugins.configs"

M.ui = {
  theme = "nord",
  theme_toggle = {'nord', 'onenord'}
}

M.plugins = {
  user = userPlugins,

  override = {
   ["akinsho/bufferline.nvim"] = pluginConfs.bufferline,
   ["hrsh7th/nvim-cmp"] = pluginConfs.cmp,
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

M.mappings = require("custom.mappings")

return M
