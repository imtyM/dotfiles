return {
  {
    'beauwilliams/focus.nvim',
    event = 'BufEnter',
    config = function()
      require('focus').setup { hybridnumber = true }
    end,
  },
  {
    'nvim-lualine/lualine.nvim', -- Fancier statusline
    config = function()
      local lsp_name = function()
        local msg = ''
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return msg
      end
      require('lualine').setup {
        options = {
          icons_enabled = false,
          component_separators = '|',
          section_separators = '',
        },
        sections = {
          lualine_x = { lsp_name, 'fileformat', 'filetype' },
        },
      }
    end,
  },
  -- -- lazy.nvim
  -- {
  --   'folke/noice.nvim',
  --   event = 'VeryLazy',
  --   opts = {
  --     -- add any options here
  --   },
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     'MunifTanjim/nui.nvim',
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     {
  --       'rcarriga/nvim-notify',
  --       opts = {
  --         presets = {
  --           -- bottom_search = true, -- use a classic bottom cmdline for search
  --           command_palette = true, -- position the cmdline and popupmenu together
  --           long_message_to_split = true, -- long messages will be sent to a split
  --           inc_rename = false, -- enables an input dialog for inc-rename.nvim
  --           lsp_doc_border = false, -- add a border to hover docs and signature help
  --         },
  --         fps = 60,
  --         stages = 'fade',
  --         timeout = 2000,
  --         max_height = function()
  --           return math.floor(vim.o.lines * 0.75)
  --         end,
  --         max_width = function()
  --           return math.floor(vim.o.columns * 0.75)
  --         end,
  --       },
  --       keys = {
  --         {
  --           '<leader>nd',
  --           function()
  --             require('notify').dismiss { silent = true, pending = true }
  --           end,
  --           desc = 'Dismiss all Notifications',
  --         },
  --       },
  --     },
  --   },
  --   config = function()
  --     require('noice').setup {
  --       lsp = {
  --         -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
  --         override = {
  --           ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
  --           ['vim.lsp.util.stylize_markdown'] = true,
  --           ['cmp.entry.get_documentation'] = true,
  --         },
  --       },
  --       -- you can enable a preset for easier configuration
  --       presets = {
  --         bottom_search = true, -- use a classic bottom cmdline for search
  --         command_palette = true, -- position the cmdline and popupmenu together
  --         long_message_to_split = true, -- long messages will be sent to a split
  --         inc_rename = false, -- enables an input dialog for inc-rename.nvim
  --         lsp_doc_border = false, -- add a border to hover docs and signature help
  --       },
  --     }
  --   end,
  -- },
  {
    'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
    config = function()
      -- Enable `lukas-reineke/indent-blankline.nvim`
      -- See `:help indent_blankline.txt`
      require('indent_blankline').setup {
        char = '┊',
        show_trailing_blankline_indent = false,
      }
    end,
  },
  {
    'folke/zen-mode.nvim',
    config = function()
      require('zen-mode').setup {
        window = {
          width = 0.8,
        },
        on_open = function()
          if vim.fn.has 'nvim-0.8' == 1 then
            vim.opt.cmdheight = 1
          end
          os.execute 'tmux set -g status off'
        end,
        on_close = function()
          if vim.fn.has 'nvim-0.8' == 1 then
            vim.opt.cmdheight = 0
          end
          os.execute 'tmux set -g status on'
        end,
      }
    end,
  },
  {
    'folke/todo-comments.nvim',
    config = function()
      require('todo-comments').setup {
        highlight = {
          pattern = [[.*<(KEYWORDS)\s*]],
        },
        pattern = [[\b(KEYWORDS)\b]],
      }
    end,
  },
  {
    'folke/persistence.nvim',
    event = 'BufReadPre', -- this will only start session saving when an actual file was opened
    opts = { options = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp' } },
    -- stylua: ignore
    keys = {
      { "<leader>sr", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>sl", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session"},
    },
  },
}
