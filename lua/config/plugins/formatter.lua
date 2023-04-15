local util = require("formatter.util")
local tabw = vim.api.nvim_buf_get_option(0, "tabstop")

local c_args = {
	'--style="{IndentWidth: '
		.. tabw
		.. ", BreakBeforeBraces: Allman, AlwaysBreakAfterReturnType: TopLevelDefinitions, ",
	'PointerAlignment: Right, IndentCaseLabels: true}"',
	"-assume-filename",
	util.escape_path(util.get_current_buffer_file_name()),
}

---@diagnostic disable-next-line: unused-local
local js_args = {
	'--style="{IndentWidth: '
		.. tabw
		.. ', BreakBeforeBraces: Allman, AlwaysBreakAfterReturnType: TopLevelDefinitions}"',
	"-assume-filename",
	util.escape_path(util.get_current_buffer_file_name()),
}

local function clangformat_config(arg)
	return {
		exe = "clang-format",
		args = arg,
		stdin = true,
		try_node_modules = true,
	}
end

local function prettier_config()
	return {
		exe = "prettier",
		args = {
			"--use-tabs",
			"--tab-width " .. tabw,
			"--semi true",
			"--trailing-comma all",
			"--bracket-spacing true",
			"--arrow-parens always",
			"--single-attribute-per-line true",
			"--stdin-filepath",
			util.escape_path(util.get_current_buffer_file_path()),
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
			clangformat_config(c_args),
		},
		cpp = {
			require("formatter.filetypes.cpp").clangformat,
			clangformat_config(c_args),
		},
		python = {
			require("formatter.filetypes.python").black,
		},
		sh = {
			require("formatter.filetypes.sh").shfmt,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier,
			prettier_config(),
			-- require("formatter.filetypes.javascript").clangformat,
			-- clangformat_config(js_args),
		},
		typescript = {
			require("formatter.filetypes.typescript").prettier,
			prettier_config(),
			-- require("formatter.filetypes.typescript").clangformat,
			-- clangformat_config(js_args),
		},

		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
