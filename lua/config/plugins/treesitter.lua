require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    ignore_install = {"haskell","swift","phpdoc","ruby"},
    highlight = {
		additional_vim_regex_highlighting = false,
        enable = true
    },
	autotag = {
		enable = true,
	},
	indent = {
		disable = {
			"gdscript"
		}
    }
}
