return {
	settings = {

		Lua = {
			diagnostics = {
				globals = { "vim", "bubbles_theme" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}
