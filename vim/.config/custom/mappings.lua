local M = {}

M.disable = {
  n = {
    ["<C-n>"] = "",
    ["<C-i"] = "",
    ["<C-w>"] = "",

    ["<S-b>"] = "",

    -- cycle through buffers
    ["<TAB>"] = "",
    ["<S-Tab>"] = "",

    -- close buffer + hide terminal buffer
    ["<leader>x"] = ""
  },

  i = {
    ["<C-j>"] = ""
  }
}

M.misc = {
  n = {
    -- NERDTree
    ["<C-n>"] = {":NERDTreeFind<CR>", "Toggle nerd tree"},

    -- Writing and closing
    ["<C-q>"] = {":TrailerTrim | wa | :q <CR>", "Write and close buffer"},
    ["<C-w>"] = {":TrailerTrim | wa<CR>", "Write all buffers"},
    ["<C-x>"] = {"<ESC>:q<CR>", "Close buffer"},
    ["<leader>gg"] = { ":tabnew <CR>:G<CR>:winc k<CR>:q<CR>:NvimTreeClose<CR>", "Git buffer in new window"},

    -- Tab control
    ["<C-i>"] = {":tabp<CR>", "Previous tab"},
    ["<S-TAB>"] = {":tabp<CR>", "Previous tab"},
    ["<C-o>"] = {":tabn<CR>", "Next tab"},
    ["<TAB>"] = {":tabn<CR>", "Next tab"},
    ["tn"] = {":tabnew<CR>", "New tab"},
    ["<C-p>"] = {":Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Search project files"}
  },

  i = {
    -- Exit insert mode
    ["<C-j>"] = {"<ESC>", "Escape"},

    -- Writing and closing
    ["<C-q>"] = {":TrailerTrim | wa | :q <CR>", "Save a close buffer"},
    ["<C-w>"] = {":TrailerTrim | wa<CR>", "Write all buffers"},
    ["<C-x>"] = {"<ESC>:q<CR>", "Close buffer"}
  }
}

--Easymotion
vim.cmd [[
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
]]

return M
