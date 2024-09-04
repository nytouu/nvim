return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
		"f3fora/cmp-spell",
	},
	config = function()
		local cmp = require("cmp")

		local luasnip = require("luasnip")

		vim.keymap.set({ "i" }, "<Tab>", function()
			luasnip.expand()
		end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<Tab>", function()
			luasnip.jump(1)
		end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
			luasnip.jump(-1)
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<C-E>", function()
			if luasnip.choice_active() then
				luasnip.change_choice(1)
			end
		end, { silent = true })

		require("luasnip.loaders.from_vscode").lazy_load()

		require("luasnip").filetype_extend("typescript", { "tsdoc" })
		require("luasnip").filetype_extend("javascript", { "jsdoc" })
		require("luasnip").filetype_extend("lua", { "luadoc" })
		require("luasnip").filetype_extend("python", { "pydoc" })
		require("luasnip").filetype_extend("rust", { "rustdoc" })
		require("luasnip").filetype_extend("cs", { "csharpdoc" })
		require("luasnip").filetype_extend("c", { "cdoc" })
		require("luasnip").filetype_extend("cpp", { "cppdoc" })
		require("luasnip").filetype_extend("kotlin", { "kdoc" })
		require("luasnip").filetype_extend("sh", { "shelldoc" })

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-a>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),

			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 10 },
				{ name = "luasnip", max_item_count = 5, priority = 8 },
				{ name = "spell", priority = 2 },
				{ name = "buffer", max_item_count = 8, priority = 2 },
				{ name = "path", priority = 3 },
				{ name = "neorg" },
			}),
			sorting = {
				priority_weight = 1.0,
				comparators = {
					cmp.config.compare.kind,
					cmp.config.compare.locality,
					cmp.config.compare.recently_used,
					cmp.config.compare.score,
					cmp.config.compare.offset,
					cmp.config.compare.order,
				},
			},
			window = {
				completion = {
					col_offset = 0,
					side_padding = 1,
				},
			},
			formatting = {
				fields = { "abbr", "kind", "menu" },
				format = require("lspkind").cmp_format({
					mode = "symbol_text",
					menu = {
						buffer = "Buffer",
						nvim_lsp = "LSP",
						luasnip = "LuaSnip",
						nvim_lua = "Lua",
						latex_symbols = "Latex",
						path = "Path",
						spell = "Spell",
						neorg = "Neorg",
						mkdnflow = "Markdown",
					},
				}),
			},
			experimental = {
				ghost_text = true,
				native_menu = false,
			},
		})

		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
			matching = { disallow_symbol_nonprefix_matching = false },
		})

		vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = "NONE", fg = "#FFAB91", strikethrough = true })
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82cfff", bg = "NONE", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82cfff", bg = "NONE", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#be95ff", bg = "NONE" })

		vim.api.nvim_set_hl(0, "CmpItemKindField", { bg = "NONE", fg = "#ee5396", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemKindProperty", { bg = "NONE", fg = "#ee5396", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemKindEvent", { bg = "NONE", fg = "#ee5396", bold = true })

		vim.api.nvim_set_hl(0, "CmpItemKindText", { bg = "NONE", fg = "#42be65", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemKindEnum", { bg = "NONE", fg = "#42be65", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#42be65", bold = true })

		vim.api.nvim_set_hl(0, "CmpItemKindConstant", { bg = "NONE", fg = "#ff7eb6", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { bg = "NONE", fg = "#ff7eb6", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemKindReference", { bg = "NONE", fg = "#ff7eb6", bold = true })

		vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#be95ff", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemKindStruct", { bg = "NONE", fg = "#be95ff", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemKindClass", { bg = "NONE", fg = "#be95ff", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemKindModule", { bg = "NONE", fg = "#be95ff", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemKindOperator", { bg = "NONE", fg = "#be95ff", bold = true })

		vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#FFAB91", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemKindFile", { bg = "NONE", fg = "#FFAB91", bold = true })

		vim.api.nvim_set_hl(0, "CmpItemKindUnit", { bg = "NONE", fg = "#F9E2AF", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { bg = "NONE", fg = "#F9E2AF", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemKindFolder", { bg = "NONE", fg = "#F9E2AF", bold = true })

		vim.api.nvim_set_hl(0, "CmpItemKindMethod", { bg = "NONE", fg = "#82CFFF", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemKindValue", { bg = "NONE", fg = "#82CFFF", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { bg = "NONE", fg = "#82CFFF", bold = true })

		vim.api.nvim_set_hl(0, "CmpItemKindInterface", { bg = "NONE", fg = "#3ddbd9", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemKindColor", { bg = "NONE", fg = "#3ddbd9", bold = true })
		vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { bg = "NONE", fg = "#3ddbd9", bold = true })
	end,
}
