return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = { enabled = false },
        ruff = {},
        ty = {
          settings = {
            ty = {
              typeCheckingMode = "standard",
              autoImportCompletions = true,
              inlayHints = true,
              hover = true,
            },
          },
        },
      },
    },
  },
}
