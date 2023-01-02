return {
		-- UI
		{
			'beauwilliams/focus.nvim',
			lazy = true,
			config = function()
				require("focus").setup({ hybridnumber = true })
			end
		},

		-- Language packages
		'tpope/vim-surround',
		'csexton/trailertrash.vim',
		'easymotion/vim-easymotion',
		'christoomey/vim-tmux-navigator',
		'tpope/vim-rails',
		'tpope/vim-endwise',
		'vim-ruby/vim-ruby',
		'chrisbra/csv.vim',

		"slim-template/vim-slim",

		{
			"Pocco81/true-zen.nvim",
			config = function()
				require("true-zen").setup {
					integrations = {
						tmux = true
					}
				}
			end,
		},

		{
			'mg979/vim-visual-multi',
			branch = 'master'
		},

		{ -- LSP Configuration & Plugins
			'neovim/nvim-lspconfig',
			dependencies = {
				-- Automatically install LSPs to stdpath for neovim
				'williamboman/mason.nvim',
				'williamboman/mason-lspconfig.nvim',

				-- Useful status updates for LSP
				'j-hui/fidget.nvim',
			},
		},

		{ -- Autocompletion
			'hrsh7th/nvim-cmp',
			dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
		},

		{ -- Highlight, edit, and navigate code
			'nvim-treesitter/nvim-treesitter',
			build = function()
				pcall(require('nvim-treesitter.install').update { with_sync = true })
			end,
		},

		{ -- Additional text objects via treesitter
			'nvim-treesitter/nvim-treesitter-textobjects',
			dependencies = 'nvim-treesitter',
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

		-- Git related plugins
		'tpope/vim-fugitive',
		'tpope/vim-rhubarb',
		'lewis6991/gitsigns.nvim',

		'nvim-lualine/lualine.nvim', -- Fancier statusline
		'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
		'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

		-- Fuzzy Finder (files, lsp, etc)
		{ 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

		-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },

		-- user
		{
			'nvim-tree/nvim-tree.lua',
			dependencies = {
				'nvim-tree/nvim-web-devicons', -- optional, for file icons
			},
			tag = 'nightly' -- optional, updated every week. (see issue #1193)
		},

		-- Nightfox
		{
			"EdenEast/nightfox.nvim",
			lazy = false,
			priority = 1000,
			config = function()
				vim.cmd [[
					colorscheme nordfox
				]]
			end
		},
		{
			'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
		}

	}
