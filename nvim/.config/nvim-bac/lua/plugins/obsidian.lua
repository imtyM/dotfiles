return {
  {
    "epwalsh/obsidian.nvim",
    -- lazy = true,
    -- event = { "BufReadPre /mnt/c/Users/Imtiaz Mukadam/Documents/main/**.md" },
    -- -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
    -- -- event = { "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    config = function()
      require("obsidian").setup({
        dir = "/mnt/c/Users/Imtiaz Mukadam/Documents/main",  -- no need to call 'vim.fn.expand' here
        daily_notes = {
          folder = "journal/daily",
        },

        mappings = {
          -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
          ["fo"] = require("obsidian.mapping").gf_passthrough()
        },
      })
    end,
  }
}
