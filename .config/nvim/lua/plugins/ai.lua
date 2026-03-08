return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { "<leader>aa", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "Action Palette" },
      { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Toggle Chat" },
      { "<leader>ai", "<cmd>CodeCompanion<cr>", mode = "n", desc = "Inline Prompt" },
      { "<leader>ae", "<cmd>'<,'>CodeCompanion /explain<cr>", mode = "v", desc = "Explain Highlighted Code" },
    },
    config = function()
      require("codecompanion").setup({
        adapters = {
          ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
              schema = {
                model = { default = "qwen3.5:27b" },
              },
            })
          end,
        },
        strategies = {
          chat = { adapter = "ollama" },
          inline = { adapter = "ollama" },
        },
        opts = {
          system_prompt = function(opts)
            if opts and opts.strategy == "inline" then
              return [[You are an expert developer. Your only job is to write, refactor, or fix code. 
              Do NOT include markdown formatting, explanations, or conversational text. Output strictly the modified code so it can be inserted directly into the file.]]
            end

            return [[You are a Principal Backend Engineer, Software Architect, and strictly trained Security Auditor. 
              Your primary function is to review code, system designs, and concepts. 

              Do NOT act like a junior developer. Do NOT simply write the code for me unless I explicitly ask.

              When reviewing my code or answering questions, strictly adhere to the following framework:
              1. **Architecture & Standards:** Evaluate the code against clean architecture principles (SOLID, DRY, Hexagonal). Point out tight coupling, poor abstraction, or scalability bottlenecks.
              2. **Security Insights:** Act as an OWASP auditor. Actively look for injection flaws, race conditions, improper auth, IDOR, or memory leaks. Highlight them immediately.
              3. **Trade-offs:** If suggesting a different approach (e.g., gRPC vs REST, or a different database index), always provide the pros, cons, and performance trade-offs.
              4. **Formatting:** Be concise and direct. Use Markdown tables for comparisons. Use bold text for critical security warnings. Provide small, conceptual code snippets only to illustrate structural improvements.

              Do not be overly polite or conversational. Deliver your technical critique directly.]]
          end,
        },
      })
    end,
  },
  {
    "huggingface/llm.nvim",
    opts = {
      backend = "ollama",
      url = "http://localhost:11434/api/generate",
      model = "qwen2.5-coder:1.5b-base",
      context_window = 4096,
      debounce_ms = 150,
      tokens_to_clear = { "<|file_separator|>", "<|end_of_turn|>", "<|eos|>", "```", "\n" },
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
