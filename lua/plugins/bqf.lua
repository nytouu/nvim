return {
	{
		"kevinhwang91/nvim-bqf",
		enabled = false,
		ft = "qf",
		config = function()
			require("bqf").setup({
				preview = {
					winblend = 0,
					-- border = "none",
					border = { "━", "━", "━", " ", "━", "━", "━", " " },
					show_title = true,
				},
			})
			vim.api.nvim_set_hl(0, "BqfPreviewBorder", { link = "Comment" })
		end,
	},
	{
		"yorickpeterse/nvim-pqf",
		enabled = false,
		config = function()
			require("pqf").setup()
		end,
	},
}
