return {
	{
		"simrat39/rust-tools.nvim",
		enabled = false,
		config = function()
			require("rust-tools").setup({
				tools = {
					inlay_hints = {
						auto = true,
					},
				},
			})
		end,
		ft = { "rs", "rust", "toml" },
	},
}
