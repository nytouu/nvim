vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "dashboard", "neo-tree", "norg", "outline" },
	callback = function()
		local ufo_status = pcall(require, "ufo")
		if ufo_status then
			require("ufo").detach()
			vim.opt_local.foldenable = false
		end

		vim.opt_local.winbar = nil
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"js",
		"ts",
		"nix",
	},
	callback = function()
		vim.opt.shiftwidth = 2
		vim.opt.softtabstop = 2
		vim.opt.tabstop = 2
		vim.opt.listchars:append("leadmultispace:· ")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "norg" },
	callback = function()
		vim.opt.wrap = true
		vim.opt.list = false
		vim.opt.spell = false
		vim.opt.spelllang = { "en_us", "fr" }

		vim.cmd([[highlight Headline1 guibg=#1e2718]])
		vim.cmd([[highlight Headline2 guibg=#21262d]])
		vim.cmd([[highlight CodeBlock guibg=#1c1c1c]])
		vim.cmd([[highlight Dash guibg=#D19A66 gui=bold]])
		require("headlines").setup({
			norg = {
				headline_highlights = { "Headline1", "Headline2" },
				fat_headline_upper_string = "▃",
				fat_headline_lower_string = "⠉",
			},
		})
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "Trouble" },
	callback = function()
		vim.wo.cursorline = true
	end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.wo.cursorline = true
	end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		vim.wo.cursorline = false
	end,
})
