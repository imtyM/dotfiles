return {
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.lsp.lspconfig"
    end,
  },
  ["folke/which-key.nvim"] = {
    disable = false
  }
}
