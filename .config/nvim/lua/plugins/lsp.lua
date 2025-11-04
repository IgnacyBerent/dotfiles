return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Disable default Pyright if installed
        pyright = { enabled = false },
        -- Configure BasedPyright
        basedpyright = {
          enabled = true,
          settings = {
            basedpyright = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace", -- or "openFilesOnly"
                useLibraryCodeForTypes = true,
                typeCheckingMode = "basic", -- options: "off", "basic", "strict", "all"
              },
            },
          },
        },
      },
    },
  },
}
