vim.cmd('autocmd BufWritePost *.ms execute "!croffpdf %"| redraw!')
vim.cmd('autocmd VimLeavePre * :set guicursor=n-c-v-r-i-ci-ve:ver25')

vim.cmd('autocmd VimEnter * hi CurrentWordTwins guibg=#292e42 gui=none')
vim.cmd('let g:vim_current_word#highlight_current_word = 0')
vim.cmd('let g:vim_current_word#highlight_twins = 1')
vim.cmd('let g:vim_current_word#highlight_delay = 0')

-- highlights
-- vim.cmd('autocmd VimEnter * hi CursorLine guibg=#292e42')
-- vim.cmd('autocmd VimEnter * hi LineNr guifg=#414868')
vim.cmd('autocmd VimEnter * hi ScrollView               guibg=#414868')
vim.cmd('autocmd CursorMoved * hi CursorLineNR          guifg=#89B4FA')
vim.cmd('autocmd VimEnter * hi DiffAdd                  guifg=#A6E3A1 guibg=none')
vim.cmd('autocmd VimEnter * hi DiffChange               guifg=#f7ceaf guibg=none')
vim.cmd('autocmd VimEnter * hi DiffDelete               guifg=#F38BA8 guibg=none')
vim.cmd('autocmd VimEnter * hi NvimTreeFolderIcon       guifg=#89B4FA')
vim.cmd('autocmd VimEnter * hi VertSplit                guibg=NONE guifg=#414868')
vim.cmd('autocmd BufEnter * hi StatusLine               guibg=#181825 guibg=#1e1e2e')
vim.cmd('autocmd BufEnter * hi StatusLineNC             guibg=#1e1e2e guifg=#1e1e2e')
vim.cmd('autocmd BufEnter * hi NvimTreeFolderName       guifg=#89B4FA')
vim.cmd('autocmd BufEnter * hi NvimTreeIndentMarker     guifg=#89B4FA')
vim.cmd('autocmd BufEnter * hi NvimTreeVertSplit        guibg=#181825 guifg=#181825')
vim.cmd('autocmd BufEnter NvimTree hi NvimTreeStatusLine guibg=#181825 guifg=#181825')
vim.cmd('autocmd BufEnter NvimTree hi NvimTreeStatusLineNC guibg=#181825')
vim.cmd('autocmd VimEnter * hi TelescopeNormal          guifg=#CDD6F4 guibg=#181825')
vim.cmd('autocmd VimEnter * hi TelescopeBorder          guifg=#181825 guibg=#181825')
vim.cmd('autocmd VimEnter * hi TelescopePromptNormal    guifg=#CDD6F4 guibg=#1e1e2e')
vim.cmd('autocmd VimEnter * hi TelescopePromptTitle     guifg=#181825 guibg=#F38BA8')
vim.cmd('autocmd VimEnter * hi TelescopePromptBorder    guifg=#1e1e2e guibg=#1e1e2e')
vim.cmd('autocmd VimEnter * hi TelescopePromptPrefix    guifg=#F38BA8 guibg=#1e1e2e')
vim.cmd('autocmd VimEnter * hi TelescopeResultsBorder   guifg=#181825 guibg=#181825')
vim.cmd('autocmd VimEnter * hi TelescopeResultsTitle    guifg=#181825 guibg=#f7ceaf')
vim.cmd('autocmd VimEnter * hi TelescopePreviewBorder   guifg=#181825 guibg=#181825')
vim.cmd('autocmd VimEnter * hi TelescopePreviewTitle    guifg=#181825 guibg=#A6E3A1')
vim.cmd('autocmd VimEnter * hi TelescopeSelection       guibg=#1e1e2e')
