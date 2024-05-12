return {
	"atusy/treemonkey.nvim",
	init = function()
		vim.keymap.set({ "x", "o" }, "m", function()
			require("treemonkey").select({
				highlight = {
					backdrop = "Comment",
					label = "Function",
				},
				ignore_injections = false,
			})
		end)
	end,
}
