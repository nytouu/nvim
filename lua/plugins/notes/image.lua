return {
	"3rd/image.nvim",
	enabled = false,
	-- lazy = false,
	ft = { "markdown", "norg" },
	dependencies = {
		"vhyrro/luarocks.nvim",
		priority = 1001,
		-- config = true,
		opts = {
			rocks = { "magick" },
		},
		ft = "norg",
	},
	config = function()
		if not vim.g.neovide then
			require("image").setup({
				backend = "ueberzug",
				neorg = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = false,
					filetypes = { "norg" },
				},
			})
		end
	end,
}
