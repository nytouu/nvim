return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs                   = {
			untracked = { text = '┃' },
		},
		signs_staged            = {
			untracked = { text = '┃' },
		},
		current_line_blame_opts = {
			delay = 0,
		},
		preview_config          = {
			border = 'solid',
		},
	},
	keys = {
		{ "<leader>gj", "<cmd>Gitsigns next_hunk<cr>",                 desc = "Next hunk" },
		{ "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>",                 desc = "Previous hunk" },
		{ "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>",              desc = "Preview hunk" },
		{ "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>",                desc = "Reset hunk" },
		{ "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Show current line blame" },
	},
}
