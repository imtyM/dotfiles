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
  }
}
