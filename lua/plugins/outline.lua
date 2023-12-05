return {
    {
        "hedyhli/outline.nvim",
        enabled = true,
        keys = {
            { "<leader>to", "<cmd>Outline<cr>", desc = "Toggle outline" },
        },
		opts = {
			outline_window = {
				width = 25,
			},
			symbol_folding = {
				autofold_depth = 5,
			},
			guides = {
				enabled = true,
			},
		}
    },
    {
        "simrat39/symbols-outline.nvim",
        enabled = false,
        keys = {
            { "<leader>to", "<cmd>SymbolsOutline<cr>", desc = "Toggle outline" },
        },
        config = function ()
            require("symbols-outline").setup()
        end
    }
}
