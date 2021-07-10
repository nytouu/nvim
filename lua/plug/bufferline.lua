require('bufferline').setup{
	options = {
		buffer_close_icon = "",
        indicator_icon = '▎',
        modified_icon = "●",
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
        separator_style = "thin",
        offsets = {
            {
                filetype = "NvimTree",
                text = " ",
                padding = 1
            }
        }
    },
    highlights = {
        fill = {
            guifg = "#414868",
            guibg = "#1f2335"
            -- guibg = "NONE"
        }
    }
}
