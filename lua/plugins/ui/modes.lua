return {
	"mvllow/modes.nvim",
	event = "BufEnter",
	enabled = true,
	config = function()
		require("modes").setup({
			colors = {
				copy = "#f5c359",
				delete = "#c75c6a",
				insert = "#78ccc5",
				visual = "#9745be",
			},
			line_opacity = 0.30,
			set_cursor = true,
			set_cursorline = true,
			set_number = true,
		})
	end,
}
