return {
  -- Classics
  ["tpope/vim-fugitive"] = {},
  ["tpope/vim-surround"] = {},
  ["csexton/trailertrash.vim"] = {},
  ["easymotion/vim-easymotion"] = {},
  ["christoomey/vim-tmux-navigator"] = {},
  ["tpope/vim-rails"] = {},
  ["tpope/vim-endwise"] = {},
  ["vim-ruby/vim-ruby"] = {},
  ["chrisbra/csv.vim"] = {},
  ["nvim-telescope/telescope-fzf-native.nvim"] = {run = 'make'},
  ["slim-template/vim-slim"] = {},
   ['beauwilliams/focus.nvim'] = {
    config = function()
        require("focus").setup({hybridnumber = true})
    end
  },

  -- Base overides
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.lsp.lspconfig"
    end,
  },
  ["nvim-telescope/telescope.nvim"] = {
    config = function ()
      require "plugins.configs.telescope"
      require("telescope").load_extension('fzf')
    end
  },
  ["folke/which-key.nvim"] = {
    disable = false
  },

  -- Trying these out
  ["MaxMEllon/vim-jsx-pretty"] = {}
}
