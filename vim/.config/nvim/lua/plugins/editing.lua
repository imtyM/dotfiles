return {
	'tpope/vim-surround',
	'csexton/trailertrash.vim',
	'easymotion/vim-easymotion',
	'christoomey/vim-tmux-navigator',
	'tpope/vim-endwise',
	{
		'mg979/vim-visual-multi',
		branch = 'master'
	},
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup {
				-- your configuration comes here
				-- or leave it empty to  the default settings
				-- refer to the configuration section below
			}
		end
	},
	{
		'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
		config = function()
			require('Comment').setup()
		end
	},
	'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

}
