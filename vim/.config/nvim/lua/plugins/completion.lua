local function border(hl_name)
	return {
		{ "╭", hl_name },
		{ "─", hl_name },
		{ "╮", hl_name },
		{ "│", hl_name },
		{ "╯", hl_name },
		{ "─", hl_name },
		{ "╰", hl_name },
		{ "│", hl_name },
	}
end

return {
	{ -- Autocompletion
		'hrsh7th/nvim-cmp',
		config = function()
			local cmp = require 'cmp'
			local luasnip = require 'luasnip'

			cmp.setup {
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = {
						border = border "CmpBorder",
						winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
					},
					documentation = {
						border = border "CmpDocBorder",
					},
				},
				mapping = cmp.mapping.preset.insert {
					['<C-d>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-k>'] = cmp.mapping.confirm {
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					},
					['<Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { 'i', 's' }),
					['<C-l>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { 'i', 's' }),
					['<S-Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { 'i', 's' }),
					['<C-h>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { 'i', 's' }),
				},
				sources = {
					{
						name = 'buffer',
						option = {
							get_bufnrs = function()
								return vim.api.nvim_list_bufs()
							end
						}
					},
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
					{ name = "path" },
				},
			}
			cmp.setup.filetype('gitcommit', {
				sources = cmp.config.sources({
					{ name = 'conventionalcommits' }
				})
			})
		end,
		dependencies = {
			'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip', 'tzachar/cmp-fuzzy-buffer',
			'tzachar/fuzzy.nvim', 'neovim/nvim-lspconfig', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
			{
				'rafamadriz/friendly-snippets',
				config = function ()
					require("luasnip.loaders.from_vscode").lazy_load()
					require('luasnip').filetype_extend("ruby", {"rails"})
					end
			}
		},
	},
}
