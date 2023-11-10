return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "tabs",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  },
  {
    "nvim-focus/focus.nvim",
    event = "BufRead",
    version = false,
    config = function()
      require("focus").setup()
    end,
  },
}
