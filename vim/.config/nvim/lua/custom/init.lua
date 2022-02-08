require 'custom.mappings'
require 'custom.sets'
require 'custom.autocmds'
local map = require("core.utils").map

-- vim.cmd [[ autocmd BufEnter * if &buftype != "terminal" | lcd %:p:h | endif ]]

vim.cmd [[
nmap <C-o> :tabn<CR>
nmap <C-i> :tabp<CR>
noremap <C-o> :tabn<CR>
noremap <C-i> :tabp<CR>
nnoremap <C-o> :tabn<CR>
nnoremap <C-i> :tabp<CR>
]]
