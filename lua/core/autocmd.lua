vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('highlight_yank', {}),
	desc = 'Hightlight selection on yank',
	pattern = '*',
	callback = function()
		vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "dashboard", "neo-tree", "norg" },
	callback = function()
		require("ufo").detach()
		vim.opt_local.foldenable = false
	end
})

local function augroup(name, autocmds)
	local group = vim.api.nvim_create_augroup(name, {})
	for event, opts in pairs(autocmds) do
		opts.group = group
		vim.api.nvim_create_autocmd(event, opts)
	end
end

-- Set cursor hints according to mode
augroup('Enter', {
	InsertEnter = { command = 'set cursorline' },
})

augroup('Leave', {
	InsertLeave = { command = 'set nocursorline' },
})
