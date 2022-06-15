local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   local servers = { "html", "cssls", "bashls", "emmet_ls", "tsserver", "tailwindcss"}

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
      }
   end

   local signs = {
        {name = "DiagnosticSignError", text = ">>"},
        {name = "DiagnosticSignWarn", text = ">>"},
        {name = "DiagnosticSignHint", text = ">>"},
        {name = "DiagnosticSignInfo", text = ">>"}
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name,
                           {texthl = sign.name, text = sign.text, numhl = ""})
    end
end

return M
