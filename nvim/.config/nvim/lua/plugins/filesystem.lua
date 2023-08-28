return {
  {
    'nvim-tree/nvim-tree.lua',
    enable = true,
    config = function()
      require('nvim-tree').setup {
        remove_keymaps = { '<C-e>' },
      }
    end,
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
  },
  {
    'echasnovski/mini.files',
    version = false,
    keys = {
      {
        '<leader>fm',
        function()
          require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = 'Open mini.files (directory of current file)',
      },
      {
        '<leader>fM',
        function()
          require('mini.files').open(vim.loop.cwd(), true)
        end,
        desc = 'Open mini.files (cwd)',
      },
      -- {
      --   '<C-e>',
      --   function()
      --     local MiniFiles = require('mini.files')
      --     if not MiniFiles.close() then MiniFiles.open(vim.api.nvim_buf_get_name(0), true) end
      --   end,
      -- }
    },
    config = function()
      local MiniFiles = require('mini.files')
      MiniFiles.setup()
      local map_split = function(buf_id, lhs, direction)
        local rhs = function()
          -- Make new window and set it as target
          local new_target_window
          vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
            vim.cmd(direction .. ' split')
            new_target_window = vim.api.nvim_get_current_win()
          end)

          MiniFiles.set_target_window(new_target_window)
        end

        -- Adding `desc` will result into `show_help` entries
        local desc = 'Split ' .. direction
        vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
      end

      vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniFilesBufferCreate',
        callback = function(args)
          local buf_id = args.data.buf_id
          -- Tweak keys to your liking
          map_split(buf_id, 'gs', 'belowright horizontal')
          map_split(buf_id, 'gv', 'belowright vertical')
        end,
      })
    end,
  },
  {
    'stevearc/oil.nvim',
    enable = false,
    opts = {},
    keys = {
      {
        '<leader>-',
        function()
          require('oil').open_float()
        end,
        desc = 'Toggle oil.nvim',
      },
    },
    config = function()
      require('oil').setup()
    end,
  },
}
