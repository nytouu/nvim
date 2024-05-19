return {
	"Wansmer/symbol-usage.nvim",
	event = "LspAttach",
	enabled = true,
	config = function()
		local function h(name)
			return vim.api.nvim_get_hl(0, { name = name })
		end

		-- hl-groups can have any name
		vim.api.nvim_set_hl(0, "SymbolUsageRounding", { fg = h("Normal").bg, italic = true })
		vim.api.nvim_set_hl(0, "SymbolUsageContent", { bg = h("Normal").bg, fg = h("Comment").fg, italic = true })
		vim.api.nvim_set_hl(0, "SymbolUsageRef", { fg = h("Function").fg, bg = h("Normal").bg, italic = true })
		vim.api.nvim_set_hl(0, "SymbolUsageDef", { fg = h("Type").fg, bg = h("Normal").bg, italic = true })
		vim.api.nvim_set_hl(0, "SymbolUsageImpl", { fg = h("@keyword").fg, bg = h("Normal").bg, italic = true })

		local function text_format(symbol)
			local res = {}

			local separator = { " ", "SymbolUsageRounding" }

			if symbol.references then
				local usage = symbol.references <= 1 and "usage" or "usages"
				local num = symbol.references == 0 and "no" or symbol.references
				table.insert(res, separator)
				table.insert(res, { "󰌹 ", "SymbolUsageRef" })
				table.insert(res, { ("%s %s"):format(num, usage), "SymbolUsageContent" })
				table.insert(res, separator)
			end

			if symbol.definition then
				if #res > 0 then
					table.insert(res, { " ", "NonText" })
				end
				table.insert(res, separator)
				table.insert(res, { "󰳽 ", "SymbolUsageDef" })
				table.insert(res, { symbol.definition .. " defs", "SymbolUsageContent" })
				table.insert(res, separator)
			end

			if symbol.implementation then
				if #res > 0 then
					table.insert(res, { " ", "NonText" })
				end
				table.insert(res, separator)
				table.insert(res, { "󰡱 ", "SymbolUsageImpl" })
				table.insert(res, { symbol.implementation .. " impls", "SymbolUsageContent" })
				table.insert(res, separator)
			end

			return res
		end

		require("symbol-usage").setup({
			text_format = text_format,
			vt_position = "end_of_line",
		})
	end,
}
