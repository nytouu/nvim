return {
	"hedyhli/outline.nvim",
	enabled = false,
	dependencies = {
		"onsails/lspkind.nvim",
	},
	keys = {
		{ "<leader>to", "<cmd>Outline<cr>", desc = "Toggle outline" },
	},
	opts = {
		outline_window = {
			width = 20,
			winhl = "Normal:NormalFloat,WinSeparator:NormalFloat",
			-- hide_cursor = false,
			-- show_cursorline = true,
		},
		outline_items = {
			show_symbol_details = true,
		},
		symbol_folding = {
			autofold_depth = 5,
		},
		guides = {
			-- enabled = false,
			-- Keep only guides that indicate siblings that might span multiple lines (vertical)
			markers = {
				middle = " ",
				bottom = " ",
			},
		},
		symbols = {
			icon_source = "lspkind",
		},
	},
}
