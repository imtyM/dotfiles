local logo = [[
        █╗                                            
        █║                                            
        ╚╝                                            
      █ █ █╗                                          
      ╚█╔█╔╝                       █╗                 
 █████╗╚╝╚╝ ██╗ ██╗                 █╗                
██╔═██║ ██╗ ██║ ██║                █╔╝                
 █████║ ██║ ██║ ██║  ██████╗   ██╗ ╚╝  ██╗ ██     ██╗ 
 ╚══██║ ██║ ██║ ██║ ██╔═══██╗  ██║ ██╗ ██║ ██     ██║ 
    ██████████║ ██║ ████████████████████╔╝ ╚███████╔╝ 
    ╚═════════╝ ╚═╝ ██╔═════════════════╝   ╚══════╝  
                    ██║                        ██╗    
                    ╚═╝                        ╚═╝    
]]

logo = string.rep("\n", 8) .. logo .. "\n\n"

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

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = {
      config = {
        header = vim.split(logo, "\n"),
      },
    },
  },
}
