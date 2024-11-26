return {
	"olimorris/persisted.nvim",
	lazy = false,
	opts = {
		ignored_dirs = {
			"~/.local/nvim",
			{ "/",    exact = true },
			{ "/tmp", exact = true },
		},
	},
	keys = {
		{ "<leader>fs", "<cmd>Telescope persisted<cr>", desc = "Open recent session" },
	},
}
