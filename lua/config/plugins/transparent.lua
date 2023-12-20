require("transparent").setup({
	groups = { -- table: default groups
		"Normal",
		'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
		-- 'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
		-- 'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
		-- 'SignColumn', 'CursorLineNr', 'EndOfBuffer',
	},
	extra_groups = {
		-- "BufferLineTabClose",
		-- "BufferlineBufferSelected",
		-- "BufferLineFill",
		-- "BufferLineBackground",
		-- "BufferLineSeparator",
		-- "BufferLineIndicatorSelected",
		"ScrollHead",
		-- "ScrollBody",
		"ScrollTail",
		"NotifyBackground",
		"DiffAdd",
		"DiffChange",
		"DiffDelete"
	},
	exclude_groups = {
		"BufferLineTabClose",
		"BufferlineBufferSelected",
		"BufferLineFill",
		"BufferLineBackground",
		"BufferLineSeparator",
		"BufferLineIndicatorSelected",

	},
})