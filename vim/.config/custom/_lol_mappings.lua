local map = nvchad.map

map("n", "<C-n>", ":NERDTreeFind<CR>")

-- Escape insert
map("i", "<C-j>", "<ESC>")
map("i", "<C-j>", "<ESC>")

-- Quiting
map("n", "<leader>q", ":q <CR>")
map("n", "<C-q>", ":TrailerTrim | wa | :q <CR>")
map("i", "<C-q>", "<ESC>:TrailerTrim | wa | :q <CR>")
map("i", "<C-x>", "<ESC>:q<CR>")
map("n", "<C-x>", "<ESC>:q<CR>")

-- Writing
map("n", "<C-w>", ":TrailerTrim | wa<CR>")
map("i", "<C-w>", "<ESC>:TrailerTrim | wa<CR>")

--Git, open in new buffer, clear the clutter
map("n", "<leader>gg", ":tabnew <CR>:G<CR>:winc k<CR>:q<CR>:NvimTreeClose<CR>")

--Tab control
map("n", "<S-TAB>", ":tabp<CR>")
map("n", "<TAB>", ":tabn<CR>")
map("n", "tn", ":tabnew<CR>")
map("n", "<C-o>", ":tabn <CR>")
map("n", "<C-i>", ":tabp <CR>")

--Easymotion
vim.cmd [[
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
]]

--Telescope find files with <C-p>
map("n", "<C-p>", ":Telescope find_files follow=true no_ignore=true hidden=true <CR>")
