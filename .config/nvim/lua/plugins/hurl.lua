return {
  {
    "jellydn/hurl.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    ft = "hurl",
    init = function()
      vim.filetype.add({
        extension = {
          hurl = "hurl",
        },
      })
    end,
    opts = {
      floating = false,
      show_headers = true,
    },
    keys = {
      { "<leader>hr", "<cmd>HurlRunner<CR>", desc = "Run Hurl" },
      { "<leader>hA", "<cmd>HurlRunnerAt<CR>", desc = "Run Hurl At Point" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "hurl" })
      end
    end,
  },
}
