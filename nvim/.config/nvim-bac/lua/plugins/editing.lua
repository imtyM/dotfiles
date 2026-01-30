return {
  {
    'tpope/vim-surround',
    event = 'BufRead',
  },
  {
    'csexton/trailertrash.vim',
    event = 'BufRead',
  },
  {
    'christoomey/vim-tmux-navigator',
    event = 'VeryLazy',
  },
  {
    'tpope/vim-endwise',
    event = 'BufRead',
  },
  {
    'mg979/vim-visual-multi',
    event = 'BufRead',
    branch = 'master',
  },
  {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup {
        -- your configuration comes here
        -- or leave it empty to  the default settings
        -- refer to the configuration section below
      }
    end,
  },
  {
    'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
    event = 'BufRead',
    config = function()
      require('Comment').setup()
    end,
  },
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  {
    'easymotion/vim-easymotion',
    event = 'BufRead',
    config = function()
      vim.cmd [[
      let g:EasyMotion_verbose = 0
    ]]
    end,
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        's',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Flash',
      },
      {
        'S',
        mode = { 'n', 'o', 'x' },
        function()
          require('flash').treesitter()
        end,
        desc = 'Flash Treesitter',
      },
      {
        '<c-s>',
        mode = { 'c' },
        function()
          require('flash').toggle()
        end,
        desc = 'Toggle Flash Search',
      },
    },
  },
}
