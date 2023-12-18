return {
	"gorbit99/codewindow.nvim",
	enabled = true,
	event = "LspAttach",
	config = function()
		local codewindow = require('codewindow')
		codewindow.setup({
			show_cursor = true,
			window_border = 'none',
			auto_enable = false,
			minimap_width = 16,
			width_multiplier = 4,
			z_index = 3,
            use_git = false,
            use_lsp = false,
			relative = 'win',
			screen_bounds = 'background'
		})

		vim.keymap.set("n", "<leader>tm", function() codewindow.toggle_minimap() end, { desc = "Toggle minimap" })
	end,
}
