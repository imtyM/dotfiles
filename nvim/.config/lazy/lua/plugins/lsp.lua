return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = false,
    }
  },
  keys = {
    {"<C-k>", false, mode = "i"}
  }
}
