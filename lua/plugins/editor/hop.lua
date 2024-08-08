return {
	"smoka7/hop.nvim",
	version = "*",
	config = function()
		-- place this in one of your configuration file(s)
		local hop = require("hop")
		hop.setup({ keys = "etovxqpdygfblzhckisuran" })

		vim.keymap.set("", "gh", function()
			hop.hint_words()
		end, { remap = true, desc = "Hop to word"})
	end,
}
