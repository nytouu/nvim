vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- { import = "plugins" },
	{ import = "plugins.core" },
	{ import = "plugins.editor" },
	{ import = "plugins.git" },
	{ import = "plugins.lsp" },
	{ import = "plugins.notes" },
	{ import = "plugins.ui" },
}, {
	install = {
		colorscheme = { "melange" },
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
	ui = {
		icons = {
			cmd = "[cmd]",
			config = "[cfg]",
			event = "[ev]",
			ft = "[ft]",
			init = "[init]",
			keys = "[keys]",
			plugin = "[plugin]",
			runtime = "[rt]",
			source = "[src]",
			start = "[start]",
			task = "[task]",
			lazy = "[lazy]",
		},
	},
})
