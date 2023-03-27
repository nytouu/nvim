require("colorizer").setup({
	filetypes = { "*" },
	user_default_options = {
		RGB = false,
		RRGGBB = true,
		RRGGBBAA = true,
		rgb_fn = true,
		hsl_fn = false,
		css = false,
		css_fn = false,
		names = false,
		mode = "background",
	},
})

vim.cmd("autocmd BufEnter * :ColorizerAttachToBuffer")
