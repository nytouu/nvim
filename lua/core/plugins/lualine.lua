return {
	"nvim-lualine/lualine.nvim",
    event = "BufWinEnter",
    enabled = false,
    opts = {
    	options = {
    		theme = "gruvbox-baby",
    		section_separators = '',
    		component_separators = '',
            disabled_filetypes = {
                statusline = {
                    -- "toggleterm", 
                    "neo-tree"
                },
                winbar = { "toggleterm" },
            },
    	}
    }
}
