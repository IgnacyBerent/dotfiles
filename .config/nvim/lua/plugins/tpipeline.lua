return {
  { "nvim-lualine/lualine.nvim", enabled = false },

  {
    "nvim-mini/mini.statusline",
    opts = {
      content = {
        active = function()
          local MiniStatusline = require("mini.statusline")

          local function get_git_relative_path()
            local full_path = vim.fn.expand("%:p")
            local git_root = vim.fs.root(0, ".git")
            if not git_root or full_path == "" then
              return vim.fn.expand("%:.")
            end

            local relative = full_path:sub(#git_root + 2)
            -- If we are at the root (editing a file in the same folder as .git)
            return relative ~= "" and relative or vim.fn.expand("%:t")
          end

          local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 140 })
          local git = MiniStatusline.section_git({ trunc_width = 75 })
          local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
          local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
          local location = MiniStatusline.section_location({ trunc_width = 75 })

          local git_path = get_git_relative_path()
          local modified = vim.bo.modified and " [+]" or ""

          return MiniStatusline.combine_groups({
            { hl = mode_hl, strings = { mode } },
            { hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
            "%<",
            { hl = "MiniStatuslineFilename", strings = { git_path .. modified } },
            "%=",
            { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
            { hl = mode_hl, strings = { location } },
          })
        end,
      },
    },
  },

  {
    "vimpostor/vim-tpipeline",
    lazy = false,
    config = function()
      vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "NONE" })
      vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "NONE" })

      vim.opt.fillchars:append({ stl = " ", stlnc = " " })
    end,
  },
}
