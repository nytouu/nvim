if require("plug.lsp").check_lsp_client_active "gopls" then
  return
end

require("lspconfig").gopls.setup {
	cmd = {DATA_PATH .. "/lspinstall/go/gopls"},
	on_attach = function(client, bufnr)
		require "lsp_signature".on_attach(SIGNATURECFG)
	end
}
