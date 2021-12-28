require'nvim-tree'.setup {
	disable_netrw       = true,
	hijack_netrw        = true,
	open_on_setup       = false,
	ignore_ft_on_setup  = {},
	auto_close          = true,
	open_on_tab         = false,
	update_to_buf_dir   = {
		enable = true,
		auto_open = true,
	},
	view = {
		width = 26,
		height = 30,
		side = 'left',
		auto_resize = false,
	},
	filters = {
		dotfiles = true,
	}
}

vim.g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 1,
    folder_arrows = 1
}

vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    folder  = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = "",
    }
}

vim.g.nvim_tree_window_picker_exclude = {
	filetype = { 'packer', 'qf' },
	buftype = { 'terminal', 'toggleterm', 'Trouble' }
}
