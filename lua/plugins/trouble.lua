return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"artemave/workspace-diagnostics.nvim",
	},
	keys = {
		{ "<leader>tr", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
	},
	config = function()
		require("workspace-diagnostics").setup({
			workspace_files = function()
				return {
					"index.js",
					"lib/banana.js",
					"Cargo.toml",
					"project.godot",
					"*.sln"
				}
			end,
		})
	end,
}
