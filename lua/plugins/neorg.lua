return {
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        dependencies = { "nvim-lua/plenary.nvim" },
        ft = "norg",
		cmd = { "Neorg" },
        priority = 30,
        config = function()
            require("neorg").setup {
                load = {
					-- Loads default behaviour
                    ["core.defaults"] = {},

					["core.keybinds"] = {},
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
                                notes = "~/notes",
                            },
                        },
                    },
                },
            }
        end,
		keys = {
			{ "<leader>nC", "<cmd>Neorg toggle-concealer<cr>", desc = "Toggle concealer" },
			{ "<leader>nc", "<cmd>Neorg journal custom<cr>", desc = "Open calendar view" },
			{ "<leader>nn", "<cmd>Neorg journal today<cr>", desc = "Open today's note" },
			{ "<leader>nm", "<cmd>Neorg inject-metadata<cr>", desc = "Inject metadata" },
			{ "<leader>ni", "<cmd>Neorg index<cr>", desc = "Open workspace index" },
		}
    },
	-- {
	--
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	enabled = false,
	-- }

}
