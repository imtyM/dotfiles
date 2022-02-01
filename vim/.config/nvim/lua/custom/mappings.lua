local map = require("core.utils").map

map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", ":q <CR>")

map("i", "<C-j>", "<ESC>")
map("i", "<C-j>", "<ESC>")

map("n", "<C-q>", ":w | lua require('core.utils').close_buffer() <CR>")
map("i", "<C-q>", "<ESC>:w | lua require('core.utils').close_buffer() <CR>")

map("n", "<C-w>", ":w<CR>")
map("i", "<C-w>", "<ESC>:w<CR>")

map("i", "<C-x>", "<ESC>:q<CR>  ")
