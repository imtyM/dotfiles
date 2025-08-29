return {
  "neovim/nvim-lspconfig",
  opts = function (_, opts)
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    keys[#keys + 1] = {"<C-k>", false, mode = "i"}
  end,
}
