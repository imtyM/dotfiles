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
  ["chrisbra/csv.vim"] = {},
  ["nvim-telescope/telescope-fzf-native.nvim"] = {run = 'make'},
  ["slim-template/vim-slim"] = {},
  ["Pocco81/TrueZen.nvim"] = {
    config = function()
      require("custom.plugins.configs").trueZen()
    end
  },
  ["rmagatti/goto-preview"] = {
    config = function ()
      require('goto-preview').setup { default_mappings = true }
    end
  },
  ["EdenEast/nightfox.nvim"] = {},
  ["filipdutescu/renamer.nvim"] = {
    config = function ()
      require('renamer').setup()
    end,
    branch = 'master',
    requires = { {'nvim-lua/plenary.nvim'} }
  },
  ['beauwilliams/focus.nvim'] = {
    config = function()
        require("focus").setup({hybridnumber = true})
    end
  },

  -- Filetree
  ["kevinhwang91/rnvimr"] = {
    config = function()
      require("custom.plugins.configs").ranger()
    end
  },
  -- ["preservim/nerdtree"] = {},

  -- Core replacements
  ["nvim-telescope/telescope.nvim"] = {
   config = function ()
     require "plugins.configs.telescope"
     require("telescope").load_extension('fzf')
   end
  }
}
