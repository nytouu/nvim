return {
	"folke/zen-mode.nvim",
	enabled = true,
	config = function()
		require("zen-mode").setup({
			window = {
				backdrop = 0,
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
				},
			},
		})

		local hi = vim.api.nvim_set_hl
		hi(0, "ZenBg", { link = "Normal" })

		vim.keymap.set("n", "<leader>tz", "<cmd>ZenMode<cr>", { desc = "Toggle Zen mode" })
	end,
}
