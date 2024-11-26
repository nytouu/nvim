return {
	"NvChad/nvim-colorizer.lua",
	event = "BufReadPre",
	keys = {
		{ "<leader>tc", "<cmd>ColorizerToggle<cr>", desc = "Toggle colorizer" },
	},
	opts = {
		user_default_options = {
			RGB = false,
			RRGGBB = true,
			RRGGBBAA = true,
			rgb_fn = true,
			hsl_fn = true,
			css = true,
			css_fn = true,
			names = false,
			-- Available modes for `mode`: foreground, background,  virtualtext
			mode = "virtualtext", -- Set the display mode.
			virtualtext = "󱓻",
			virtualtext_inline = true,
			virtualtext_mode = "foreground",
			always_update = false,
		},
		-- all the sub-options of filetypes apply to buftypes
		buftypes = {},
	},
}
