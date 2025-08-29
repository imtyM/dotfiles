return {
  {
    "samir-roy/code-bridge.nvim",
    enabled = false,
      config = function()
        require('code-bridge').setup({
          tmux = {
            target_mode = 'window_name',     -- 'window_name', 'current_window', 'find_process'
            window_name = 'claude',          -- used when target_mode = 'window_name'
            process_name = 'claude',         -- used when target_mode = 'current_window' or 'find_process'
            switch_to_target = true,         -- whether to switch to target after sending
            find_node_process = true,        -- whether to look for a node.js process
          },
          interactive = {
            use_telescope = true,            -- use telescope for interactive prompts (default: true)
          }
        })
      end,
    keys = {
      {"<leader>ct", ":CodeBridgeTmux<CR>", mode= {"n", "v"}, { desc = "Send file to claude" }},
      {"<leader>cb", ":CodeBridgeTmuxAll<CR>", { desc = "Send all buffers to claude" }},
      {"<leader>ci", ":CodeBridgeTmuxInteractive<CR>", { desc = "Interactive prompt to claude" }},
      {"<leader>cd", ":CodeBridgeTmuxDiff<CR>", { desc = "Send git diff to claude" }},
      {"<leader>cr", ":CodeBridgeTmuxRecent<CR>", { desc = "Send recent files to claude" }},
      {"<leader>cq", ":CodeBridgeQuery<CR>", mode= {"n", "v"}, { desc = "Query claude with context" }},
      {"<leader>cc", ":CodeBridgeChat<CR>", { desc = "Chat with claude" }},
      {"<leader>ch", ":CodeBridgeHide<CR>", { desc = "Hide chat window" }},
      {"<leader>cs", ":CodeBridgeShow<CR>", { desc = "Show chat window" }},
      {"<leader>cx", ":CodeBridgeWipe<CR>", { desc = "Wipe chat and clear history" }},
      {"<leader>ck", ":CodeBridgeCancelQuery<CR>", { desc = "Cancel running query" }}
    }
  },
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    keys = {
      { "<leader>a", nil, desc = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
      },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  }
}
