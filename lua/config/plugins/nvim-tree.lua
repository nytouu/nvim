local nonicons_extention = require("nvim-nonicons.extentions.nvim-tree")

require("nvim-tree").setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {},
	open_on_tab = false,
	renderer = {
		icons = {
			glyphs = nonicons_extention.glyphs,
		},
	},
	view = {
		width = 30,
		side = "left",
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
})

vim.g.nvim_tree_show_icons = {
	git = 0,
	folders = 1,
	files = 1,
	folder_arrows = 1,
}

vim.g.nvim_tree_icons = {
	default = "",
	symlink = "",
	folder = {
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
		symlink_open = "",
	},
}

vim.g.nvim_tree_window_picker_exclude = {
	filetype = { "packer", "qf" },
	buftype = { "terminal", "toggleterm", "Trouble" },
}

vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
	pattern = "NvimTree_*",
	callback = function()
		local layout = vim.api.nvim_call_function("winlayout", {})
		if
			layout[1] == "leaf"
			and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree"
			and layout[3] == nil
		then
			vim.cmd("confirm quit")
		end
	end,
})
