local M = {}

M.disabled = {
  n = {
  },

  i = {
    ["<C-j>"] = ""
  }
}

M.misc = {
  n = {
    -- Writing and closing
    ["<leader>gg"] = { ":tabnew <CR>:G<CR>:winc k<CR>:q<CR>:NvimTreeClose<CR>", "Git buffer in new window"},

    ["<C-p>"] = {":Telescope git_files follow=true hidden=true <CR>", "Search project files"},

  },

  i = {
    -- Exit insert mode
    ["<C-j>"] = {"<ESC>", "Escape"},
  },

  v = {
    ["<C-j>"] = {"<ESC>", "Escape"},
  }
}

return M
