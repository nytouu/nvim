return {
	"nvim-treesitter/nvim-treesitter-context",
	enabled = true,
	keys = {
		{ "<leader>tC", "<cmd>TSContextToggle<cr>", desc = "Toggle treesitter context" },
	},
	event = { "BufEnter" },
	opts = {
		enable = true,
		max_lines = 1,
		min_window_height = 0,
		line_numbers = false,
		multiline_threshold = 20,
		trim_scope = "outer",
		mode = "cursor",
		-- Separator between context and content. Should be a single character string, like '-'.
		-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
		separator = nil,
		zindex = 20,
		on_attach = nil,
	},
}
