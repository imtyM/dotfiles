source ~/.config/nvim/plugins
source ~/.config/nvim/base.vim
source ~/.config/nvim/theme
source ~/.config/nvim/mappings
"source ~/.config/nvim/coc.vim

lua << EOF
require('imtiaz.lsp')
require('imtiaz.treesitter')
EOF
