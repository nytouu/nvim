return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = true,
	keys = {
		{ "<leader>gj", "<cmd>Gitsigns next_hunk<cr>", desc = "Next hunk" },
		{ "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>", desc = "Previous hunk" },
		{ "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
		{ "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset hunk" },
	},
}
