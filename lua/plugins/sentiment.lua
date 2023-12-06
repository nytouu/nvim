return {
	{
		"utilyre/sentiment.nvim",
		enabled = true,
		version = "*",
		config = function()
			require("sentiment").setup({
				delay = 0,
			})
		end,
		event = "VeryLazy",
	},
}
