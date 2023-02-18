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
			local lsp_name = function()
				local msg = ''
				local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
				local clients = vim.lsp.get_active_clients()
				if next(clients) == nil then
					return msg
				end
				for _, client in ipairs(clients) do
					local filetypes = client.config.filetypes
					if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
						return client.name
					end
				end
				return msg
			end
			require('lualine').setup {
				options = {
					icons_enabled = false,
					component_separators = '|',
					section_separators = '',
				},
				sections = {
					lualine_x = { lsp_name, 'fileformat', 'filetype'}
				}
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
	},
	{
		'folke/zen-mode.nvim',
		config = function ()
			require('zen-mode').setup({
				window = {
					width = 0.8
				},
				on_open = function ()
					if vim.fn.has("nvim-0.8") == 1 then
						vim.opt.cmdheight = 1
					end
					os.execute('tmux set -g status off')
				end,
				on_close = function ()
					if vim.fn.has("nvim-0.8") == 1 then
						vim.opt.cmdheight = 0
					end
					os.execute('tmux set -g status on')
				end
			})
		end
	},
	{ 'folke/todo-comments.nvim',
		config = function ()
			require('todo-comments').setup({
				highlight = {
					pattern = [[.*<(KEYWORDS)\s*]],
				},
				pattern = [[\b(KEYWORDS)\b]]
			})
		end
	}
}
