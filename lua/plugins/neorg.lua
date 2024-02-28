return {
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
                "lukas-reineke/headlines.nvim",
                config = true,
                opts = {
                    norg = {
                        fat_headline_upper_string = "▃",
                        fat_headline_lower_string = "⠉",
                    },
                }
            },
			"nvim-neorg/neorg-telescope",
		},
		ft = "norg",
		cmd = { "Neorg" },
		priority = 300,
		config = function()
			require("neorg").setup {
				load = {
					-- Loads default behaviour
					["core.defaults"] = {},

					["core.keybinds"] = {},
					["core.summary"] = {},
					["core.concealer"] = {
						config = {
							icon_preset = "diamond",
						}
					},
					["core.ui.calendar"] = {},
					["core.completion"] = {
						config = {
							engine = "nvim-cmp"
						}
					},
					["core.integrations.nvim-cmp"] = {},
					["core.dirman"] = {
						config = {
							workspaces = {
								general = "~/Notes/general",
								classes = "~/Notes/classes",
							},
						},
					},
					["core.integrations.telescope"] = {},
				},
			}
		end,
		keys = {
			{ "<leader>nC", "<cmd>Neorg toggle-concealer<cr>", desc = "Toggle concealer" },
			{ "<leader>nji", "<cmd>Neorg journal toc<cr>", desc = "Journal index" },
			{ "<leader>njc", "<cmd>Neorg journal custom<cr>", desc = "Open calendar view" },
			{ "<leader>njj", "<cmd>Neorg journal today<cr>", desc = "Open today's note" },
			{ "<leader>nn", "<cmd>Neorg journal today<cr>", desc = "Open today's note" },
			{ "<leader>nm", "<cmd>Neorg inject-metadata<cr>", desc = "Inject metadata" },
			{ "<leader>ni", "<cmd>Neorg index<cr>", desc = "Open workspace index" },

			{ "<leader>ntl", "<cmd>Telescope neorg insert_link<cr>", desc = "Insert link" },
			{ "<leader>ntF", "<cmd>Telescope neorg insert_file_link<cr>", desc = "Insert file link" },
			{ "<leader>ntf", "<cmd>Telescope neorg find_linkable<cr>", desc = "Find link" },
			{ "<leader>nw",  "<cmd>Telescope neorg switch_workspace<cr>", desc = "Change workspace" },
		}
	},
}
