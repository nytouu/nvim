return {
	"nfrid/due.nvim",
	ft = { "norg", "mardown" },
	config = function()
		require("due_nvim").setup({
			ft = { "*.norg", "*.md" },
		})
	end,
}
