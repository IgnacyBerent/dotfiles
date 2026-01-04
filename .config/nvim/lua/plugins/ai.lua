return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
  {
    "yetone/avante.nvim",
    keys = {
      {
        "<leader>aae",
        function()
          require("avante.config").override({
            provider = "copilot",
            providers = { copilot = { model = "claude-3.5-sonnet" } },
          })
          require("avante.api").ask({ question = "Explain how this code works explicitly in detail." })
        end,
        desc = "Explain Code",
        mode = { "n", "v" },
      },

      {
        "<leader>aav",
        function()
          require("avante.config").override({
            provider = "copilot",
            providers = { copilot = { model = "gpt-3.5-turbo" } },
          })
          require("avante.api").ask({
            question = "Suggest a better name for this variable. Result provide in form of list of better examples.",
          })
        end,
        desc = "Suggest Better Variable Name",
        mode = { "v" },
      },

      {
        "<leader>aaf",
        function()
          require("avante.config").override({
            provider = "copilot",
            providers = { copilot = { model = "claude-3.5-sonnet" } },
          })
          require("avante.api").ask({
            question = "Analyse if any bugs or logic errors are present in code, and suggest fixes.",
          })
        end,
        desc = "Fix Bugs",
        mode = { "n", "v" },
      },

      {
        "<leader>aao",
        function()
          require("avante.config").override({ provider = "copilot", providers = { copilot = { model = "gpt-4o" } } })
          require("avante.api").ask({ question = "Optimize this code for performance and readability." })
        end,
        desc = "Optimize Code",
        mode = { "n", "v" },
      },

      {
        "<leader>aat",
        function()
          require("avante.config").override({
            provider = "copilot",
            providers = { copilot = { model = "claude-3.5-sonnet" } },
          })
          require("avante.api").ask({ question = "Write comprehensive unit tests for this code." })
        end,
        desc = "Generate Tests",
        mode = { "n", "v" },
      },
    },

    opts = {
      provider = "copilot",
      behaviour = {
        auto_suggestions = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
      },
      providers = {
        copilot = {
          model = "claude-sonnet-4.5",
        },
      },
    },
  },
}
