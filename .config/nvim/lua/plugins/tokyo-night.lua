return {
  "folke/tokyonight.nvim",
  opts = {
    transparent = true,
    on_highlights = function(hl, colors)
      hl.LineNrAbove = { fg = "#b2b8cf", bold = true }
      hl.LineNrBelow = { fg = "#b2b8cf", bold = true }
      hl.LineNr = { fg = "#b2b8cf", bold = true }
      hl.CursorLine = { bg = "#4a3d38" }
    end,
  },
}
