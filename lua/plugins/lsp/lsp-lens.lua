return {
	"VidocqH/lsp-lens.nvim",
	enabled = true,
	config = function ()
		require("lsp-lens").setup()
	end,
	event = "LspAttach"
}
