return {
	"petertriho/nvim-scrollbar",
	dependencies = {
		"kevinhwang91/nvim-hlslens"
	},
	enabled = false,
	config = function ()
		require 'hlslens'.setup()
		require("scrollbar").setup({
			show = true,
			show_in_active_only = false,
			set_highlights = true,
		})
	end,
	event = "BufEnter"
}
