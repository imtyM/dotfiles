local function set_win()
  local height_ratio = 0.8
  local width_ratio = 0.8

  local lines = vim.opt.lines:get() - vim.opt.cmdheight:get()
  local columns = vim.opt.columns:get() - 2

  local window_h = math.floor(lines * height_ratio)
  local window_w = math.floor(columns * width_ratio)
  local center_y = math.floor(((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get())
  local center_x = math.floor((vim.opt.columns:get() - window_w) / 2) - 2
  return {
    relative = "editor",
    border = "rounded",
    width = window_w,
    height = window_h,
    row = center_y,
    col = center_x,
  }
end

return {
  {
    "nvim-tree/nvim-tree.lua",
    enabled = true,
    config = function()
      require("nvim-tree").setup({
        remove_keymaps = { "<C-e>", "s" },
        view = {
          float = {
            enable = true,
            quit_on_focus_loss = true,
            open_win_config = set_win(),
          },
        },
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
      })
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly", -- optional, updated every week. (see issue #1193)
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = true,
    opts = {
      mark_branch = true,
    },
    keys = {
      {
        "<S-y>",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Toggle Harpoon",
        mode = "n",
      },
      {
        "<S-u>",
        function()
          require("harpoon.mark").add_file()
          vim.notify("Marked current file", "info", { title = "Harpoon" })
        end,
        desc = "Mark current file",
        mode = "n",
      },
      {
        "<S-h>",
        function()
          require("harpoon.ui").nav_prev()
        end,
        desc = "Navigate to previous mark",
        mode = "n",
      },
      {
        "<S-l>",
        function()
          require("harpoon.ui").nav_next()
        end,
        desc = "Navigate to previous mark",
        mode = "n",
      },
    },
  },
  {
    "echasnovski/mini.files",
    version = false,
    enabled = false,
    keys = {
      {
        "<leader>fm",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (directory of current file)",
      },
      {
        "<leader>fM",
        function()
          require("mini.files").open(vim.loop.cwd(), true)
        end,
        desc = "Open mini.files (cwd)",
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
      local MiniFiles = require("mini.files")
      MiniFiles.setup()
      local map_split = function(buf_id, lhs, direction)
        local rhs = function()
          -- Make new window and set it as target
          local new_target_window
          vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
            vim.cmd(direction .. " split")
            new_target_window = vim.api.nvim_get_current_win()
          end)

          MiniFiles.set_target_window(new_target_window)
        end

        -- Adding `desc` will result into `show_help` entries
        local desc = "Split " .. direction
        vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
      end

      local map_new_tab = function(buf_id, lhs)
        local rhs = function()
          -- Make new window and set it as target
          local new_target_window
          vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
            vim.cmd("tabnew")
            new_target_window = vim.api.nvim_get_current_win()
          end)

          MiniFiles.set_target_window(new_target_window)
        end

        -- Adding `desc` will result into `show_help` entries
        local desc = "Open in new tab"
        vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id
          -- Tweak keys to your liking
          map_split(buf_id, "<C-x>", "belowright horizontal")
          map_split(buf_id, "<C-v>", "belowright vertical")
          map_new_tab(buf_id, "<C-t>")
        end,
      })
    end,
  },
  {
    "stevearc/oil.nvim",
    enabled = false,
    opts = {},
    keys = {
      {
        "<leader>-",
        function()
          require("oil").open_float()
        end,
        desc = "Toggle oil.nvim",
      },
    },
    config = function()
      require("oil").setup()
    end,
  },
}
