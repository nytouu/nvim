return {
	'pechorin/any-jump.vim',
	keys = {
		{ '<leader>lJ', '<cmd>AnyJump<cr>', desc = 'Jump to definition (AnyJump)' },
	},
	init = function()
		vim.g.any_jump_disable_default_keybindings = 1
	end,
	-- config = function() end,
}
