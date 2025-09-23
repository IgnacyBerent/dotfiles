return {
  "dstein64/nvim-scrollview",
  event = "VeryLazy", -- Lazy-load on startup to avoid delays
  opts = {
    -- Enable the scrollbar (default: true)
    scrollbar = {
      enabled = true,
    },
    -- Enable signs for diagnostics, marks, etc. (default: true)
    signs = {
      enabled = true,
      -- Customize sign groups (e.g., search, diagnostics)
      search = { enabled = true },
      diagnostics = { enabled = true },
      marks = { enabled = true }, -- Requires Neovim >= 0.10
    },
    -- Exclude certain filetypes (optional)
    excluded_filetypes = { "NvimTree", "netrw" },
    -- Current line highlighting in the scrollbar (optional)
    current_line = true,
  },
}
