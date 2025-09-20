return {
  {
    "tpope/vim-rails",
    ft = { "ruby", "slim" },
    config = function()
      vim.api.nvim_create_user_command('AC', "execute '!touch ' . eval('rails#buffer().alternate()')", {})
    end,
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "zidhuss/neotest-minitest",
    },
    opts = {
      adapters = {
        ["neotest-minitest"] = {
          test_cmd = function()
            return vim.tbl_flatten({
              "bundle",
              "exec",
              "rails",
              "test",
            })
          end,
        },
      },
    },
  },
  {
    "vim-ruby/vim-ruby",
    ft = { "ruby", "slim" },
  },
  {
    "chrisbra/csv.vim",
    ft = { "csv" },
  },
  {
    "slim-template/vim-slim",
    ft = { "slim" },
  },
  {
    "obsidian-nvim/obsidian.nvim",
    lazy = true,
    enabled = false,
    version = "*", -- recommended, use latest release instead of latest commit
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/vaults/personal",
        },
        {
          name = "work",
          path = "~/vaults/work",
        },
      },

      -- see below for full list of options 👇
    },
  }
}
