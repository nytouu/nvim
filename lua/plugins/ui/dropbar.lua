return {
	"Bekaboo/dropbar.nvim",
	enabled = false,
	event = "LspAttach",
	config = function()
		require("dropbar").setup({
			icons = {
				ui = {
					bar = {
						separator = "  ",
						extends = "…",
					},
					menu = {
						separator = " ",
						indicator = " ",
					},
				},
			},
		})

		local hi = vim.api.nvim_set_hl
		hi(0, "WinBar", { bg = "NONE" })
		hi(0, "WinBarNC", { bg = "NONE" })
	end,
}
