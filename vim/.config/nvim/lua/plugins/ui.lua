return {
	{
		'beauwilliams/focus.nvim',
		config = function()
			require("focus").setup({ hybridnumber = true })
		end
	},
	{
		'nvim-lualine/lualine.nvim', -- Fancier statusline
		config = function()
			require('lualine').setup {
				options = {
					icons_enabled = false,
					component_separators = '|',
					section_separators = '',
				},
			}
		end
	},
	{
		'nvim-tree/nvim-tree.lua',
		config = function()
			require("nvim-tree").setup({
				remove_keymaps = { '<C-e>' }
			})
		end,
		dependencies = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	},
	{
		'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
		config = function()
			-- Enable `lukas-reineke/indent-blankline.nvim`
			-- See `:help indent_blankline.txt`
			require('indent_blankline').setup {
				char = '┊',
				show_trailing_blankline_indent = false,
			}
		end
	}
}
