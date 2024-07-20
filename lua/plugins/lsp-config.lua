return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "tsserver", "jsonls", "bashls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      {
        "nvimdev/lspsaga.nvim",
        config = function()
          require("lspsaga").setup({
            lightbulb = {
              enable = false,
            },
            ui = {
              code_action = nil,
            },
            finder = {
              keys = {
                shuttle = "<cr>",
                vsplit = "\\",
                split = "-",
                table = nil,
                tabnew = nil,
              },
            },
          })
        end,
        dependencies = {
          "nvim-treesitter/nvim-treesitter",
          "nvim-tree/nvim-web-devicons",
        },
      },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.bashls.setup({
        capabilities = capabilities,
      })

      lspconfig.jsonls.setup({
        capabilities = capabilities,
      })

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {
                "vim",
                "require",
              },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        },
      })
    end,
    keys = {
      { "K",          "<cmd>Lspsaga hover_doc<cr>",   desc = "hover doc" },
      { "<leader>ca", "<cmd>Lspsaga code_action<cr>", desc = "code action" },
      { "<leader>cr", "<cmd>Lspsaga rename<cr>",      desc = "code rename" },
      { "gd",         "<cmd>Lspsaga finder<cr>",      desc = "code finder" },
    },
  },
  {
    {
      "pmizio/typescript-tools.nvim",
      dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      opts = {
        settings = {
          tsserver_file_preferences = {
            includeInlayParameterNameHints = true,
          },
        },
      },
    },
  },
  {
    "nvimdev/guard.nvim",
    dependencies = {
      "nvimdev/guard-collection",
    },
    config = function()
      local ft = require("guard.filetype")

      ft("*"):lint("codespell")
      ft("json"):fmt({
        cmd = "jq",
        args = { "." },
        stdin = true
      })
      ft("lua"):fmt("lsp"):append("stylua")
      ft("typescript,javascript,typescriptreact,javascriptreact"):fmt("prettier"):lint("eslint"):lint("stylelint")

      require("guard").setup({
        fmt_on_save = true,
        lsp_as_default_formatter = false,
      })
    end,
  },
}
