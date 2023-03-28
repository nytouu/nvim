local util = require("formatter.util")
local tabw = vim.api.nvim_buf_get_option(0, "tabstop")

local function clangformat_config()
	return {
		exe = "clang-format",
		args = {
			'--style="{IndentWidth: '
				.. tabw
				.. ', BreakBeforeBraces: Allman, AlwaysBreakAfterReturnType: TopLevelDefinitions}"',
			"-assume-filename",
			util.escape_path(util.get_current_buffer_file_name()),
		},
		stdin = true,
		try_node_modules = true,
	}
end

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		c = {
			require("formatter.filetypes.c").clangformat,
			clangformat_config(),
		},
		cpp = {
			require("formatter.filetypes.cpp").clangformat,
			clangformat_config(),
		},
		python = {
			require("formatter.filetypes.python").black,
		},
		sh = {
			require("formatter.filetypes.sh").shfmt,
		},
		javascript = {
			require("formatter.filetypes.javascript").clangformat,
			clangformat_config(),
		},
		typescript = {
			require("formatter.filetypes.typescript").clangformat,
			clangformat_config(),
		},

		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
