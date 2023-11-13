-- vim.api.nvim_create_autocmd("BufRead", {
--     group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
--     pattern = "Cargo.toml",
--     callback = function()
--         require("cmp").setup.buffer({ sources = { { name = "crates" } } })
--     end,
-- })

local lsp_util = require('nvim.utils.lsp')

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = lsp_util.get_client(ev)

		if client.server_capabilities.inlayHintProvider then
			vim.lsp.buf.inlay_hint(0, true)
			vim.api.nvim_set_hl(0, 'LspInlayHint', { fg = 'red' })
		end
	end,
})
