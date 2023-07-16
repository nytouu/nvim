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
		telescope = true,
		nvimtree = {
			enabled = true,
			show_root = true,
		},
		which_key = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		dashboard = false,
		bufferline = true,
		hop = false,
	},
})
vim.g.catppuccin_flavour = "frappe"
vim.cmd([[colorscheme catppuccin]])
