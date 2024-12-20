return {
  {
    "mg979/vim-visual-multi",
    event = "BufRead",
    branch = "master",
  },
  {
    "easymotion/vim-easymotion",
    event = "BufRead",
    config = function()
      vim.cmd([[
      let g:EasyMotion_verbose = 0
      map  / <Plug>(easymotion-sn)
      omap / <Plug>(easymotion-tn)
    ]])
    end,
  },
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
    "echasnovski/mini.bufremove",
    keys = {
      {
        "<c-q>",
        function()
          require("mini.bufremove").delete(0, false)
        end,
        { desc = "Remove buffer" },
      },
    },
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
