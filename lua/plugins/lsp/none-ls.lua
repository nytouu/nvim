return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-null-ls").setup({
			ensure_installed = {
				"stylua",
				"black",
			},
			automatic_installation = true,
			handlers = {},
		})

		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- null_ls.builtins.diagnostics.gdlint,
				null_ls.builtins.formatting.gdformat,

				null_ls.builtins.diagnostics.trail_space,
				-- null_ls.builtins.completion.spell,

				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.clang_format.with({
					extra_args = { "-style", "Microsoft" },
				}),
			},
		})
	end,
}
