return {
  "lervag/vimtex",
  ft = "tex", -- Load only for .tex files
  config = function()
    vim.g.tex_flavor = "latex" -- Treat .tex as LaTeX by default
    vim.g.vimtex_view_method = "general"
    vim.g.vimtex_view_general_viewer = "okular"
    vim.g.vimtex_view_general_options = "--unique @pdf\\#src:@line@tex --stylesheet /home/iberent/.config/okular.qss" -- Force single instance and forward search
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      callback = 1, -- Auto-open viewer after successful compile
      continuous = 1, -- Continuous watching (toggle with <leader>lt)
      options = {
        "-pdf",
        "-interaction=nonstopmode",
        "-synctex=1",
      },
    }
    -- Disable auto-open to prevent multiple instances
    vim.g.vimtex_view_automatic = 1
    -- Keymaps
    vim.keymap.set("n", "\\ll", "<cmd>VimtexCompile<cr>", { desc = "Compile LaTeX" })
    vim.keymap.set("n", "\\lv", "<cmd>VimtexView<cr>", { desc = "View PDF" })
    vim.keymap.set("n", "\\lf", "<cmd>VimtexCompileSelected<cr>", { desc = "Forward Search" })
    vim.keymap.set("x", "<leader>b", 'c\\textbf{<C-r>"}', { desc = "Bold selection" })
    vim.keymap.set("x", "<leader>i", 'c\\textit{<C-r>"}', { desc = "Italic selection" })
  end,
}
