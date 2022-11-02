local opt = vim.opt

opt.cursorline = false

vim.cmd [[
set nohlsearch
let g:trailertrash_blacklist = ['__Calendar', '^http:', 'mason.nvim']
hi UnwantedTrailerTrash guibg= ctermbg=
]]
