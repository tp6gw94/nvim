return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			window = {
				mapping_options = {
					noremap = true,
					nowait = true,
				},
				mappings = {
					["-"] = "open_split",
					["\\"] = "open_vsplit",
					["o"] = "open",
					["t"] = false,
				},
			},
			filesystem = {
				filtered_items = {
					always_show_by_pattern = {
						".env*",
					},
					never_show = {
						".DS_store",
						"thumbs.db",
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>e", ":Neotree reveal float<CR>")
	end,
}
