return {
	"stevearc/dressing.nvim",
	enabled = false,
	event = "VeryLazy",
	opts = {
		input = { default_prompt = "➤ " },
		select = { backend = { "telescope", "builtin" } },
	},
}
