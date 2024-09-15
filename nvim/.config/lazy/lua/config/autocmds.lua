-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- if os.getenv("TMUX") then
--   print("FOUND TMUX")
--   vim.cmd([[
--     augroup tmux_something
--       autocmd VimResume  * call system('tmux set status off')
--       autocmd VimEnter   * call system('tmux set status off')
--       autocmd VimLeave   * call system('tmux set status on')
--       autocmd VimSuspend * call system('tmux set status on')
--     augroup END
--   ]])
-- end

-- Disable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "lua", "py", "python" },
  callback = function()
    vim.b.autoformat = false
  end,
})
