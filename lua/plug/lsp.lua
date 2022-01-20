local lsp_installer = require("nvim-lsp-installer")

local function on_attach(client, bufnr)
  -- Set up buffer-local keymaps (vim.api.nvim_buf_set_keymap()), etc.
    require "lsp_signature".on_attach({
        bind = true,

        doc_lines = 5,

        hint_enable = true,
        hint_prefix = "> ",
        hint_scheme = "String",
        use_lspsaga = true,
        handler_opts = {
            border = "single"
        },
        decorator = {"`", "`"}
        })
end

local function setup_handlers()
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = true

    })
end

local enhance_server_opts = {
    -- Provide settings that should only apply to the "eslintls" server
    ["bashls"] = function(opts)
        opts.settings = {
            config = {
                -- FIXME figure out why this one doesnt work but line 87 does
                filetypes = { "sh", "zsh" }
            }
        }
    end,
    ["clangd"] = function(opts)
        opts.settings = {
            -- TODO add stuff here
        }
    end,
    ["sumneko_lua"] = function(opts)
        opts.settings = {
                Lua = {
                    runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                    -- Setup your lua path
                    path = vim.split(package.path, ';')
                    },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim'}
                    },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true},
                    maxPreload = 10000
                }
            },
        }
    end,
    ["pyright"] = function(opts)
        opts.settings = {
                python = {
                analysis = {
                    typeCheckingMode = 'off',
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true
                    }
            },
        }
    end,
    -- TODO add other servers
}

setup_handlers()

lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = on_attach,
    }

    if server.name == "bashls" then
        opts.filetypes = {"sh", "zsh"}
    end
    if enhance_server_opts[server.name] then
        enhance_server_opts[server.name](opts)
    end

    server:setup(opts)
end)

vim.fn.sign_define(
    "LspDiagnosticsSignError",
    {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignWarning",
    {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignHint",
    {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignInformation",
    {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"}
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "single",
})
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false
    }
)

vim.lsp.protocol.CompletionItemKind = {
    "   (Text) ",
    "   (Method)",
    "   (Function)",
    "   (Constructor)",
    "   (Field)",
    "[] (Variable)",
    "   (Class)",
    " ﰮ  (Interface)",
    "   (Module)",
    "   (Property)",
    "   (Unit)",
    "   (Value)",
    "   (Enum)",
    "   (Keyword)",
    "   (Snippet)",
    "   (Color)",
    "   (File)",
    "   (Reference)",
    "   (Folder)",
    "   (EnumMember)",
    "   (Constant)",
    " ﳤ  (Struct)",
    "   (Event)",
    "   (Operator)",
    "   (TypeParameter)"
}
