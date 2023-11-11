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
                    -- ["core.ui.calendar"] = {},
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

			local opts = {
				mode = "n",
				prefix = "<leader>",
				buffer = nil,
				silent = true,
				noremap = true,
				nowait = true,
			}
            local mappings = {
                n = {
                    name = "Neorg",
                },
			}
			require("which-key").register(mappings, opts)
        end,
		keys = {
			{ "<leader>nc", "<cmd>Neorg toggle-concealer<cr>", desc = "Toggle concealer" },
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
