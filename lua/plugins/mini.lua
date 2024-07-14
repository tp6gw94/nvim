return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		require("mini.indentscope").setup()
		require("mini.jump").setup()
		require("mini.pairs").setup()
		require("mini.surround").setup()
		require("mini.statusline").setup()
    require('mini.comment').setup()

		local hipatterns = require("mini.hipatterns")
		hipatterns.setup({
			highlighters = {
				fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
				hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
				todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
				note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

				hex_color = hipatterns.gen_highlighter.hex_color(),
			},
		})
	end,
}
