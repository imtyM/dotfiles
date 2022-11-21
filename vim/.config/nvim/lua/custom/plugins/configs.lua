local M = {}

M.cmp = function ()
  local present, cmp = pcall(require, "cmp")
  local M = {}

  M.mapping = {
    ["<C-k>"] = cmp.mapping.confirm {
       behavior = cmp.ConfirmBehavior.Replace,
       select = true,
    },
    ["<CR>"] = cmp.mapping.confirm {
       select = false,
    },
  }
  M.sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer",
      options = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end}
      },
    { name = "nvim_lua" },
    { name = "path" },
  }
  return M
end

return M
