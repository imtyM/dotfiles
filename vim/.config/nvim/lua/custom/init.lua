require 'custom.mappings'
require 'custom.sets'
require 'custom.autocmds'

-- vim.cmd [[ autocmd BufEnter * if &buftype != "terminal" | lcd %:p:h | endif ]]
