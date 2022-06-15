return {
  -- User
  ["tpope/vim-fugitive"] = {},
  ["tpope/vim-surround"] = {},
  ["csexton/trailertrash.vim"] = {},
  ["easymotion/vim-easymotion"] = {},
  ["christoomey/vim-tmux-navigator"] = {},
  ["tpope/vim-rails"] = {},
  ["tpope/vim-endwise"] = {},
  ["vim-ruby/vim-ruby"] = {},
  ["preservim/nerdtree"] = {},
  ["chrisbra/csv.vim"] = {},
  ["nvim-telescope/telescope-fzf-native.nvim"] = {run = 'make'},
  ["slim-template/vim-slim"] = {},
  ["Pocco81/TrueZen.nvim"] = {},


  -- Core
  ["akinsho/bufferline.nvim"] = {
    setup = function()
    end
  },

  ["nvim-telescope/telescope.nvim"] = {
   config = function ()
     require "plugins.configs.telescope"
     require("telescope").load_extension('fzf')
   end
  },
  -- ["neovim/nvim-lspconfig"] = {
  --   after = "nvim-lsp-installer",
  --   module = "lspconfig",
  --   config = function()
  --      require "plugins.configs.lsp_installer"
  --      require "plugins.configs.lspconfig"
  --   end,
  --   setup = function()
  --     require("core.utils").packer_lazy_load "nvim-lsp-installer"
  --     -- reload the current file so lsp actually starts for it
  --     vim.defer_fn(function()
  --        vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
  --     end, 0)
  --   end
  -- }
}
