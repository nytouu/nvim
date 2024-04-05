return {
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
    },
    {
        "nvim-neorg/neorg",
        dependencies = {
            "luarocks.nvim",
			{
                "lukas-reineke/headlines.nvim",
                config = true,
                lazy = false,
                opts = {
                    norg = {
                        fat_headline_upper_string = "▃",
                        fat_headline_lower_string = "⠉",
                    },
                }
            },
			"nvim-neorg/neorg-telescope",
        },
        lazy = false,
        version = "*",
        config = function()
            require("neorg").setup({
                load = {
                    -- Loads default behaviour
                    ["core.defaults"] = {},

                    ["core.keybinds"] = {},
                    ["core.summary"] = {},
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
                                general = "~/Notes/general",
                                classes = "~/Notes/classes",
                            },
                        },
                    },
                    ["core.integrations.telescope"] = {},
                },
            })
        end,
        keys = {
            { "<leader>n", "<cmd>Neorg<cr>", desc = "Open Neorg" },
        }
    },
}
