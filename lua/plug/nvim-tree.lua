require'nvim-tree'.setup {
	disable_netrw       = true,
	hijack_netrw        = true,
	open_on_setup       = false,
	ignore_ft_on_setup  = {},
	open_on_tab         = false,
	view = {
		width = 30,
		height = 30,
		side = 'left',
	},
	filters = {
		dotfiles = true,
	},
	git = {
		enable = false,
	},
	trash = {
        cmd = "trash",
        require_confirm = true,
	},
}

vim.g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 1,
    folder_arrows = 1
}

vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    folder  = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = "",
    }
}

vim.g.nvim_tree_window_picker_exclude = {
	filetype = { 'packer', 'qf' },
	buftype = { 'terminal', 'toggleterm', 'Trouble' }
}

vim.cmd[[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]
