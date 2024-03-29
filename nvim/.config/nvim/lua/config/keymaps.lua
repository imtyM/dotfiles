local keymap = vim.keymap.set

local nmap = function(keys, func, desc)
  if desc then
    desc = 'LSP: ' .. desc
  end

  vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end
-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v', 'i' }, '<C-j>', '<ESC>', { desc = 'Another escape' })
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Window left' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Window down' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Window up' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Window right' })

vim.keymap.set('n', '<C-o>', '<cmd>tabnext<CR>', { desc = 'Next tab' })
vim.keymap.set('n', '<C-i>', '<cmd>tabprevious<CR>', { desc = 'Previous tab' })

vim.keymap.set('n', '<C-w>', '<cmd>wa<CR>', { desc = 'Save all' })
vim.keymap.set('i', '<C-w>', '<ESC><cmd>wa<CR>', { desc = 'Save all' })

vim.keymap.set('n', '<C-q>', '<cmd>q<CR>', { desc = 'quit buffer' })
vim.keymap.set('i', '<C-q>', '<ESC><cmd>q<CR>', { desc = 'quit buffer' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })
vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
keymap('n', '<leader>r', require('telescope.builtin').resume, { silent = true, desc = '[R]esume' })
vim.keymap.set('n', '<leader>so', require('telescope.builtin').oldfiles, { desc = '[S]earch [O]ld Files' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<C-e>', '<cmd> NvimTreeFindFileToggle <CR>', { desc = 'Toggle file explorer' })

-- Zen mode
vim.keymap.set('n', '<leader>gy', '<cmd>ZenMode<CR>', { desc = '[G]o[Y]o' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

--Easymotion
vim.cmd [[
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
]]

-- Git

nmap('<leader>gg', ':tabnew <CR>:G<CR>:winc k<CR>:q<CR>:NvimTreeClose<CR>', '[G]it')

------------------------ LSP keymaps -------------------------
-- Finder
keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', { silent = true })

-- Code action
-- nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
keymap({ 'n', 'v' }, '<leader>ca', '<cmd>Lspsaga code_action<CR>', { silent = true, desc = '[C]ode [A]ction' })


-- nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', { silent = true, desc = '[P]eek definition' })

-- Show line diagnostics
keymap('n', '<leader>gq', '<cmd>Lspsaga show_line_diagnostics<CR>', { silent = true, desc = 'Show line diagnostics' })

-- Show cursor diagnostics
keymap('n', '<leader>gq', '<cmd>Lspsaga show_cursor_diagnostics<CR>', { silent = true, desc = 'Show cursor diagnostics' })

-- Outline
keymap('n', '<leader>o', '<cmd>Lspsaga outline<CR>', { silent = true, desc = 'Lsp [O]utline' })

nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

-- See `:help K` for why this keymap
-- nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
-- Hover Doc
keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>', { silent = true, desc = 'Hover doc' })

-- Lesser used LSP functionality
nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
nmap('<leader>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, '[W]orkspace [L]ist Folders')

-- Trouble
-- Lua
vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { silent = true, noremap = true, desc = 'Trouble diagnostics' })
vim.keymap.set('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', { silent = true, noremap = true, desc = 'Trouble diagnostics workspace' })
vim.keymap.set('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', { silent = true, noremap = true, desc = 'Trouble diagnostics document' })
vim.keymap.set('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>', { silent = true, noremap = true, desc = 'Trouble diagnostics loclist' })
vim.keymap.set('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', { silent = true, noremap = true, desc = 'Trouble diagnostics quickfix' })
vim.keymap.set('n', 'gR', '<cmd>TroubleToggle lsp_references<cr>', { silent = true, noremap = true, desc = 'Trouble diagnostics lsp_references' })

------------------------ Neorg -------------------------
nmap('<leader>nm', ':Neorg workspace main<CR>', '[N]eorg [M]ain')
