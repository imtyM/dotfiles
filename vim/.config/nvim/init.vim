" Base
source ~/.config/nvim/vim/plugins.vim
source ~/.config/nvim/vim/sets.vim
source ~/.config/nvim/vim/theme.vim
source ~/.config/nvim/vim/mappings.vim

" Plugin config

lua << EOF
require('imtiaz.lsp')
require('imtiaz.treesitter')
require('imtiaz.lualine')
require('imtiaz.bufferline')
EOF
