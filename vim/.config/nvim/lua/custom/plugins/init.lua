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
  }
}
