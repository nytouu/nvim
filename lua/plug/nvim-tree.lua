vim.g.nvim_tree_disable_netrw = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_indent_markers = 0
vim.g.nvim_tree_width = 26
vim.g.nvim_tree_follow = 0
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_close = 1 -- TODO why wont this work
-- local tree_cb = require'nvim-tree.config'.nvim_tree_callback
-- vim.g.nvim_tree_bindings = {
--     -- default mappings
--     ["<CR>"]           = tree_cb("edit"),
--     ["l"]              = tree_cb("edit"),
--     ["<2-LeftMouse>"]  = tree_cb("edit"),
--     ["<2-RightMouse>"] = tree_cb("cd"),
--     ["C"]          	 = tree_cb("cd"),
--     ["<C-v>"]          = tree_cb("vsplit"),
--     ["<C-x>"]          = tree_cb("split"),
--     ["<C-t>"]          = tree_cb("tabnew"),
--     ["<BS>"]           = tree_cb("close_node"),
--     ["<Tab>"]          = tree_cb("preview"),
--     ["I"]              = tree_cb("toggle_ignored"),
--     ["H"]              = tree_cb("toggle_dotfiles"),
--     ["R"]              = tree_cb("refresh"),
--     ["a"]              = tree_cb("create"),
--     ["d"]              = tree_cb("remove"),
--     ["r"]              = tree_cb("rename"),
--     ["<C-r>"]          = tree_cb("full_rename"),
--     ["x"]              = tree_cb("cut"),
--     ["y"]              = tree_cb("copy"),
--     ["p"]              = tree_cb("paste"),
--     ["u"]              = tree_cb("dir_up"),
--     ["q"]              = tree_cb("close"),
-- }

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
