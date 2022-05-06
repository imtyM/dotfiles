local map = require("core.utils").map

map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", ":q <CR>")

map("i", "<C-j>", "<ESC>")
map("i", "<C-j>", "<ESC>")

map("n", "<C-q>", ":TrailerTrim | wa | lua require('core.utils').close_buffer() <CR>")
map("i", "<C-q>", "<ESC>:TrailerTrim | wa | lua require('core.utils').close_buffer() <CR>")

map("n", "<C-w>", ":TrailerTrim | wa<CR>")
map("i", "<C-w>", "<ESC>:TrailerTrim | wa<CR>")

map("i", "<C-x>", "<ESC>:q<CR>")
map("n", "<C-x>", "<ESC>:q<CR>")

--Git, open in new buffer, clear the clutter
map("n", "<leader>gg", ":tabnew <CR>:G<CR>:winc k<CR>:q<CR>:NvimTreeClose<CR>")

--Telescope find files with <C-p>
map("n", "<C-p>", ":Telescope find_files follow=true no_ignore=true hidden=true <CR>")
map("n", "<C-n>", ":NERDTreeFind<CR>")

--Zen mode
map("n", "<leader>z", ":TZAtaraxis<CR>")

--Tab control
map("n", "<S-TAB>", ":tabp<CR>")
map("n", "<TAB>", ":tabn<CR>")
map("n", "tn", ":tabnew<CR>")
vim.cmd [[
nmap <C-o> :tabn<CR>
nmap <C-i> :tabp<CR>
noremap <C-o> :tabn<CR>
noremap <C-i> :tabp<CR>
nnoremap <C-o> :tabn<CR>
nnoremap <C-i> :tabp<CR>
]]

--Easymotion
vim.cmd [[
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
]]