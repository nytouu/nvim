require("cmp").setup{
	snippet = {
		expand = function(args)
		require("luasnip").lsp_expand(args.body)
		end,
	},
	formatting = {
	format = function(entry, vim_item)
		-- load lspkind icons
		vim_item.kind = string.format(
			"%s %s",
			require("plug.cmp-icons").icons[vim_item.kind],
			vim_item.kind
		)

		vim_item.menu = ({
			nvim_lsp = "[lsp]",
			nvim_lua = "[lua]",
			buffer = "[buffer]",
			path = "[path]",
			calc = "[calc]",
			luasnip = "[luasnip]",
			spell = "[spell]",
			zsh = "[zsh]",
			plugins = "[plugins]",
		})[entry.source.name]

		return vim_item
	end,
	},
	mapping = {
		["<C-p>"] = require("cmp").mapping.select_prev_item(),
		["<C-n>"] = require("cmp").mapping.select_next_item(),
		["<C-d>"] = require("cmp").mapping.scroll_docs(-4),
		["<C-f>"] = require("cmp").mapping.scroll_docs(4),
		["<C-Space>"] = require("cmp").mapping.complete(),
		["<C-e>"] = require("cmp").mapping.close(),
		["<CR>"] = require("cmp").mapping.confirm {
		behavior = require("cmp").ConfirmBehavior.Replace,
		select = true,
	},
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
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "calc" },
		{ name = "spell" },
		{ name = "zsh" },
		{ name = "plugins" },
	}
}
