return {
    "simrat39/symbols-outline.nvim",
    keys = {
		{ "<leader>to", "<cmd>SymbolsOutline<cr>", desc = "Toggle outline" },
    },
    config = function ()
        require("symbols-outline").setup()
    end
}
