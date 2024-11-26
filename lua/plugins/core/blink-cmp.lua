return {
	'saghen/blink.cmp',
	-- dir = "~/git/blink.cmp/",
	lazy = false,
	enabled = true,
	dependencies = {
		'rafamadriz/friendly-snippets',
	},
	build = 'nix run .#build-plugin',
	opts = {
		highlight = {
			use_nvim_cmp_as_default = false,
		},
		nerd_font_variant = 'normal',

		accept = {
			auto_brackets = {
				enabled = true
			},
		},

		trigger = {
			signature_help = {
				enabled = true
			},
			completion = {
				keyword_range = 'full',
			}
		},
		keymap = {
			['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
			['<C-e>'] = { 'hide' },
			['<CR>'] = { 'accept', 'fallback' },

			['<C-k>'] = { 'select_prev', 'fallback' },
			['<C-j>'] = { 'select_next', 'fallback' },

			['<Up>'] = { 'scroll_documentation_up', 'fallback' },
			['<Down>'] = { 'scroll_documentation_down', 'fallback' },

			['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
			['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
		},
		windows = {
			autocomplete = {
				auto_show = true,
				min_width = 35,
				max_height = 15,
				border = 'none',
				winhighlight =
				'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
				scrolloff = 2,
				selection = "preselect",
				draw = {
					align_to_component = 'label',
					padding = 0,
					gap = 1,
					columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 }, { 'kind' } },
					components = {
						kind_icon = {
							ellipsis = false,
							text = function(ctx) return ' ' .. ctx.kind_icon .. ' ' end,
							highlight = function(ctx) return 'BlinkCmpKind' .. ctx.kind end,
						},
						kind = {
							ellipsis = false,
							text = function(ctx) return ctx.kind .. ' ' end,
							highlight = function(ctx) return 'BlinkCmpKind' end,
						},
						label = {
							width = { fill = true, max = 40 },
							text = function(ctx) return ctx.label .. (ctx.label_detail or '') end,
							highlight = function(ctx)
								-- label and label details
								local highlights = {
									{ 0, #ctx.label, group = ctx.deprecated and 'BlinkCmpLabelDeprecated' or 'BlinkCmpLabel' },
								}
								if ctx.label_detail then
									table.insert(
										highlights,
										{ #ctx.label + 1, #ctx.label + #ctx.label_detail, group = 'BlinkCmpLabelDetail' }
									)
								end
								-- characters matched on the label by the fuzzy matcher
								if ctx.label_matched_indices ~= nil then
									for _, idx in ipairs(ctx.label_matched_indices) do
										table.insert(highlights, { idx, idx + 1, group = 'BlinkCmpLabelMatch' })
									end
								end
								return highlights
							end,
						},
						label_description = {
							width = { max = 30 },
							text = function(ctx) return ctx.label_description or '' end,
							highlight = 'BlinkCmpLabelDescription',
						},
					},
				},
			},
			documentation = {
				min_width = 20,
				max_width = 120,
				max_height = 40,
				border = 'padded',
				winhighlight =
				'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None',
				direction_priority = {
					autocomplete_north = { 'e', 'w', 'n', 's' },
					autocomplete_south = { 'e', 'w', 's', 'n' },
				},
				auto_show = true,
				auto_show_delay_ms = 0,
				update_delay_ms = 50,
			},
			signature_help = {
				min_width = 1,
				max_width = 60,
				max_height = 20,
				border = 'padded',
				winhighlight = 'Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder',
			},
			ghost_text = {
				enabled = true,
			},
		},
		sources = {
			completion = {
				enabled_providers = { 'lsp', 'path', 'snippets' },
			},
			providers = {
				lsp = {
					name = "lsp",
					module = "blink.cmp.sources.lsp",
					score_offset = 30,
				},
				snippets = {
					name = "snippets",
					module = "blink.cmp.sources.snippets",
					score_offset = 20,
				},
				path = {
					name = "path",
					module = "blink.cmp.sources.path",
					score_offset = 100,
				},
				buffer = {
					name = "Buffer",
					module = "blink.cmp.sources.buffer",
					score_offset = 0,
					fallback_for = { 'lsp' },
				},
			}
		},
		kind_icons = {
			Text = "󰉿",
			Method = "󰆧",
			Function = "󰊕",
			Constructor = "",
			Field = "󰜢",
			Variable = "󰀫",
			Class = "󰠱",
			Interface = "",
			Module = "",
			Property = "󰜢",
			Unit = "󰑭",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "󰅴",
			Color = "󰏘",
			File = "󰈙",
			Reference = "󰈇",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "󰙅",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "",
		},
	},
	init = function()
		local c = require('vscode.colors').get_colors()

		vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { fg = c.vscBlue, bg = "NONE", bold = true })

		vim.api.nvim_set_hl(0, "BlinkCmpScrollBarThumb", { fg = "NONE", bg = c.vscTabOther, bold = true })

		vim.api.nvim_set_hl(0, "BlinkCmpKind", { fg = c.vscViolet, bg = "NONE", bold = false, italic = true })
		vim.api.nvim_set_hl(0, "BlinkCmpKindField", { fg = c.vscPopupBack, bg = c.vscPink, bold = false, italic = true })
		vim.api.nvim_set_hl(0, "BlinkCmpKindProperty", { fg = c.vscPopupBack, bg = c.vscPink, bold = false, italic = true })
		vim.api.nvim_set_hl(0, "BlinkCmpKindEvent", { fg = c.vscPopupBack, bg = c.vscPink, bold = false, italic = true })

		vim.api.nvim_set_hl(0, "BlinkCmpKindText", { fg = c.vscPopupBack, bg = c.vscLightGreen, bold = false, italic = true })
		vim.api.nvim_set_hl(0, "BlinkCmpKindEnum", { fg = c.vscPopupBack, bg = c.vscLightGreen, bold = false, italic = true })
		vim.api.nvim_set_hl(0, "BlinkCmpKindKeyword", { fg = c.vscPopupBack, bg = c.vscLightGreen, bold = false, italic = true })

		vim.api.nvim_set_hl(0, "BlinkCmpKindConstant", { fg = c.vscPopupBack, bg = c.vscPink, bold = false, italic = true })
		vim.api.nvim_set_hl(0, "BlinkCmpKindConstructor", { fg = c.vscPopupBack, bg = c.vscPink, bold = false, italic = true })
		vim.api.nvim_set_hl(0, "BlinkCmpKindReference", { fg = c.vscPopupBack, bg = c.vscPink, bold = false, italic = true })

		vim.api.nvim_set_hl(0, "BlinkCmpKindFunction", { fg = c.vscPopupBack, bg = c.vscViolet, bold = false, italic = true })
		vim.api.nvim_set_hl(0, "BlinkCmpKindStruct", { fg = c.vscPopupBack, bg = c.vscViolet, bold = false, italic = true })
		vim.api.nvim_set_hl(0, "BlinkCmpKindClass", { fg = c.vscPopupBack, bg = c.vscViolet, bold = false, italic = true })
		vim.api.nvim_set_hl(0, "BlinkCmpKindModule", { fg = c.vscPopupBack, bg = c.vscViolet, bold = false, italic = true })
		vim.api.nvim_set_hl(0, "BlinkCmpKindOperator", { fg = c.vscPopupBack, bg = c.vscViolet, bold = false, italic = true })

		vim.api.nvim_set_hl(0, "BlinkCmpKindVariable", { fg = c.vscPopupBack, bg = c.vscLightRed, bold = false, italic = true })
		vim.api.nvim_set_hl(0, "BlinkCmpKindFile", { fg = c.vscPopupBack, bg = c.vscLightRed, bold = false, italic = true })

		vim.api.nvim_set_hl(0, "BlinkCmpKindUnit", { fg = c.vscPopupBack, bg = c.vscYellow, bold = false, italic = true })
		vim.api.nvim_set_hl(0, "BlinkCmpKindSnippet", { fg = c.vscPopupBack, bg = c.vscYellow, bold = false, italic = true })
		vim.api.nvim_set_hl(0, "BlinkCmpKindFolder", { fg = c.vscPopupBack, bg = c.vscYellow, bold = false, italic = true })

		vim.api.nvim_set_hl(0, "BlinkCmpKindMethod", { fg = c.vscPopupBack, bg = c.vscBlue, bold = false, italic = true })
		vim.api.nvim_set_hl(0, "BlinkCmpKindValue", { fg = c.vscPopupBack, bg = c.vscBlue, bold = false, italic = true })
		vim.api.nvim_set_hl(0, "BlinkCmpKindEnumMember", { fg = c.vscPopupBack, bg = c.vscBlue, bold = false, italic = true })

		vim.api.nvim_set_hl(0, "BlinkCmpKindInterface", { fg = c.vscPopupBack, bg = c.vscBlueGreen, bold = false, italic = true })
		vim.api.nvim_set_hl(0, "BlinkCmpKindColor", { fg = c.vscPopupBack, bg = c.vscBlueGreen, bold = false, italic = true })
		vim.api.nvim_set_hl(0, "BlinkCmpKindTypeParameter", { fg = c.vscPopupBack, bg = c.vscBlueGreen, bold = false, italic = true })
	end
}
