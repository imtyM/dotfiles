return {
  -- Git related plugins
  {
    'tpope/vim-fugitive',
    cmd = 'G',
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufRead',
    config = function()
      -- See `:help gitsigns.txt`
      require('gitsigns').setup {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      }
    end,
  },
}
