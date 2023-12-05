return {
	"akinsho/bufferline.nvim",
    enabled = true,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
    -- config = function ()
        -- local keymap = vim.keymap
        -- keymap.set("n", "<S-j>", "<cmd>BufferLineCycleNext<cr>")
        -- keymap.set("n", "<S-k>", "<cmd>BufferLineCyclePrev<cr>")
    -- end, 
    keys = {
		{ "<S-k>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
		{ "<S-j>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    },
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			-- mode = "tabs",
			separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
            tab_size = 26,
            show_tab_indicators = true,
            enforce_regular_tabs = false,
            view = "multiview",
            offsets = {
                {
                    filetype = "neo-tree",
                    text = " ",
                    padding = 0,
                },
            },
            hover = {
                enabled = true,
                delay = 0,
                reveal = { 'close' }
            },
		},
	},
    event = "VeryLazy"
}
