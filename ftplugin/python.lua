if require("plug.lsp").check_lsp_client_active "pyright" then
  return
end

require("lspconfig").pyright.setup {
	cmd = {DATA_PATH .. "/lspinstall/python/node_modules/.bin/pyright-langserver", "--stdio"},
	settings = {
		python = {
		analysis = {
			typeCheckingMode = 'off',
			autoSearchPaths = true,
			useLibraryCodeForTypes = true
			}
		}
	},
	on_attach = function(client, bufnr)
		require "lsp_signature".on_attach(SIGNATURECFG)
	end
}
