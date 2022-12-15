local M = {}

M.disabled = {
  n = {
    -- Overide
    ["<S-TAB>"] = {""},
    ["<TAB>"] = {""},
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
    ["<C-w>"] = {":TrailerTrim | wa<CR>", "Write all buffers"},
    ["<S-TAB>"] = {":tabp<CR>", "Previous tab"},
    ["<TAB>"] = {":tabn<CR>", "Next tab"},

  },

  i = {
    -- Exit insert mode
    ["<C-j>"] = {"<ESC>", "Escape"},
    ["<C-w>"] = {"<ESC>:TrailerTrim | wa <CR>", "Write all buffers"},
  },

  v = {
    ["<C-j>"] = {"<ESC>", "Escape"},
  }
}

--Easymotion
vim.cmd [[
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
]]

return M
