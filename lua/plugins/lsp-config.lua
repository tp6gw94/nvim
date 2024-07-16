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
				ensure_installed = { "lua_ls", "dockerls", "graphql", "jsonls", "tsserver", "efm" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.tsserver.setup({
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

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
		end,
	},
	{
		"creativenull/efmls-configs-nvim",
		tag = "v1.7.0", -- tag is optional, but recommended
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			local eslint = require("efmls-configs.linters.eslint")
			local prettier = require("efmls-configs.formatters.prettier")
			local stylua = require("efmls-configs.formatters.stylua")
			local stylelint = require("efmls-configs.linters.stylelint")
			local codespell = require("efmls-configs.linters.codespell")

			local languages = {
				typescript = { eslint, prettier, stylelint, codespell },
				javascript = { eslint, prettier, stylelint, codespell },
				typescriptreact = { eslint, prettier, stylelint, codespell },
				javascriptreact = { eslint, prettier, stylelint, codespell },
				css = { stylelint },
				lua = { stylua },
			}

			local efmls_config = {
				filetypes = vim.tbl_keys(languages),
				settings = {
					languages = languages,
				},
				init_options = {
					documentFormatting = true,
					documentRangeFormatting = true,
				},
			}

			require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, {
				-- on_attach = function(client, bufnr) end,
				-- capabilities = function() end,
			}))

			local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
			vim.api.nvim_create_autocmd("BufWritePost", {
				group = lsp_fmt_group,
				callback = function(ev)
					local efm = vim.lsp.get_active_clients({ name = "efm", bufnr = ev.buf })

					if vim.tbl_isempty(efm) then
						return
					end

					vim.lsp.buf.format({ name = "efm" })
				end,
			})
		end,
	},
}
