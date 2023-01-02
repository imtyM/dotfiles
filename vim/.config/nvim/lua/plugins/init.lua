local M = {}

M.load = function(is_bootstrap)
	require('packer').startup(function(use)
		-- Package manager
		use {
			'wbthomason/packer.nvim',
		}

		-- UI
		use {
			'beauwilliams/focus.nvim',
			opt = true,
			config = function()
				require("focus").setup({ hybridnumber = true })
			end
		}

		-- Language packages
		use 'tpope/vim-surround'
		use 'csexton/trailertrash.vim'
		use 'easymotion/vim-easymotion'
		use 'christoomey/vim-tmux-navigator'
		use 'tpope/vim-rails'
		use 'tpope/vim-endwise'
		use 'vim-ruby/vim-ruby'
		use 'chrisbra/csv.vim'

		use "slim-template/vim-slim"

		use {
			"Pocco81/true-zen.nvim",
			config = function()
				require("true-zen").setup {
					integrations = {
						tmux = true
					}
				}
			end,
		}

		use {
			'mg979/vim-visual-multi',
			branch = 'master'
		}

		use { -- LSP Configuration & Plugins
			'neovim/nvim-lspconfig',
			requires = {
				-- Automatically install LSPs to stdpath for neovim
				'williamboman/mason.nvim',
				'williamboman/mason-lspconfig.nvim',

				-- Useful status updates for LSP
				'j-hui/fidget.nvim',
			},
		}

		use { -- Autocompletion
			'hrsh7th/nvim-cmp',
			requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
		}

		use { -- Highlight, edit, and navigate code
			'nvim-treesitter/nvim-treesitter',
			run = function()
				pcall(require('nvim-treesitter.install').update { with_sync = true })
			end,
		}

		use { -- Additional text objects via treesitter
			'nvim-treesitter/nvim-treesitter-textobjects',
			after = 'nvim-treesitter',
		}

		use {
			"folke/which-key.nvim",
			config = function()
				require("which-key").setup {
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
				}
			end
		}

		-- Git related plugins
		use 'tpope/vim-fugitive'
		use 'tpope/vim-rhubarb'
		use 'lewis6991/gitsigns.nvim'

		use 'nvim-lualine/lualine.nvim' -- Fancier statusline
		use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
		use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
		use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

		-- Fuzzy Finder (files, lsp, etc)
		use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

		-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
		use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

		-- user
		use {
			'nvim-tree/nvim-tree.lua',
			requires = {
				'nvim-tree/nvim-web-devicons', -- optional, for file icons
			},
			tag = 'nightly' -- optional, updated every week. (see issue #1193)
		}

		-- Nightfox
		use "EdenEast/nightfox.nvim"

		if is_bootstrap then
			require('packer').sync()
		end
	end)
end

return M
