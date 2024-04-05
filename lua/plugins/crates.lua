return {
	"Saecki/crates.nvim",
	-- tag = 'stable',
	dependencies = { "nvim-lua/plenary.nvim" },
	enabled = true,
	event = { "BufRead Cargo.toml" },
	-- opts = {
	-- 	src = {
	-- 		cmp = {
	-- 			enabled = true,
	-- 		}
	-- 	}
	-- }
	config = function()
		require("crates").setup({
			null_ls = {
				enabled = true,
				name = "crates.nvim",
			},
		})

		vim.api.nvim_create_autocmd("BufRead", {
			group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
			pattern = "Cargo.toml",
			callback = function()
				require("cmp").setup.buffer({ sources = { { name = "crates" } } })
			end,
		})
	end,
}
