require('bufferline').setup {
  options = {
    offsets = {
        {
          filetype = "nerdtree",
          highlight = "Directory",
        }
      },
    close_icon = '',
    custom_filter = function(buf_number)
      if vim.fn.bufwinid(buf_number) ~= -1 then
        return true
      end
    end
  },
}
