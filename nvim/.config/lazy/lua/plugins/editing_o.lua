return {
  {

    "nvim-telescope/telescope.nvim",
    enabled = false,
    opts = function()
      local actions = require("telescope.actions")
      return {
        defaults = {
          mappings = {
            i = {
              ["<c-t>"] = actions.select_tab,
            },
          },
        },
      }
    end,
  },
  {
    'fzf-lua',
    opts = function(_, opts)
      local actions = require("fzf-lua.actions")

      return {
        files = {
          actions = {
            ["ctrl-t"] = actions.file_tabedit,
          }
        }
      }
    end,
    keys = {
      { "<C-p>", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
    }
  }
}
