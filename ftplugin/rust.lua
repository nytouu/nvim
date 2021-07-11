if require("plug.lsp").check_lsp_client_active "rust_analyzer" then
  return
end

require("lspconfig").rust_analyzer.setup {
	cmd = {DATA_PATH .. "/lspinstall/rust/rust-analyzer"},
	on_attach = function(client, bufnr)
		require "lsp_signature".on_attach(SIGNATURECFG)
	end
}
