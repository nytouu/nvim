return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
        "kosayoda/nvim-lightbulb",
		"hrsh7th/cmp-nvim-lsp",
        -- "Hoffs/omnisharp-extended-lsp.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true }, 
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

            if client.server_capabilities.inlayHintProvider then
                vim.lsp.inlay_hint.enable(bufnr, false)

                opts.desc = "Toggle inlay hints"

                keymap.set("n", "<leader>th", function() vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled(bufnr)) end, opts)
            end

			-- set keybinds
			opts.desc = "Show LSP references"
			keymap.set("n", "<leader>lR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			-- opts.desc = "Go to declaration"
			-- keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			keymap.set("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			keymap.set("n", "<leader>lI", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Rename symbol"
			keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "<leader>lk", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "<leader>lj", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "<leader>lh", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Show server info"
			keymap.set("n", "<leader>li", "<cmd>LspInfo<CR>", opts) -- show lsp implementations

			-- opts.desc = "Restart LSP"
			-- keymap.set("n", "<leader>lR", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		end

		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = false,
			signs = true,
			underline = true,
			update_in_insert = false,
		})

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

        require("nvim-lightbulb").setup({
            priority = 100,
            autocmd = { enabled = true },
            sign = {
                enabled = true,
                text = "",
                hl = "DiagnosticSignInfo"
            },
            number = {
                enabled = true,
                hl = "DiagnosticSignInfo"
            }
        })

		-- configure typescript server with plugin
		lspconfig["tsserver"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure python server
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["rust_analyzer"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
            config = {
                procMacro = { enable = true },
            },
		})

		lspconfig["bashls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["nil_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["clangd"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = { "lua-language-server" },
			settings = { -- custom settings for lua
				Lua = {
					completion = {
						callSnippet = "Replace"
					},
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
                    hint = {
                        enable = true,
                        setType = true,
                        arrayIndex = "Disable",
                    },
					workspace = {
                        checkThirdParty = false,
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$HOME/.config/nvim/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		lspconfig["omnisharp"].setup({
            cmd = { "OmniSharp", "-lsp" },

            enable_roslyn_analyzers = false,
            enable_import_completion = false,
            enable_ms_build_load_projects_on_demand = false,
            analyze_open_documents_only = false,

			capabilities = capabilities,
			on_attach = function (client, bufnr)
                on_attach(client, bufnr)

                if client.name == "omnisharp" then
                    client.server_capabilities.semanticTokensProvider = {
                        full = vim.empty_dict(),
                        legend = {
                            tokenModifiers = { "static_symbol" },
                            tokenTypes = {
                                "comment",
                                "excluded_code",
                                "identifier",
                                "keyword",
                                "keyword_control",
                                "number",
                                "operator",
                                "operator_overloaded",
                                "preprocessor_keyword",
                                "string",
                                "whitespace",
                                "text",
                                "static_symbol",
                                "preprocessor_text",
                                "punctuation",
                                "string_verbatim",
                                "string_escape_character",
                                "class_name",
                                "delegate_name",
                                "enum_name",
                                "interface_name",
                                "module_name",
                                "struct_name",
                                "type_parameter_name",
                                "field_name",
                                "enum_member_name",
                                "constant_name",
                                "local_name",
                                "parameter_name",
                                "method_name",
                                "extension_method_name",
                                "property_name",
                                "event_name",
                                "namespace_name",
                                "label_name",
                                "xml_doc_comment_attribute_name",
                                "xml_doc_comment_attribute_quotes",
                                "xml_doc_comment_attribute_value",
                                "xml_doc_comment_cdata_section",
                                "xml_doc_comment_comment",
                                "xml_doc_comment_delimiter",
                                "xml_doc_comment_entity_reference",
                                "xml_doc_comment_name",
                                "xml_doc_comment_processing_instruction",
                                "xml_doc_comment_text",
                                "xml_literal_attribute_name",
                                "xml_literal_attribute_quotes",
                                "xml_literal_attribute_value",
                                "xml_literal_cdata_section",
                                "xml_literal_comment",
                                "xml_literal_delimiter",
                                "xml_literal_embedded_expression",
                                "xml_literal_entity_reference",
                                "xml_literal_name",
                                "xml_literal_processing_instruction",
                                "xml_literal_text",
                                "regex_comment",
                                "regex_character_class",
                                "regex_anchor",
                                "regex_quantifier",
                                "regex_grouping",
                                "regex_alternation",
                                "regex_text",
                                "regex_self_escaped_character",
                                "regex_other_escape",
                            },
                        },
                        range = true,
                    }
                end
            end
		})
	end,
}
