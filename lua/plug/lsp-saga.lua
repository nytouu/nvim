require'lspsaga'.init_lsp_saga (
{
	border_style = "single",
	saga_winblend = 0,
	move_in_saga = { prev = '<C-k>',next = '<C-j>'},
	diagnostic_header = { " ", " ", " ", " " },
	show_diagnostic_source = true,
	diagnostic_source_bracket = {},
	max_preview_lines = 15,
	code_action_icon = " ",
	code_action_num_shortcut = true,
	code_action_lightbulb = {
		enable = true,
		sign = true,
		sign_priority = 99,
		virtual_text = false,
	},
	finder_icons = {
	  def = '  ',
	  ref = '諭 ',
	  link = '  ',
	},
	finder_action_keys = {
		open = "o",
		vsplit = "s",
		split = "i",
		tabe = "t",
		quit = "q",
		scroll_down = "<C-f>",
		scroll_up = "<C-b>", -- quit can be a table
	},
	code_action_keys = {
		quit = "q",
		exec = "<CR>",
	},
	rename_action_quit = "<C-c>",
	definition_preview_icon = "  ",
	symbol_in_winbar = {
		in_custom = false,
		enable = false,
		separator = ' ',
		show_file = true,
		click_support = false,
	},
	show_outline = {
	  win_position = 'right',
	  left_with = '',
	  win_width = 30,
	  auto_enter = true,
	  auto_preview = true,
	  virt_text = '┃',
	  jump_key = 'o',
	  auto_refresh = true,
	}
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
