return {
	{
		"utilyre/sentiment.nvim",
		enabled = true,
		version = "*",
		config = function()
			require("sentiment").setup()
		end,
		event = "VeryLazy",
	},
}
