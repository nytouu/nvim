vim.cmd[[
augroup ScrollbarInit
	autocmd!
	autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
	autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
	autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
augroup end
]]

vim.g.scrollbar_highlight = {
	head = "ScrollHead",
	body = "ScrollBody",
	tail = "ScrollTail",
}

vim.g.scrollbar_excluded_filetypes = {'NvimTree', 'Dashboard'}
