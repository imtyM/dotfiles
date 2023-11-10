return {
  {
    "tpope/vim-fugitive",
    keys = {
      {
        "<leader>gf",
        ":tabnew <CR>:G<CR>:winc k<CR>:q<CR>:NvimTreeClose<CR>",
        desc = "Git fugitive",
        mode = "n",
      },
    },
  },
}
