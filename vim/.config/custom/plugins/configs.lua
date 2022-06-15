local present, cmp = pcall(require, "cmp")

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

M.cmp = {
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
}

M.telescope = {
  defaults = {
    file_sorter = require("telescope.sorters").get_fzy_sorter
  }
}

M.nvim_tree = {
  view = {
    auto_resize = false,
    allow_resize = false
  }
}

M.cmp = {
  mapping = {
    ["<C-k>"] = cmp.mapping.confirm {
       behavior = cmp.ConfirmBehavior.Replace,
       select = true,
    },
    ["<CR>"] = cmp.mapping.confirm {
       select = false,
    },
  }
}

return M
