return {
	"smjonas/inc-rename.nvim",
	config = function()
		require("inc_rename").setup({
			input_buffer_type = "dressing",
		})

		vim.keymap.set("n", "<leader>lr", function()
			return ":IncRename " .. vim.fn.expand("<cword>")
		end, { expr = true, desc = "Rename symbol" })
	end,
}
