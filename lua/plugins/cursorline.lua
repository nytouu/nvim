return {
	{
		"yamatsum/nvim-cursorline",
		enabled = false,
		event = "BufRead",
		opts = {
			cursorline = {
				enable = false,
			},
			cursorword = {
				enable = true,
				min_length = 3,
				hl = {
					underline = false,
					bg = "#242222"
				},
			}
		}
	}
}
