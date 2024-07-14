return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-frecency.nvim",
		},
		config = function()
			local telescope = require("telescope")
			telescope.load_extension("frecency")

      local actions = require("telescope.actions")
			telescope.setup({
				defaults = {
          mappings = {
            ["i"] = {
              ["<C-c>"] = false,
              ["<ESC>"] = actions.close,
            }
          }
        },
			})

			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})
			vim.keymap.set(
				"n",
				"<leader>fr",
				':Telescope frecency workspace=CWD path_display={"shorten"} theme=ivy<CR>'
			)
		end,
	},
}
