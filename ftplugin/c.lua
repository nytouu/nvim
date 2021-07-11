if require("plug.lsp").check_lsp_client_active "clangd" then
  return
end

require("lspconfig").clangd.setup {
    cmd = {DATA_PATH .. "/lspinstall/cpp/clangd/bin/clangd"},
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = false,
            signs = true,
            underline = true,
            update_in_insert = true
        })
    },
    on_attach = function(client, bufnr)
        require "lsp_signature".on_attach(SIGNATURECFG)
    end
}
