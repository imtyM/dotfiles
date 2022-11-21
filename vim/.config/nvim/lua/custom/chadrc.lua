-- First read our docs (completely) then check the example_config repo
local userPlugins = require('custom.plugins')
local pluginConfs = require "custom.plugins.configs"

local M = {}

M.ui = {
  theme = "nord",
  theme_toggle = {"nord", "onenord"}
}

M.plugins = {
  user = userPlugins,

  override = {
   ["hrsh7th/nvim-cmp"] = pluginConfs.cmp,
   ["nvim-telescope/telescope.nvim"] = pluginConfs.telescope
  }
}

M.mappings = require('custom.mappings')

return M
