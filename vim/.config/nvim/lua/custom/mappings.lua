local M = {}

M.disabled = {
  n = {
    -- ["<C-n>"] = "",
    -- ["<C-i"] = "",
    -- ["<C-w>"] = "",
    --
    -- -- cycle through buffers
    -- ["<TAB>"] = "",
    -- ["<S-Tab>"] = "",

    -- close buffer + hide terminal buffer
    ["<leader>rn"] = ""
  },

  i = {
    ["<C-j>"] = ""
  }
}

M.misc = {
  n = {
    -- NERDTree
    -- ["<C-n>"] = {":NERDTreeFind<CR>", "Toggle nerd tree"},
    -- ["<C-n>"] = {":RnvimrToggle<CR>", "Toggle ranger"},
    ["<C-b>"] = {":Telescope file_browser<CR>", "Toggle file explorer"},

    -- Writing and closing
    ["<C-q>"] = {
      function ()
        vim.cmd("TrailerTrim")
        vim.cmd("wa")
        require("core.utils").close_buffer()
        vim.cmd("q")
      end,
      "Write and close buffer"},
    ["<C-w>"] = {":TrailerTrim | wa<CR>", "Write all buffers"},
    ["<C-x>"] = {
      function()
        require("core.utils").close_buffer()
        vim.cmd("q")
      end,
      "   close buffer"},
    ["<leader>gg"] = { ":tabnew <CR>:G<CR>:winc k<CR>:q<CR>:NvimTreeClose<CR>", "Git buffer in new window"},

    -- Tab control
    -- ["<C-i>"] = {":tabp<CR>", "Previous tab"},
    ["<S-TAB>"] = {":tabp<CR>", "Previous tab"},
    -- ["<C-o>"] = {":tabn<CR>", "Next tab"},
    ["<TAB>"] = {":tabn<CR>", "Next tab"},
    -- ["tn"] = {":tabnew<CR>", "New tab"},
    ["<C-p>"] = {":Telescope git_files follow=true hidden=true <CR>", "Search project files"},

    -- True zen
    ["ta"] = { "<cmd> TZAtaraxis <CR>", "   truzen ataraxis" },
    ["tm"] = { "<cmd> TZMinimalist <CR>", "   truzen minimal" },
    ["tf"] = { "<cmd> TZFocus <CR>", "   truzen focus" },

    -- Renamer
    ["<leader>rn"] = {"<cmd> lua require('renamer').rename()<CR>", "Rename"}
  },

  i = {
    -- Exit insert mode
    ["<C-j>"] = {"<ESC>", "Escape"},

    -- Writing and closing
    ["<C-q>"] = {"<ESC>:TrailerTrim | wa | :q <CR>", "Save a close buffer"},
    ["<C-w>"] = {"<ESC>:TrailerTrim | wa <CR>", "Write all buffers"},
    ["<C-x>"] = {"<ESC>:q<CR>", "Close buffer"}
  }
}

--Easymotion
vim.cmd [[
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
]]

return M
