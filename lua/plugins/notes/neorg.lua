return {
	"nvim-neorg/neorg",
	dependencies = {
		"vhyrro/luarocks.nvim",
		"lukas-reineke/headlines.nvim",
		"nvim-neorg/neorg-telescope",
		"nfrid/due.nvim",
	},
	version = "*",
	enabled = true,
	ft = "norg",
	config = function()
		require("neorg").setup({
			load = {
				-- Loads default behaviour
				["core.defaults"] = {},

				["core.keybinds"] = {},
				["core.summary"] = {},
				["core.tangle"] = {},
				["core.export"] = {},
				["core.presenter"] = {
					config = {
						zen_mode = "zen-mode",
					},
				},
				["core.concealer"] = {
					config = {
						icon_preset = "diamond",
					},
				},
				["core.ui.calendar"] = {},
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				},
				["core.integrations.nvim-cmp"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							general = "~/notes/general",
							airavata = "~/notes/airavata",
							classes = "~/notes/classes",
						},
					},
				},
				["core.integrations.telescope"] = {},
			},
		})
		require("due_nvim").setup({
			ft = "*.norg",
		})
	end,
	keys = {
		{ "<leader>nn", "<cmd>Neorg<cr>", desc = "Open Neorg" },
		{ "<leader>nj", "<cmd>Neorg journal today<cr>", desc = "Open today's note" },
		{ "<leader>ni", "<cmd>Neorg index<cr>", desc = "Open index" },
		{ "<leader>nu", "<cmd>Neorg journal toc update<cr>", desc = "Update index" },
		{ "<leader>nm", "<cmd>Neorg inject-metadata<cr>", desc = "Inject metadata" },
		{ "<leader>nc", "<cmd>Neorg toggle-concealer<cr>", desc = "Toggle concealer" },
	},
}
