local lspconfig = require('lspconfig')

DATA_PATH = vim.fn.stdpath('data')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local signaturecfg = {
        bind = true, -- This is mandatory, otherwise border config won't get registered.
                    -- If you want to hook lspsaga or other signature handler, pls set to false
        doc_lines = 5, -- only show one line of comment set to 0 if you do not want API comments be shown

        hint_enable = true, -- virtual hint enable
        hint_prefix = "🐼 ",  -- Panda for parameter
        hint_scheme = "String",
        use_lspsaga = true,  -- set to true if you want to use lspsaga popup
        handler_opts = {
			border = "double"   -- double, single, shadow, none
        },
        decorator = {"`", "`"}  -- or decorator = {"***", "***"}  decorator = {"**", "**"} see markdown signatureHelp
    }

local servers = {
	{
        name = 'vimls',
        config = {
            cmd = {DATA_PATH .. "/lspinstall/vim/node_modules/.bin/vim-language-server", "--stdio"},
            on_attach = function(client, bufnr)
                require "lsp_signature".on_attach(signaturecfg)  -- Note: add in lsp client on-attach
				require'aerial'.on_attach(client)
            end
        }
    },
    {
        name = 'gopls',
        config = {
            cmd = {DATA_PATH .. "/lspinstall/go/gopls"},
            on_attach = function(client, bufnr)
                require "lsp_signature".on_attach(signaturecfg)  -- Note: add in lsp client on-attach
				require'aerial'.on_attach(client)
            end
        }
    },
	{
        name = 'rls',
        config = {
            cmd = {DATA_PATH .. "/lspinstall/rust/rust-analyzer"},
            on_attach = function(client, bufnr)
                require "lsp_signature".on_attach(signaturecfg)  -- Note: add in lsp client on-attach
				require'aerial'.on_attach(client)
            end
        }
    },
	{
        name = 'yamlls',
        config = {
            cmd = {DATA_PATH .. "/lspinstall/yaml/node_modules/.bin/yaml-language-server", "--stdio"},
            on_attach = function(client, bufnr)
                require "lsp_signature".on_attach(signaturecfg)  -- Note: add in lsp client on-attach
				require'aerial'.on_attach(client)
            end
        }
    },
	{
        name = 'bashls',
        config = {
            cmd = {DATA_PATH .. "/lspinstall/bash/node_modules/.bin/bash-language-server", "start"},
            filetypes = { "sh", "zsh" },
            on_attach = function(client, bufnr)
                require "lsp_signature".on_attach(signaturecfg)  -- Note: add in lsp client on-attach
				require'aerial'.on_attach(client)
            end
        }
    },
	{
        name = 'html',
        config = {
            -- capabilities.textDocument.completion.completionItem.snippetSupport = true
            cmd = {"node", DATA_PATH .. "/lspinstall/html/vscode-html/html-language-features/server/dist/node/htmlServerMain.js", "--stdio"},
            capabilities = capabilities,
            on_attach = function(client, bufnr)
                require "lsp_signature".on_attach(signaturecfg)  -- Note: add in lsp client on-attach
				require'aerial'.on_attach(client)
            end
        }
    },
	{
        name = 'jsonls',
        config = {
            cmd = {
                "node", DATA_PATH .. "/lspinstall/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js",
                "--stdio",
            },

            commands = {
                Format = {
                    function()
                        vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
                    end
                }
            },
            on_attach = function(client, bufnr)
                require "lsp_signature".on_attach(signaturecfg)  -- Note: add in lsp client on-attach
				require'aerial'.on_attach(client)
            end
        }
    },
	{
        name = 'clangd',
        config = {
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
                require "lsp_signature".on_attach(signaturecfg)  -- Note: add in lsp client on-attach
				require'aerial'.on_attach(client)
            end
        }
    },
	{
		name = 'sumneko_lua',
		config = {
            cmd = {DATA_PATH .. "/lspinstall/lua/sumneko-lua-language-server", "-E", DATA_PATH .. "/lspinstall/lua/main.lua"},
            settings = {
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
                }
            },
            on_attach = function(client, bufnr)
                require "lsp_signature".on_attach(signaturecfg)  -- Note: add in lsp client on-attach
				require'aerial'.on_attach(client)
            end
		}
	},
    {
        name = 'pyright',
        config = {
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
                require "lsp_signature".on_attach(signaturecfg)  -- Note: add in lsp client on-attach
				require'aerial'.on_attach(client)
            end
        }
    }
}

for _, server in ipairs(servers) do
	local config = server.config or {}
	lspconfig[server.name].setup(config)
end
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

DATA_PATH = vim.fn.stdpath('data')

-- vim.lsp.handlers["textDocument/signatureHelp"] = require'lspsaga'.signature_help
require('lsp_signature').on_attach()
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false
    }
)

-- require("vim.lsp.protocol").CompletionItemKind = {
--     " (Text)", -- Text
--     " (Method)", -- Method
--     "ƒ (Function)", -- Function
--     " (Constructor)", -- Constructor
--     "識 (Field)", -- Field
--     " (Variable)", -- Variable
--     "\u{f0e8} (Class)", -- Class
--     "ﰮ (Interface)", -- Interface
--     " (Module)", -- Module
--     " (Property)", -- Property
--     " (Unit)", -- Unit
--     " (Value)", -- Value
--     "了 (Enum)", -- Enum
--     " (Keyword)", -- Keyword
--     " (Snippet)", -- Snippet
--     " (Color)", -- Color
--     " (File)", -- File
--     "渚 (Reference)", -- Reference
--     " (Folder)", -- Folder
--     " (Enum)", -- Enum
--     " (Constant)", -- Constant
--     " (Struct)", -- Struct
--     "鬒 (Event)", -- Event
--     "\u{03a8} (Operator)", -- Operator
--     " (Type Parameter)" -- TypeParameter
-- }
