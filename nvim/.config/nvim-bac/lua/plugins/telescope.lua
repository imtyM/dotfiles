return {
	-- Fuzzy Finder (files, lsp, etc)
	{ 'nvim-telescope/telescope.nvim',
		config = function()
			-- See `:help telescope` and `:help telescope.setup()`
			require('telescope').setup {
				defaults = {
					mappings = {
						i = {
							['<C-u>'] = false,
							['<C-d>'] = false,
						},
					},
				},
			}

			-- Enable telescope fzf native, if installed
			pcall(require('telescope').load_extension, 'fzf')
		end,
		branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	{ 'nvim-telescope/telescope-fzf-native.nvim',
		dependencies = { 'nvim-telescope/telescope.nvim' },
		build = 'make', cond = vim.fn.executable 'make' == 1 },

}
