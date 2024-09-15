return {
  {
    "tpope/vim-rails",
    ft = { "ruby", "slim" },
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "zidhuss/neotest-minitest",
    },
    opts = {
      adapters = {
        ["neotest-minitest"] = {
          test_cmd = function()
            return vim.tbl_flatten({
              "bundle",
              "exec",
              "rails",
              "test",
            })
          end,
        },
      },
    },
  },
  {
    "vim-ruby/vim-ruby",
    ft = { "ruby", "slim" },
  },
  {
    "chrisbra/csv.vim",
    ft = { "csv" },
  },
  {
    "slim-template/vim-slim",
    ft = { "slim" },
  },
}
