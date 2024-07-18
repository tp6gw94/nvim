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
						},
					},
				},
			})

		end,
		keys = {
			{
				"<leader>ff",
				"<cmd>Telescope find_files<cr>",
				desc = "find files",
			},
			{
				"<leader>lg",
				"<cmd>Telescope live_grep<cr>",
				desc = "live grep",
			},
			{
				"<leader>fr",
				'<cmd>Telescope frecency workspace=CWD path_display={"shorten"} theme=ivy<cr>',
				desc = "recent",
			},
		},
	},
}
