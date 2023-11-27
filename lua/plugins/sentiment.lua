return {
	{
		"utilyre/sentiment.nvim",
		enabled = false,
		version = "*",
		config = function()
			require("sentiment").setup()
		end,
		event = "VeryLazy",
	},
}
