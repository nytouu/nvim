require('bufferline').setup{
	options = {
		buffer_close_icon = "",
        -- indicator_icon = '▎',
        indicator_icon = "▊",
        modified_icon = "",
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
        background = {
            guifg = "#414868",
            guibg = "#1f2335"
        },
        fill = {
            guifg = "#414868",
            guibg = "#1f2335"
            -- guibg = "NONE"
        },
        buffer_selected = {
            guifg = "#c0caf5",
            guibg = "#24283b",
            gui = "bold"
        },
        buffer_visible = {
            guifg = "#414868",
            guibg = "#1f2335"
        },
        separator_visible = {
            guifg = "#24283b",
            guibg = "#1f2335"
        },
        separator_selected = {
            guifg = "#1f2335",
            guibg = "#24283b"
        },
        separator = {
            guifg = "#414868",
            guibg = "#1f2335"
        },
        indicator_selected = {
            guifg = "#7aa2f7",
            guibg = "#24283b"
        },
        modified = {
            guifg = "#414868",
            guibg = "#1f2335"
        },
        modified_selected = {
            guifg = "#c0caf5",
            guibg = "#24283b"
        },
        modified_visible = {
            guifg = "#c0caf5",
            guibg = "#1f2335"
        }
    }
}
