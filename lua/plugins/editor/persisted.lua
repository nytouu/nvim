return {
	"olimorris/persisted.nvim",
	lazy = false,
	config = function()
		require("persisted").setup({
			ignored_dirs = {
				"~/.config",
				"~/.local/nvim",
				{ "/", exact = true },
				{ "/tmp", exact = true },
			},
		})
	end,
	keys = {
		{ "<leader>fs", "<cmd>Telescope persisted<cr>", desc = "Open recent session" },
	},
}
