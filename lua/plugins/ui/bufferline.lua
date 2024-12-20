return {
	"akinsho/bufferline.nvim",
	enabled = true,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- version = "*",
	opts = {
		options = {
			themable = true,
			diagnostics = "nvim_lsp",
			separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
			tab_size = 16,
			show_tab_indicators = true,
			close_command = "Bdelete! %d", -- can be a string | function, | false see "Mouse actions"
			enforce_regular_tabs = false,
			always_show_bufferline = false,
			auto_toggle_bufferline = true,
			view = "multiview",
			offsets = {
				{
					filetype = "neo-tree",
					text = " ",
					padding = 0,
				},
			},
			hover = {
				enabled = true,
				delay = 0,
				reveal = { "close" },
			},
		},
	},
	event = "VeryLazy",
}
