local M = {}

M.bootstrap = function()
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazypath,
		})
    vim.opt.rtp:prepend(lazypath)
    return true
  else
    vim.opt.rtp:prepend(lazypath)
    return false
	end
end

M.init = function ()
  --  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '
  require("lazy").setup({
    spec = {
      { import = "plugins" },
    },
    defaults = { lazy = false },
    install = { colorscheme = { "nordfox" } },
    checker = { enabled = true },
    diff = {
      cmd = "terminal_git",
    },
    performance = {
      cache = {
        enabled = true,
        -- disable_events = {},
      },
    },
    -- debug = true,
  })
end

return M
