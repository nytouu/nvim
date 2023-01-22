require('lspsaga').setup(
{
	preview = {
		lines_above = 0,
		lines_below = 10,
	},
	scroll_preview = {
		scroll_down = '<C-f>',
		scroll_up = '<C-b>',
	},
	request_timeout = 2000,
	finder = {
		edit = { 'o', '<CR>' },
		vsplit = 's',
		split = 'i',
		tabe = 't',
		quit = { 'q', '<ESC>' },
	},
	code_action = {
		num_shortcut = true,
		keys = {
			quit = 'q',
			exec = '<CR>',
		},
	},
	lightbulb = {
		enable = true,
		enable_in_insert = true,
		sign = true,
		sign_priority = 40,
		virtual_text = true,
	},
	diagnostic = {
		twice_into = false,
		show_code_action = true,
		show_source = true,
		keys = {
			exec_action = 'o',
			quit = 'q',
			go_action = 'g'
		},
	},
	rename = {
		quit = '<C-c>',
		exec = '<CR>',
		in_select = true,
	},
	symbol_in_winbar = {
		enable = true,
		separator = '  ',
		hide_keyword = true,
		show_file = true,
		folder_level = 2,
	},
	ui = {
		-- currently only round theme
		title = true,
		theme = 'round',
		-- border type can be single,double,rounded,solid,shadow.
		border = 'solid',
		winblend = 0,
		expand = '',
		collapse = '',
		preview = ' ',
		code_action = '',
		diagnostic = '🐞',
		colors = {
			--float window normal bakcground color
			normal_bg = '#0c0c0c',
			--title background color
			title_bg = '#ee5396',
			red = '#ee5396',
			magenta = '#ff7eb6',
			orange = '#FFAB91',
			yellow = '#F9E2AF',
			green = '#42be65',
			cyan = '#3ddbd9',
			blue = '#82cfff',
			purple = '#CBA6F7',
			white = '#dde1e6',
			black = '#0c0c0c',
		},
		kind = {},
	},
})

local signs = {
  Error = ' ',
  Warn = ' ',
  Info = ' ',
  Hint = ' ',
}

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	virtual_text = {
		source = false,
	},
})
