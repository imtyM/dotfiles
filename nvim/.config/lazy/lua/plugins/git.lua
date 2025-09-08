return {
  {
    "tpope/vim-fugitive",
    enabled = false,
    keys = {
      {
        "<leader>gf",
        ":tabnew <CR>:G<CR>:winc k<CR>:q<CR>:NvimTreeClose<CR>",
        desc = "Git fugitive",
        mode = "n",
      },
    },
  },
  {
  "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "folke/snacks.nvim",             -- optional
    },
    keys = {
      {
        "<leader>gf",
        "<cmd>Neogit kind=floating<CR>",
        desc = "neogit",
        mode = "n",
      },
    },
  }
}
