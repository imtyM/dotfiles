-- This is an example chadrc file , its supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "nord",
}

-- Install plugins
local userPlugins = require "custom.plugins" -- path to table

M.plugins = {
  install = userPlugins,

  options = {
    lspconfig = {
      setup_lspconf = "custom.lsp.lspconfig"
    }
  },

  status = {
    blankline = true, -- indentline stuff
    bufferline = true, -- manage and preview opened buffers
    colorizer = false, -- color RGB, HEX, CSS, NAME color codes
    comment = true, -- easily (un)comment code, language aware
    dashboard = true,
    better_escape = true, -- map to <ESC> with no lag
    feline = true, -- statusline
    gitsigns = true,
    lspsignature = true, -- lsp enhancements
    vim_matchup = true, -- improved matchit
    cmp = true,
    snippets = false,
    nvimtree = true,
    autopairs = true,
  },

  default_plugin_config_replace = {
    nvim_tree = {
      view = {
        auto_resize = false,
        allow_resize = false
      }
    },
    nvimtree = {
      view = {
        auto_resize = false,
        allow_resize = false
      }
    },
    bufferline = {
      options = {
        buffer_close_icon = "",
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

          return true
        end,
      }
    }
  },
}

M.mappings = {
   misc = {
      close_buffer = "<C-x>",
      copy_whole_file = "<C-a>", -- copy all contents of current buffer
      copy_to_system_clipboard = "<C-c>", -- copy selected text (visual mode) or curent line (normal)
      line_number_toggle = "<leader>n", -- toggle line number
      relative_line_number_toggle = "<leader>rn",
      update_nvchad = "<leader>uu",
      new_buffer = "<S-t>",
      new_tab = "tn",
      save_file = "<C-w>", -- save file using :w
   },

   insert_nav = {
      next_line = "",
      prev_line = "",
   },

   terminal = {
      -- multiple mappings can be given for esc_termmode, esc_hide_termmode

      -- get out of terminal mode
      esc_termmode = { "<C-j>" },

      -- get out of terminal mode and hide it
      esc_hide_termmode = { "<JK>" },
      -- show & recover hidden terminal buffers in a telescope picker
      pick_term = "<leader>W",

      -- spawn terminals
      new_horizontal = "<leader>h",
      new_vertical = "<leader>v",
      new_window = "<leader>w",
   },

}

M.mappings.plugins = {
   bufferline = {
      next_buffer = "<C-o>",
      prev_buffer = "<C-i>",
   },
   comment = {
      toggle = "<leader>/",
   },

   -- map to <ESC> with no lag
   better_escape = { -- <ESC> will still work
      esc_insertmode = {"jj"}, -- multiple mappings allowed
   },
}

-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event','cmd' fields)
-- see: https://github.com/wbthomason/packer.nvim
-- https://nvchad.github.io/config/walkthrough

return M
