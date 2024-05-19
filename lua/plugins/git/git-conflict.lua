return {
	"akinsho/git-conflict.nvim",
	version = "*",
	config = function()
		require("git-conflict").setup({
			default_mappings = false,
		})

		vim.keymap.set("n", "<leader>co", "<Plug>(git-conflict-ours)", { desc = "Keep current changes" })
		vim.keymap.set("n", "<leader>ct", "<Plug>(git-conflict-theirs)", { desc = "Keep incoming changes" })
		vim.keymap.set("n", "<leader>cb", "<Plug>(git-conflict-both)", { desc = "Keep both changes" })
		vim.keymap.set("n", "<leader>cn", "<Plug>(git-conflict-none)", { desc = "Keep none" })
		vim.keymap.set("n", "<leader>cj", "<Plug>(git-conflict-next-conflict)", { desc = "Go to next conflict" })
		vim.keymap.set("n", "<leader>ck", "<Plug>(git-conflict-prev-conflict)", { desc = "Go to previous conflict" })
	end,
}
