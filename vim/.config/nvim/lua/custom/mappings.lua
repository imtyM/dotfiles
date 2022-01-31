local map = require("core.utils").map

map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", ":q <CR>")

map("i", "<C-j>", "<ESC>")
map("i", "<C-j>", "<ESC>")

map("n", "<C-q>", ":wq<CR>")
map("i", "<C-q>", "<ESC>:wq<CR>")

map("n", "<C-x>", ":q<CR>")
map("i", "<C-x>", "<ESC>:q<CR>")
