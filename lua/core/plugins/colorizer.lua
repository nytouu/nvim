return {
	"NvChad/nvim-colorizer.lua",
	-- ft = { "html", "css", "sass", "typescript", "javascript", "conf", "sh", "bash", "zsh", "lua" },
	keys = {
		{ "<leader>tc", "<cmd>ColorizerToggle<cr>", desc = "Toggle colorizer" },
	},
	opts = {
		user_default_options = {
			RGB = false,
			RRGGBB = true,
			RRGGBBAA = true,
			rgb_fn = true,
			hsl_fn = false,
			css = false,
			css_fn = false,
			names = false,
			-- Available modes for `mode`: foreground, background,  virtualtext
			mode = "background", -- Set the display mode.
			virtualtext = "■",
			always_update = false,
		},
		-- all the sub-options of filetypes apply to buftypes
		buftypes = {},
	},
}
