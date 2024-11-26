return {
	dir = "~/git/modes.nvim/",
	event = "BufEnter",
	enabled = true,
	opts = {
		colors = {
			copy = "#f5c359",
			delete = "#c75c6a",
			insert = "#78ccc5",
			visual = "#9745be",
		},
		line_opacity = vim.o.background == "dark" and 0.40 or 0.80,
		set_cursor = true,
		set_cursorline = false,
		set_cursorline_on_action = true,
		set_number = true,
	}
}
