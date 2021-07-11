if require("plug.lsp").check_lsp_client_active "vimls" then
  return
end

require("lspconfig").vimls.setup {
	cmd = {DATA_PATH .. "/lspinstall/vim/node_modules/.bin/vim-language-server", "--stdio"},
	on_attach = function(client, bufnr)
		require "lsp_signature".on_attach(SIGNATURECFG)
	end
}
