-- vim.cmd('autocmd VimEnter * hi Normal guibg=NONE')

vim.cmd('autocmd BufWritePost *.ms execute "!croffpdf %"| redraw!')
vim.cmd('autocmd VimLeavePre * :set guicursor=n-c-v-r-i-ci-ve:ver25')

-- highlights
-- vim.cmd('autocmd VimEnter * hi TSKeyword gui=bold')
-- vim.cmd('autocmd VimEnter * hi TSOperator gui=bold')
-- vim.cmd('autocmd VimEnter * hi TSInclude gui=bold')
-- vim.cmd('autocmd VimEnter * hi TSRepeat gui=bold')
-- vim.cmd('autocmd VimEnter * hi TSConditional gui=bold')
-- vim.cmd('autocmd VimEnter * hi TSField gui=italic')
-- vim.cmd('autocmd VimEnter * hi TSMethod gui=italic')
vim.cmd('autocmd VimEnter * hi ScrollView guibg=#414868')
vim.cmd('autocmd VimEnter * hi LineNr guifg=#414868')
-- vim.cmd('autocmd VimEnter * hi CursorLine guibg=#292e42')
vim.cmd('autocmd CursorMoved * hi CursorLineNR guifg=#7aa2f7')
vim.cmd('autocmd VimEnter * hi DiffAdd guifg=#9ece6a guibg=none')
vim.cmd('autocmd VimEnter * hi DiffChange guifg=#e0af68 guibg=none')
vim.cmd('autocmd VimEnter * hi DiffDelete guifg=#f7768e guibg=none')
vim.cmd('autocmd VimEnter * hi NvimTreeFolderIcon guifg=#7aa2f7')
vim.cmd('autocmd VimEnter * hi VertSplit guibg=NONE guifg=#414868')
vim.cmd('autocmd BufEnter * hi StatusLine guibg=#16161e guibg=#1f2335')
vim.cmd('autocmd BufEnter * hi StatusLineNC guibg=#1f2335 guifg=#1f2335')
vim.cmd('autocmd BufEnter NvimTree hi NvimTreeFolderName guifg=#7aa2f7')
vim.cmd('autocmd BufEnter NvimTree hi NvimTreeIndentMarker guifg=#c0caf5')
vim.cmd('autocmd BufEnter NvimTree hi NvimTreeVertSplit guibg=#16161e guifg=#16161e')
vim.cmd('autocmd BufEnter NvimTree hi NvimTreeStatusLine guibg=#16161e guifg=#16161e')
vim.cmd('autocmd BufEnter NvimTree hi NvimTreeStatusLineNC guibg=#16161e')
vim.cmd('autocmd VimEnter * hi TelescopeNormal guifg=#c0caf5 guibg=#16161e')
vim.cmd('autocmd VimEnter * hi TelescopeBorder guifg=#16161e guibg=#16161e')
vim.cmd('autocmd VimEnter * hi TelescopePromptNormal guifg=#c0caf5 guibg=#1f2335')
vim.cmd('autocmd VimEnter * hi TelescopePromptTitle guifg=#16161e guibg=#f7768e')
vim.cmd('autocmd VimEnter * hi TelescopePromptBorder guifg=#1f2335 guibg=#1f2335')
vim.cmd('autocmd VimEnter * hi TelescopePromptPrefix guifg=#f7768e guibg=#1f2335')
vim.cmd('autocmd VimEnter * hi TelescopeResultsBorder guifg=#16161e guibg=#16161e')
vim.cmd('autocmd VimEnter * hi TelescopeResultsTitle guifg=#16161e guibg=#e0af68')
vim.cmd('autocmd VimEnter * hi TelescopePreviewBorder guifg=#16161e guibg=#16161e')
vim.cmd('autocmd VimEnter * hi TelescopePreviewTitle guifg=#16161e guibg=#9ece6a')
vim.cmd('autocmd VimEnter * hi TelescopeSelection guibg=#1f2335')
