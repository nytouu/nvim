return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000 ,
		enabled = false,
		config = function ()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = true,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = false,
			})
			vim.cmd("colorscheme gruvbox")
		end,
	},
	{
		"luisiacc/gruvbox-baby",
		priority = 1000 ,
		enabled = true,
		config = function ()
			vim.g.gruvbox_baby_function_style = "italic"
			vim.g.gruvbox_baby_keyword_style = "italic"
            vim.g.gruvbox_baby_background_color = "dark"
            vim.g.gruvbox_baby_telescope_theme = 1

			vim.g.gruvbox_baby_highlights = {
				NeoTreeWinSeparator = {fg = "#171a1a", bg = "#171a1a"},
				NeoTreeStatusLine 	= {fg = "#171a1a", bg = "#171a1a"},
				NeoTreeStatusLineNC = {fg = "#171a1a", bg = "#171a1a"},
			}

			vim.cmd[[colorscheme gruvbox-baby]]
		end,
	}
}
