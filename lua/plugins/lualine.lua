return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	enabled = false,
	event = "BufWinEnter",
	config = function()
		require("lualine").setup({
			options = {
				theme = "gruvbox",
				section_separators = "",
				component_separators = "",
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "filename" },
					lualine_c = { "diff", "diagnostics" },
					lualine_x = { "branch", "fileformat", "filetype" },
					lualine_y = { "location" },
					lualine_z = { "progress" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
			},
		})
	end,
}
