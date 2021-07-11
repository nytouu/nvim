if require("plug.lsp").check_lsp_client_active "jsonls" then
  return
end

require("lspconfig").jsonls.setup {
	cmd = {
		"node", DATA_PATH .. "/lspinstall/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js",
		"--stdio",
	},

	commands = {
		Format = {
			function()
				vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
			end
		}
	},
	on_attach = function(client, bufnr)
		require "lsp_signature".on_attach(SIGNATURECFG)
	end
}
