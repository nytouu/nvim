return {
	"soulis-1256/hoverhints.nvim",
	enabled = false,
	event = "LspAttach",
	config = function ()
		require("hoverhints").setup({})
	end
}
