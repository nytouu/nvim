return {
	{
		"akinsho/toggleterm.nvim",
		enabled = false,
		opts = {
			size = 10,
			-- open_mapping = [[<Leader>t]],
			hide_numbers = true, -- hide the number column in toggleterm buffers
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
			start_in_insert = true,
			persist_size = true,
			direction = "horizontal", --| 'horizontal' | 'window' | 'float',
			close_on_exit = false, -- close the terminal window when the process exits
			shell = vim.o.shell, -- change the default shell
		},
		cmd = "ToggleTerm",
		keys = {
			{ "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
		},
	},
}
