return {
	"sontungexpt/stcursorword",
	enabled = true,
	event = "VeryLazy",
	config = true,
	opts = {
		max_word_length = 50,
		min_word_length = 2,
		excluded = {
			filetypes = {
				"TelescopePrompt",
			},
			buftypes = {
				"nofile",
				"terminal",
			},
			file_patterns = { -- the pattern to match with the file path
				"%.png$",
				"%.jpg$",
				"%.jpeg$",
				"%.pdf$",
				"%.zip$",
				"%.tar$",
				"%.tar%.gz$",
				"%.tar%.xz$",
				"%.tar%.bz2$",
				"%.rar$",
				"%.7z$",
				"%.mp3$",
				"%.mp4$",
			},
		},
		highlight = {
			underline = false,
			fg = nil,
			bg = "#403a36",
		},
	}
}
