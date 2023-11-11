return {
	"lukas-reineke/indent-blankline.nvim",
	event = "BufRead",
	main = "ibl",
	config = function ()
		local hooks = require "ibl.hooks"
		hooks.register(
			hooks.type.WHITESPACE,
			hooks.builtin.hide_first_space_indent_level
		)
        hooks.register(
            hooks.type.WHITESPACE,
            hooks.builtin.hide_first_tab_indent_level
        )
        require("ibl").setup({
            indent = {
                char = "▏",
                smart_indent_cap = true,
            },
            scope = {
                enabled = false,
                show_start = false,
                show_end = false,
            },
            exclude = {
                filetypes = {
                    "help",
                    "norg",
                    "packer",
                    "lspinfo",
                    "startup",
                    "NvimTree",
                    "neo-tree",
                    "dashboard",
                    "Trouble"
                },
                buftypes = {
                    "terminal",
                    "nofile",
                }
            }
        })
	end
}
