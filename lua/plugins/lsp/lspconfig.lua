return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		-- "kosayoda/nvim-lightbulb",
		-- "hinell/lsp-timeout.nvim",
		"hrsh7th/cmp-nvim-lsp",
		-- "Hoffs/omnisharp-extended-lsp.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
		"williamboman/mason.nvim",
		"aznhe21/actions-preview.nvim",
		"MunifTanjim/nui.nvim",
		"Decodetalkers/csharpls-extended-lsp.nvim",
	},
	keys = {
		{ "<leader>m", "<cmd>Mason<cr>", desc = "Open Mason" },
		{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Show server info" },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import mason
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			if client.server_capabilities.inlayHintProvider then
				vim.lsp.inlay_hint.enable(true)

				opts.desc = "Toggle inlay hints"

				keymap.set("n", "<leader>th", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
				end, opts)
			end

			local status, workspace_diagnostics = pcall(require, "workspace-diagnostics")
			if status then
				workspace_diagnostics.populate_workspace_diagnostics(client, bufnr)
			end

			-- set keybinds
			opts.desc = "Format files"
			keymap.set("n", "<leader>uf", function()
				vim.lsp.buf.format({
					filter = function(client)
						return client.name ~= "clangd"
					end,
				})
			end, opts) -- show definition, references

			opts.desc = "Show LSP references"
			keymap.set("n", "<leader>lR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			keymap.set("n", "<leader>ld", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			keymap.set("n", "<leader>lI", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>la", require("actions-preview").code_actions, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Rename symbol"
			keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show signature"
			keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, opts) -- show function signature

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "<leader>lk", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "<leader>lj", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "<leader>lh", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			-- opts.desc = "Restart LSP"
			-- keymap.set("n", "<leader>lR", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		end

		-- require("nvim-lightbulb").setup({
		-- 	priority = 100,
		-- 	autocmd = { enabled = true },
		-- 	sign = {
		-- 		enabled = true,
		-- 		text = "",
		-- 		hl = "DiagnosticSignInfo",
		-- 	},
		-- 	number = {
		-- 		enabled = true,
		-- 		hl = "DiagnosticSignInfo",
		-- 	},
		-- })

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		vim.diagnostic.config({
			virtual_text = false,
			signs = {
				{ text = { [vim.diagnostic.severity.ERROR] = "" } },
				{ text = { [vim.diagnostic.severity.WARN] = "" } },
				{ text = { [vim.diagnostic.severity.HINT] = "" } },
				{ text = { [vim.diagnostic.severity.INFO] = "" } },
			},
			underline = true,
			update_in_insert = true,
			severity_sort = true,
		})

		lspconfig["rust_analyzer"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			config = {
				procMacro = { enable = true },
			},
		})

		lspconfig["clangd"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			config = {
				cmd = "clangd",
			},
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			-- cmd = { "lua-language-server" },
			settings = { -- custom settings for lua
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
					diagnostics = {
						enable = true,
						globals = {
							"vim",
							"awesome",
							"client",
							"root",
						},
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
							[vim.fn.expand("/home/nytou/.config/nvim/lua")] = true,
							[vim.fn.expand("/usr/local/share/awesome/lib")] = true,
							[vim.fn.expand("/home/nytou/.config/awesome")] = true,
							-- [vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})

		-- use csharpls_extended for go to definition
		lspconfig["csharp_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			handlers = {
				["textDocument/definition"] = require("csharpls_extended").handler,
				["textDocument/typeDefinition"] = require("csharpls_extended").handler,
			},
		})

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"ts_ls",
				"lua_ls",
				-- "pyright",
				-- "clangd",
				-- "rust_analyzer",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_lspconfig.setup_handlers({
			function(server_name) -- default handler (optional)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
				})
			end,
		})
	end,
}
