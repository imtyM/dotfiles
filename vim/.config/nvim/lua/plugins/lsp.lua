return {
	{ -- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		config = function()
			-- LSP settings.
			--  This function gets run when an LSP connects to a particular buffer.
			local on_attach = function(_, bufnr)
				-- NOTE: Remember that lua is a real programming language, and as such it is possible
				-- to define small helper and utility functions so you don't have to repeat yourself
				-- many times.
				--
				-- In this case, we create a function that lets us more easily define mappings specific
				-- for LSP related items. It sets the mode, buffer and description for us each time.

				-- Create a command `:Format` local to the LSP buffer
				vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
					if vim.lsp.buf.format then
						vim.lsp.buf.format()
					elseif vim.lsp.buf.formatting then
						vim.lsp.buf.formatting()
					end
				end, { desc = 'Format current buffer with LSP' })
			end

			-- Setup mason so it can manage external tooling
			require('mason').setup()

			-- Enable the following language servers
			-- Feel free to add/remove any LSPs that you want here. They will automatically be installed
			local servers = { 'tsserver', 'lua_ls', 'prismals', 'tailwindcss' }

			-- Ensure the servers above are installed
			require('mason-lspconfig').setup {
				ensure_installed = servers,
			}

			-- nvim-cmp supports additional completion capabilities
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

			for _, lsp in ipairs(servers) do
				require('lspconfig')[lsp].setup {
					on_attach = on_attach,
					capabilities = capabilities,
				}
			end

			-- Turn on lsp status information
			require('fidget').setup()

			-- Example custom configuration for lua
			--
			-- Make runtime files discoverable to the server
			local runtime_path = vim.split(package.path, ';')
			table.insert(runtime_path, 'lua/?.lua')
			table.insert(runtime_path, 'lua/?/init.lua')

			require('lspconfig').lua_ls.setup {
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = {
							-- Tell the language server which version of Lua you're using (most likely LuaJIT)
							version = 'LuaJIT',
							-- Setup your lua path
							path = runtime_path,
						},
						diagnostics = {
							globals = { 'vim' },
						},
						workspace = { library = vim.api.nvim_get_runtime_file('', true) },
						-- Do not send telemetry data containing a randomized but unique identifier
						telemetry = { enable = false },
					},
				},
			}
		end,
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',

			-- Useful status updates for LSP
			'j-hui/fidget.nvim',
		},
	},
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		dependencies = {
			'EdenEast/nightfox.nvim'
		},
		config = function()
			require("lspsaga").setup({})
			vim.cmd [[ 
				colorscheme nordfox
			]]
		end,
	},
	{
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}
}
