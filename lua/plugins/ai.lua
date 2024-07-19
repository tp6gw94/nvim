return {
  {
    "github/copilot.vim",
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "github/copilot.vim",
      "nvim-lua/plenary.nvim",
    },
    opts = {},
    keys = {
      {
        "<leader>ccq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        mode = { "n", 'x' },
        desc = "CopilotChat Quick Chat",
      },
      {
        "<leader>cch",
        function()
          local actions = require("CopilotChat.actions")
          actions.pick(actions.help_actions())
        end,
        mode = { "n", 'x' },
        desc = "CopilotChat - Help actions",
      },
      {
        "<leader>ccp",
        function()
          local actions = require("CopilotChat.actions")
          actions.pick(actions.prompt_actions({
            selection = require("CopilotChat.select").visual,
          }))
        end,
        mode = { "n", 'x' },
        desc = "CopilotChat - Prompt actions",
      },
    },
  },
}
