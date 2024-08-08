return {
	"Mofiqul/adwaita.nvim",
	priority = 1000,
	enabled = true,
	config = function()
		local hi = vim.api.nvim_set_hl

		hi(0, "WinSeparator", { fg = "#1d1d1d", bg = "#1d1d1d" })
		hi(0, "NeoTreeWinSeparator", { fg = "#161616", bg = "#1d1d1d" })
		hi(0, "NeoTreeStatusLine", { fg = "#161616", bg = "#161616" })
		hi(0, "NeoTreeStatusLineNC", { fg = "#161616", bg = "#161616" })
		-- hi(0, "NeoTreeExpander", {fg = "#ee5396", bg = "NONE"})
		hi(0, "StatusLine", { fg = "#161616", bg = "#161616" })
		hi(0, "StatusLineNC", { fg = "#161616", bg = "#161616" })
		-- hi(0, "Normal", { bg = "NONE" })
		hi(0, "WhichKeyBorder", { fg = "#161616", bg = "#131313" })
		hi(0, "MatchedParen", { bg = "#403a36", underline = false })

		vim.o.background = "dark"
		vim.cmd.colorscheme("adwaita")
	end,
}
