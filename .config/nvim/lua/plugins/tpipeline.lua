return {
  {
    "vimpostor/vim-tpipeline",
    init = function()
      vim.g.tpipeline_auto_set_laststatus = 0
      vim.g.tpipeline_clear_status = 1
      vim.g.tpipeline_restore_laststatus = 0
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.globalstatus = true -- Required for tpipeline to get one clean string

      opts.winbar = {}
      opts.inactive_winbar = {}

      opts.options.theme = "auto"
    end,
  },
}
