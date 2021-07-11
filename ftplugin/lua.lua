if require("plug.lsp").check_lsp_client_active "sumneko_lua" then
  return
end

require("lspconfig").sumneko_lua.setup {
	cmd = {DATA_PATH .. "/lspinstall/lua/sumneko-lua-language-server", "-E", DATA_PATH .. "/lspinstall/lua/main.lua"},
	settings = {
		Lua = {
			runtime = {
			version = 'LuaJIT',
			path = vim.split(package.path, ';')
			},
		diagnostics = {
			globals = {'vim'}
			},
		workspace = {
			library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true},
			maxPreload = 10000
			}
		}
	},
	on_attach = function(client, bufnr)
		require "lsp_signature".on_attach(SIGNATURECFG)
	end
}
