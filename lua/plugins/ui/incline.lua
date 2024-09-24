return {
	"b0o/incline.nvim",
	event = "BufReadPre",
	priority = 1200,
	config = function()
		local vscode_status = pcall(require, "vscode")
		local c = nil
        if vscode_status then
            c = require('vscode.colors').get_colors()
		end

		require("incline").setup({
			highlight = {
				groups = {
					InclineNormal = { guibg = c.vscDarkBlue or "#303270", guifg = c.vscFront or "#a9b1d6" },
					InclineNormalNC = { guibg = "none", guifg = c.vscFront or "#a9b1d6" },
				},
			},
			window = { margin = { vertical = 0, horizontal = 1 } },
			hide = { cursorline = false },
			render = function(props)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
				if vim.bo[props.buf].modified then
					filename = "[*]" .. filename
				end

				local icon, color = require("nvim-web-devicons").get_icon_color(filename)

				return { { icon, guifg = color }, { " " }, { filename } }
			end,
		})
	end,
}
