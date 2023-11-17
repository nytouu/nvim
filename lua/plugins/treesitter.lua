---@diagnostic disable: missing-fields
return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPre",
	config = function()
		local treesitter_config = require("nvim-treesitter.configs")

		treesitter_config.setup({
			ensure_installed = {
				"lua",
				"c",
				"cpp",
				"rust",
				"python",
			},
			sync_install = false,

			highlight = {
				enable = true,
			},
            indent = {
                enable = true,
                -- disable = {
                --     "python", 
                --     "css" 
                -- } 
            },

			-- Integration with other plugins
			autopairs = { -- require autopairs plugin
				enable = true,
			},
			autotag = { -- require autotag plugin
				enable = true,
			},
			context_commentstring = { -- require ts-comment string plugin
				enable = true,
				enable_autocmd = false,
			},
		})
	end,
}
