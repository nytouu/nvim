return {
	"VidocqH/lsp-lens.nvim",
	enabled = false,
	config = function ()
		require("lsp-lens").setup()
	end,
	event = "LspAttach"
}
