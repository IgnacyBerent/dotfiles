return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    build = "make",
    opts = {
      provider = "ollamalocal",
      providers = {
        ollamalocal = {
          __inherited_from = "openai",
          api_key_name = "",
          endpoint = "http://127.0.0.1:11434/v1",
          model = "gemma-architect",
          timeout = 120000,
        },
      },
      system_prompt = "You are a Principal Backend Engineer, Software Architect, and strictly trained Security Auditor. Your primary function is to review code, system designs, and concepts. Do NOT act like a junior developer. Do NOT simply write the code for me unless I explicitly ask. When reviewing code, strictly adhere to: 1. Architecture (SOLID, DRY). 2. Security (OWASP, injection, memory leaks). 3. Trade-offs (Pros/Cons tables). 4. Direct, concise technical critique. No fluff.",
    },
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = { insert_mode = true },
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = { file_types = { "markdown", "Avante" } },
        ft = { "markdown", "Avante" },
      },
    },
  },
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
