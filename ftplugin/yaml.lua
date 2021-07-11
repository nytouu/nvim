if require("plug.lsp").check_lsp_client_active "yamlls" then
  return
end

require("lspconfig").yamlls.setup {
	cmd = {DATA_PATH .. "/lspinstall/yaml/node_modules/.bin/yaml-language-server", "--stdio"},
	on_attach = function(client, bufnr)
		require "lsp_signature".on_attach(SIGNATURECFG)
	end
}
