local M = {}

M.bufferline = {
  options = {
    show_close_icon = false,
    show_buffer_close_icons = false,
    enforce_regular_tabs = true,
    custom_areas = {},

    offsets = {
      {
        filetype = "nerdtree",
        highlight = "Directory",
      }
    },
    custom_filter = function(buf_number)
      -- Func to filter out our managed/persistent split terms
      local present_type, type = pcall(function()
         return vim.api.nvim_buf_get_var(buf_number, "term_type")
      end)

      if present_type then
         if type == "vert" then
            return false
         elseif type == "hori" then
            return false
         end
      end

      if vim.fn.bufwinid(buf_number) == -1 then
        return false
      end

      return true
    end,
  }
}

M.ranger = function ()
  vim.g.rnvimr_enable_picker = 1
  vim.g.rnvimr_draw_border = 0
  vim.g.rnvimr_hide_gitignore = 1
  vim.g.rnvimr_enable_bw = 1

  vim.cmd [[
    let g:rnvimr_action = {
              \ '<C-t>': 'NvimEdit tabedit',
              \ '<C-s>': 'NvimEdit split',
              \ '<C-v>': 'NvimEdit vsplit',
              \ 'gw': 'JumpNvimCwd',
              \ 'yw': 'EmitRangerCwd'
              \ }
  ]]
end

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
  sources = {
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

M.trueZen = function ()
  local present, trueZen = pcall(require, "true-zen")

  if not present then
    return
  end

  local options = {
    modes = {
      ataraxis = {
        left_padding = 10,
        right_padding = 10,
        top_padding = 2,
        bottom_padding = 2,
        auto_padding = false
      }
    },
    integrations = {
      tmux = true
    }
  }

  trueZen.setup(options)
end

return M