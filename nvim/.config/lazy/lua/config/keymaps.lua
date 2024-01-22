-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set("i", "<C-j>", "<ESC>", { desc = "Another escape" })

-- save and quit
vim.keymap.set("n", "<C-w>", "<cmd>wa<CR>", { desc = "Save all" })
vim.keymap.set("i", "<C-w>", "<ESC><cmd>wa<CR>", { desc = "Save all" })

vim.keymap.set("n", "<C-q>", "<cmd>q<CR>", { desc = "quit buffer" })
vim.keymap.set("i", "<C-q>", "<cmd>q<CR>", { desc = "quit buffer" })

-- Move tabs
vim.keymap.set("n", "<C-o>", "<cmd>tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<C-i>", "<cmd>tabprevious<CR>", { desc = "Previous tab" })

-- file explorer
vim.keymap.set("n", "<C-e>", "<cmd> NvimTreeFindFileToggle <CR>", { desc = "Toggle file explorer" })

-- telescope
vim.keymap.set("n", "<C-p>", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })

-- Gd into different windows and tabs
vim.keymap.set("n", "gt", "<cmd>tab split<CR> gd", { desc = "Go to def in new tab" })
vim.keymap.set("n", "gv", "<cmd>vs<CR> gd", { desc = "Go to def in a new split" })
