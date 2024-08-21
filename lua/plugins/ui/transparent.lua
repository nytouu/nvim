return {
	"xiyaowong/transparent.nvim",
	lazy = false,
	enabled = true,
	priority = 10000,
	config = function()
		require("transparent").setup({ -- Optional, you don't have to run setup.
			groups = { -- table: default groups
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLine",
				"CursorLineNr",
				"StatusLine",
				"StatusLineNC",
				"EndOfBuffer",
				"WhichKeyBorder",
				"NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
			},
			extra_groups = {}, -- table: additional groups that should be cleared
			exclude_groups = {
                "NeoTreeNormal", -- NeoTree
                "NeoTreeNormalNC", -- NeoTree
                "NvimTreeNormal", -- NvimTree
            }, -- table: groups you don't want to clear
		})
	end,
}
