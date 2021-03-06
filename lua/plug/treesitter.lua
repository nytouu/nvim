require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    ignore_install = {"haskell","swift","phpdoc"},
    highlight = {
		additional_vim_regex_highlighting = true,
        enable = true
    },
	indent = {
		disable = {
			"gdscript"
		}
    }
}
