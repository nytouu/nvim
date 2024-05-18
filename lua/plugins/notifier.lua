return {
	"vigoux/notifier.nvim",
	event = "VeryLazy",
	enabled = true,
	opts = {
		ignore_messages = {},
		status_width = 100,
		components = {
			"nvim",
			"lsp",
		},
		notify = {
			clear_time = 5000,
			min_level = vim.log.levels.INFO,
		},
		component_name_recall = false,
		zindex = 50,
	},
}
