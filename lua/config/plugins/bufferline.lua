require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
		buffer_close_icon = "",
		-- indicator_icon = '▎',
		modified_icon = "●",
		color_icons = true,
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 14,
		max_prefix_length = 13,
		tab_size = 20,
		show_tab_indicators = true,
		enforce_regular_tabs = false,
		view = "multiview",
		show_buffer_close_icons = true,
		show_close_icon = false,
        separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
        -- indicator = {
			-- icon = " ",
			-- style = 'icon',
			-- style = "underline",
        -- },
		offsets = {
			{
				filetype = "NvimTree",
				text = " ",
				padding = 0,
			},
		},
	},
})
