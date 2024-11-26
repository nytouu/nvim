return {
	-- "hrsh7th/nvim-cmp",
	-- "yioneko/nvim-cmp",
	"iguanacucumber/magazine.nvim",
	name = "nvim-cmp",
	enabled = false,
	event = { "InsertEnter", "CmdlineEnter"},
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		-- "hrsh7th/cmp-buffer",           -- source for text in buffer
		-- { 'iguanacucumber/mag-buffer', name = 'cmp-buffer' },
		"hrsh7th/cmp-path",       -- source for file system paths
		{ 'iguanacucumber/mag-cmdline', name = 'cmp-cmdline' },
		"L3MON4D3/LuaSnip",       -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim",   -- vs-code like pictograms
		{ 'iguanacucumber/mag-nvim-lsp', name = 'cmp-nvim-lsp' },
		-- "f3fora/cmp-spell",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		require("luasnip.loaders.from_vscode").lazy_load()

		luasnip.filetype_extend("typescript", { "tsdoc" })
		luasnip.filetype_extend("javascript", { "jsdoc" })
		luasnip.filetype_extend("lua", { "luadoc" })
		luasnip.filetype_extend("python", { "pydoc" })
		luasnip.filetype_extend("rust", { "rustdoc" })
		luasnip.filetype_extend("cs", { "csharpdoc" })
		luasnip.filetype_extend("c", { "cdoc" })
		luasnip.filetype_extend("cpp", { "cppdoc" })
		luasnip.filetype_extend("kotlin", { "kdoc" })
		luasnip.filetype_extend("sh", { "shelldoc" })

		cmp.setup({
			-- completion = {
			--     completeopt = "menu,menuone,preview,noselect",
			-- },
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				-- ["Tab"] = cmp.mapping.select_next_item(),
				-- ["S-Tab"] = cmp.mapping.select_prev_item(),
				["<Down>"] = cmp.mapping.scroll_docs(-4),
				["<Up>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				-- ["<CR>"] = cmp.mapping.confirm({ select = true }),
				['<CR>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						if luasnip.expandable() then
							luasnip.expand()
						else
							cmp.confirm({
								select = true,
							})
						end
					else
						fallback()
					end
				end),

				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),

			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 10 },
				{ name = "luasnip",  max_item_count = 5, priority = 8 },
				-- { name = "spell",    priority = 2 },
				-- { name = "buffer",   max_item_count = 8, priority = 2 },
				{ name = "path",     priority = 3 },
				{ name = "neorg" },
			}),
			window = {
				completion = {
					col_offset = -3,
					side_padding = 0,
				},
				documentation = {
					border = "solid",
					side_padding = 4,
				}
			},
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = " " .. strings[1] .. " "
					kind.menu = "    (" .. strings[2] .. ")"

					return kind
				end,
			},
			experimental = {
				ghost_text = false,
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

		local vscode_status = pcall(require, "vscode")
		if vscode_status then
			local c = require('vscode.colors').get_colors()

			vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated",
				{ bg = c.vscOrange, fg = c.vscPopupBack, strikethrough = false })
			vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = c.vscBlue, bg = "NONE", bold = true })
			vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = c.vscBlue, bg = "NONE", bold = true })
			vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = c.vscViolet, bg = "NONE" })

			vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = c.vscPopupBack, bg = c.vscPink, bold = false })
			vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = c.vscPopupBack, bg = c.vscPink, bold = false })
			vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = c.vscPopupBack, bg = c.vscPink, bold = false })

			vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = c.vscPopupBack, bg = c.vscLightGreen, bold = false })
			vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = c.vscPopupBack, bg = c.vscLightGreen, bold = false })
			vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = c.vscPopupBack, bg = c.vscLightGreen, bold = false })

			vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = c.vscPopupBack, bg = c.vscPink, bold = false })
			vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = c.vscPopupBack, bg = c.vscPink, bold = false })
			vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = c.vscPopupBack, bg = c.vscPink, bold = false })

			vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = c.vscPopupBack, bg = c.vscViolet, bold = false })
			vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = c.vscPopupBack, bg = c.vscViolet, bold = false })
			vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = c.vscPopupBack, bg = c.vscViolet, bold = false })
			vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = c.vscPopupBack, bg = c.vscViolet, bold = false })
			vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = c.vscPopupBack, bg = c.vscViolet, bold = false })

			vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = c.vscPopupBack, bg = c.vscLightRed, bold = false })
			vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = c.vscPopupBack, bg = c.vscLightRed, bold = false })

			vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = c.vscPopupBack, bg = c.vscYellow, bold = false })
			vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = c.vscPopupBack, bg = c.vscYellow, bold = false })
			vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = c.vscPopupBack, bg = c.vscYellow, bold = false })

			vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = c.vscPopupBack, bg = c.vscBlue, bold = false })
			vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = c.vscPopupBack, bg = c.vscBlue, bold = false })
			vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = c.vscPopupBack, bg = c.vscBlue, bold = false })

			vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = c.vscPopupBack, bg = c.vscBlueGreen, bold = false })
			vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = c.vscPopupBack, bg = c.vscBlueGreen, bold = false })
			vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = c.vscPopupBack, bg = c.vscBlueGreen, bold = false })
		end
	end,
}
