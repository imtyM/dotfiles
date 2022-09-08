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
   ["hrsh7th/nvim-cmp"] = pluginConfs.cmp,
   ["nvim-telescope/telescope.nvim"] = pluginConfs.telescope
  }
}

M.mappings = require("custom.mappings")

return M
