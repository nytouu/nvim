return {
	{
		"folke/zen-mode.nvim",
		enabled = false,
		opts = {
			window = {
				backdrop = 1,
				width = 120,
				height = 0.98,
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
			plugins = {
				kitty = {
					enabled = true,
					font = "+4", -- font size
				},
			}
		},
		keys = {
			{ "<leader>nz", "<cmd>ZenMode<cr>", desc = "Toggle concealer" },
		}
	}
}
