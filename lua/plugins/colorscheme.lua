return {
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
				DiagnosticSignHint  = {fg = "#aad4e2"},
				NeoTreeStatusLine 	= {fg = "#171a1a", bg = "#171a1a"},
				NeoTreeStatusLineNC = {fg = "#171a1a", bg = "#171a1a"},
				StatusLine 			= {fg = "#e9daae", bg = "#171a1a"},
				StatusLineNC 		= {fg = "#e9daae", bg = "#171a1a"},
				-- fg = "#e9daae", bg = "#665c54"
				-- fg = "#e9daae", bg = "#665c54"
			}

			vim.cmd[[colorscheme gruvbox-baby]]
		end,
	},
	{

	}
}
