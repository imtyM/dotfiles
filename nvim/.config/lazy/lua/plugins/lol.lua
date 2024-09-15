return {
  {
    "folke/zen-mode.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      plugins = {
        tmux = { enabled = true },
      },
    },
    keys =  {
      { "<leader>uz", ":ZenMode<CR>", { desc = "Zen mode max" } },
      { 
        "<C-x>",
        function()
          require("zen-mode").toggle({
            window = {
              width = 0.85,
              height = 0.98,
            },
            plugins = {
              options = {
                laststatus = 0,
              },
              tmux = { enabled = true }
            },
          })
        end,
        { desc = "Zen mode min" }
      },
    },
  },
}
