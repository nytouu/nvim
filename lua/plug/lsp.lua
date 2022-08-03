local lsp_installer = require("nvim-lsp-installer")
local root_pattern = require('lspconfig.util').root_pattern
local capabilities = vim.lsp.protocol.make_client_capabilities()

local function common_on_attach(client, bufnr)
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
    ["omnisharp"] = function(opts)
    local pid = vim.fn.getpid()
    local bin = vim.fn.stdpath("data") .. "/lsp_servers/omnisharp/omnisharp/run"
        opts.settings = {
            cmd = { bin, "--languageserver", "--hostPID", tostring(pid) },
            root_dir = function(path)
              -- Make sure an sln doesn't already exist before trying to use the nearest csproj file
              return root_pattern('*.sln')(path) or root_pattern('*.csproj')(path)
            end,
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

capabilities.textDocument.CompletionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = {1} },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits"
		}
	}
}

setup_handlers()

lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = common_on_attach,
		capabilities = capabilities
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
