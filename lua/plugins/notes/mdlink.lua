return {
	"Nedra1998/nvim-mdlink",
	enabled = false,
	ft = "markdown",
	config = function()
		require("nvim-mdlink").setup({
			keymap = true,
			cmp = true,
		})

		local has_mdlink, mdlink = pcall(require, "nvim-mdlink.cmp")
		if has_mdlink then
			require("cmp").register_source("mdlink", mdlink.new())
		end
	end,
}
