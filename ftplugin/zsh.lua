if require("plug.lsp").check_lsp_client_active "bashls" then
  return
end

require("lspconfig").bashls.setup {
	cmd = {DATA_PATH .. "/lspinstall/bash/node_modules/.bin/bash-language-server", "start"},
	filetypes = { "sh", "zsh" },
	on_attach = function(client, bufnr)
		require "lsp_signature".on_attach(SIGNATURECFG)
	end
}
