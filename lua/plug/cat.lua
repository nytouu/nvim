require("catppuccin").setup({
	integrations = {
		native_lsp = {
			enabled = true,
			underlines = {
				errors = { "undercurl" },
				hints = { "underline" },
				warnings = { "undercurl" },
				information = { "underline" },
			},
		},
		lsp_trouble = true,
		cmp = true,
		lsp_saga = true,
		gitsigns = true,
		telescope = false,
		nvimtree = {
			enabled = true,
			show_root = true,
		},
		which_key = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
		dashboard = true,
		bufferline = true,
		hop = true,
	}
})
vim.g.catppuccin_flavour = "mocha"
vim.cmd[[colorscheme catppuccin]]
