require("lspconfig").gdscript.setup({
	on_attach = on_attach,
	cmd = {
		"nc",
		"localhost",
		"6005",
	},
	flags = {
		debounce_text_changes = 150,
	},
})

vim.cmd('autocmd BufEnter *.gd,*.gdscript :lua vim.api.nvim_buf_set_option(0, "commentstring", "# %s")')
