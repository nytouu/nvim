return {
	{
        "savq/melange-nvim",
        priority = 1000,
        enabled = true,
        config = function()
			local hi = vim.api.nvim_set_hl

			hi(0, "NeoTreeWinSeparator", {fg = "#34302c", bg = "#34302c"})
			hi(0, "NeoTreeStatusLine", {fg = "#34302c", bg = "#34302c"})
			hi(0, "NeoTreeStatusLineNC", {fg = "#34302c", bg = "#34302c"})
			hi(0, "StatusLine", {fg = "#34302c", bg = "#34302c"})
			hi(0, "StatusLineNC", {fg = "#34302c", bg = "#34302c"})
			hi(0, "NonText", {fg = "#403a36"})

			-- hi(0, "DiagnosticSignHint", {fg = "#7f90b1", bg = "#7f90b1"})
			vim.cmd[[colorscheme melange]]
		end,
	},
}
