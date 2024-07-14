return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
      auto_install = true,
      sync_install = true,
			ensure_installed = { "lua", "javascript", "typescript",  },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
