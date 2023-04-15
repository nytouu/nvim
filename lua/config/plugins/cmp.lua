require("cmp").setup({
	completion = {
		-- completeopt = "menu,menuone",
		keyword_length = 1,
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = {
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = 0,
			side_padding = 0,
		},
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
	mapping = {
		["<C-k>"] = require("cmp").mapping.select_prev_item(),
		["<C-j>"] = require("cmp").mapping.select_next_item(),
		["<C-d>"] = require("cmp").mapping.scroll_docs(-4),
		["<C-f>"] = require("cmp").mapping.scroll_docs(4),
		["<C-Space>"] = require("cmp").mapping.complete(),
		["<C-e>"] = require("cmp").mapping.close(),
		["<CR>"] = require("cmp").mapping.confirm({
			behavior = require("cmp").ConfirmBehavior.Replace,
			select = false,
		}),
		["<Tab>"] = function(fallback)
			if require("cmp").visible() then
				require("cmp").select_next_item()
			elseif require("luasnip").expand_or_jumpable() then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if require("cmp").visible() then
				require("cmp").select_prev_item()
			elseif require("luasnip").jumpable(-1) then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
			else
				fallback()
			end
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "calc" },
		{ name = "spell" },
		{ name = "zsh" },
		{ name = "plugins" },
		{ name = "crates" },
	},
})
