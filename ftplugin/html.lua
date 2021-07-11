if require("plug.lsp").check_lsp_client_active "html" then
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").html.setup {
	cmd = {"node", DATA_PATH .. "/lspinstall/html/vscode-html/html-language-features/server/dist/node/htmlServerMain.js", "--stdio"},
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		require "lsp_signature".on_attach(SIGNATURECFG)
	end
}
