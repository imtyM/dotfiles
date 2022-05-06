require 'custom.sets'
require 'custom.autocmds'
require 'custom.mappings'

-- vim.cmd [[ autocmd BufEnter * if &buftype != "terminal" | lcd %:p:h | endif ]]
require('telescope').load_extension('fzf')
