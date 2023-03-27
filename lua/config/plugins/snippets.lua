require("cmp-plugins").setup({
	files = { "plugins.lua" }, -- Recommended: use static filenames or partial paths
})

require("luasnip").config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
})
require("luasnip/loaders/from_vscode").load()
