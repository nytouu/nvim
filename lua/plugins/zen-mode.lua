return {
	{
		"folke/zen-mode.nvim",
		enabled = true,
		opts = {
			window = {
				backdrop = 1,
				width = 120,
				height = 0.90,
				options = {
					signcolumn = "no", -- disable signcolumn
					number = false, -- disable number column
					relativenumber = false, -- disable relative numbers
					cursorline = false, -- disable cursorline
					cursorcolumn = false, -- disable cursor column
					foldcolumn = "0", -- disable fold column
					-- list = false, -- disable whitespace characters
				}
			},
		},
		keys = {
			{ "<leader>tz", "<cmd>ZenMode<cr>", desc = "Toggle zen mode" },
		}
	}
}
