return {
	"smjonas/inc-rename.nvim",
	enabled = false;
	config = function()
		require("inc_rename").setup({
			input_buffer_type = "noice",
			hl_group = "Substitute",
		})

		vim.keymap.set("n", "<leader>lr", function()
			return ":IncRename " .. vim.fn.expand("<cword>")
		end, { expr = true, desc = "Rename symbol" })
	end,
}
