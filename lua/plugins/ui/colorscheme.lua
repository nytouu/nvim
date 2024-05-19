return {
	"nyoom-engineering/oxocarbon.nvim",
	priority = 1000,
	enabled = true,
	config = function()
		local hi = vim.api.nvim_set_hl

		hi(0, "WinSeparator", { fg = "#161616", bg = "#161616" })
		hi(0, "NeoTreeWinSeparator", { fg = "#161616", bg = "#161616" })
		hi(0, "NeoTreeStatusLine", { fg = "#0c0c0c", bg = "#0c0c0c" })
		hi(0, "NeoTreeStatusLineNC", { fg = "#0c0c0c", bg = "#0c0c0c" })
		-- hi(0, "NeoTreeExpander", {fg = "#ee5396", bg = "NONE"})
		hi(0, "StatusLine", { fg = "#0c0c0c", bg = "#0c0c0c" })
		hi(0, "StatusLineNC", { fg = "#0c0c0c", bg = "#0c0c0c" })
		hi(0, "Normal", { bg = "NONE" })
		hi(0, "MatchedParen", { bg = "#403a36" })

		vim.o.background = "dark"
		vim.cmd.colorscheme("oxocarbon")
	end,
}
