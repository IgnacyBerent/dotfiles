return {
  {
    "huggingface/llm.nvim",
    opts = {
      backend = "ollama",
      url = "http://localhost:11434/api/generate",
      model = "qwen2.5-coder:1.5b-base",
      context_window = 8192,
      debounce_ms = 150,
      accept_keymap = "<C-a>",
      tokens_to_clear = { "<|file_separator|>", "<|end_of_turn|>", "<|eos|>", "<|cursor|>", "```", "\n" },
      fim = {
        enabled = true,
        prefix = "<|fim_prefix|>",
        middle = "<|fim_middle|>",
        suffix = "<|fim_suffix|>",
      },
      request_body = {
        options = {
          stop = { "<|file_separator|>", "<|end_of_turn|>", "<|eos|>", "```", "\n" },
          temperature = 0,
        },
      },
      style = {
        virtual_text = {
          highlight = "BlinkCmpGhostText",
        },
      },
    },
    config = function(_, opts)
      ---@type lsp.ClientCapabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      ---@diagnostic disable-next-line: inject-field
      capabilities.offsetEncoding = { "utf-16" }
      opts.lsp = opts.lsp or {}
      opts.lsp.capabilities = capabilities

      require("llm").setup(opts)
    end,
  },
}
