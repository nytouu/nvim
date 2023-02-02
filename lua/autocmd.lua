vim.cmd('autocmd BufWritePost *.ms execute "!croffpdf %"| redraw!')
vim.cmd('autocmd VimLeavePre * :set guicursor=n-c-v-r-i-ci-ve:ver25')

vim.cmd('autocmd VimEnter * hi CurrentWordTwins guibg=#202020 gui=none')
vim.cmd('let g:vim_current_word#highlight_current_word = 0')
vim.cmd('let g:vim_current_word#highlight_twins = 1')
vim.cmd('let g:vim_current_word#highlight_delay = 0')

vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})

-- highlights
vim.cmd('autocmd BufEnter * hi CursorLine guibg=#191919')
vim.cmd('autocmd BufEnter * hi ScrollView               guibg=#414868')
vim.cmd('autocmd BufEnter * hi ScrollHead               guifg=#525252')
vim.cmd('autocmd BufEnter * hi ScrollBody               guifg=#dde1e6')
vim.cmd('autocmd BufEnter * hi ScrollTail               guifg=#525252')
vim.cmd('autocmd CursorMoved * hi CursorLineNR          guifg=#82cfff')
vim.cmd('autocmd VimEnter * hi DiffAdd                  guifg=#42be65 guibg=none')
vim.cmd('autocmd VimEnter * hi DiffChange               guifg=#FFAB91 guibg=none')
vim.cmd('autocmd VimEnter * hi DiffDelete               guifg=#ee5396 guibg=none')
vim.cmd('autocmd VimEnter * hi DashboardIcon            guifg=#ee5396 guibg=none')
vim.cmd('autocmd VimEnter * hi DashboardKey             guifg=#82cfff guibg=none')
vim.cmd('autocmd VimEnter * hi DashboardDesc            guifg=#525252 guibg=none')
vim.cmd('autocmd VimEnter * hi DashboardHeader          guifg=#525252 guibg=none')
vim.cmd('autocmd VimEnter * hi DashboardFooter          guifg=#9399b2 guibg=none')
vim.cmd('autocmd VimEnter * hi NvimTreeFolderIcon       guifg=#82cfff')
vim.cmd('autocmd VimEnter * hi VertSplit                guibg=NONE guifg=#414868')
vim.cmd('autocmd BufEnter * hi StatusLine               guibg=#131313 guibg=#161616')
vim.cmd('autocmd BufEnter * hi StatusLineNC             guibg=#161616 guifg=#161616')
vim.cmd('autocmd BufEnter * hi NvimTreeFolderName       guifg=#82cfff')
vim.cmd('autocmd BufEnter * hi NvimTreeIndentMarker     guifg=#82cfff')
vim.cmd('autocmd BufEnter * hi NvimTreeVertSplit        guibg=#131313 guifg=#131313')
vim.cmd('autocmd BufEnter NvimTree hi NvimTreeStatusLine guibg=#0c0c0c guifg=#0c0c0c')
vim.cmd('autocmd BufEnter NvimTree hi NvimTreeStatusLineNC guifg=#0c0c0c guibg=#0c0c0c')
vim.cmd('autocmd VimEnter * hi TelescopeNormal          guifg=#dde1e6 guibg=#131313')
vim.cmd('autocmd VimEnter * hi TelescopeBorder          guifg=#131313 guibg=#131313')
vim.cmd('autocmd VimEnter * hi TelescopePromptNormal    guifg=#dde1e6 guibg=#101010')
vim.cmd('autocmd VimEnter * hi TelescopePromptTitle     guifg=#131313 guibg=#ee5396')
vim.cmd('autocmd VimEnter * hi TelescopePromptBorder    guifg=#101010 guibg=#101010')
vim.cmd('autocmd VimEnter * hi TelescopePromptPrefix    guifg=#ee5396 guibg=#101010')
vim.cmd('autocmd VimEnter * hi TelescopeResultsBorder   guifg=#131313 guibg=#131313')
vim.cmd('autocmd VimEnter * hi TelescopeResultsTitle    guifg=#131313 guibg=#FFAB91')
vim.cmd('autocmd VimEnter * hi TelescopePreviewBorder   guifg=#131313 guibg=#131313')
vim.cmd('autocmd VimEnter * hi TelescopePreviewTitle    guifg=#131313 guibg=#42be65')
vim.cmd('autocmd VimEnter * hi TelescopeSelection       guibg=#161616')

vim.cmd('autocmd BufEnter * hi PmenuSel                 guifg=none guibg=#2a2b3c')
vim.cmd('autocmd BufEnter * hi Pmenu                    guifg=#9399b2 guibg=#131313')
vim.cmd('autocmd BufEnter * hi CmpItemKindField         guifg=#131313 guibg=#ee5396')
vim.cmd('autocmd BufEnter * hi CmpItemKindProperty      guifg=#131313 guibg=#ee5396')
vim.cmd('autocmd BufEnter * hi CmpItemKindEvent         guifg=#131313 guibg=#ee5396')
vim.cmd('autocmd BufEnter * hi CmpItemKindText          guifg=#131313 guibg=#42be65')
vim.cmd('autocmd BufEnter * hi CmpItemKindEnum          guifg=#131313 guibg=#42be65')
vim.cmd('autocmd BufEnter * hi CmpItemKindKeyword       guifg=#131313 guibg=#42be65')
vim.cmd('autocmd BufEnter * hi CmpItemKindConstant      guifg=#131313 guibg=#F9E2AF')
vim.cmd('autocmd BufEnter * hi CmpItemKindConstructor   guifg=#131313 guibg=#F9E2AF')
vim.cmd('autocmd BufEnter * hi CmpItemKindReference     guifg=#131313 guibg=#F9E2AF')
vim.cmd('autocmd BufEnter * hi CmpItemKindFunction      guifg=#131313 guibg=#ff7eb6')
vim.cmd('autocmd BufEnter * hi CmpItemKindStruct        guifg=#131313 guibg=#ff7eb6')
vim.cmd('autocmd BufEnter * hi CmpItemKindClass         guifg=#131313 guibg=#ff7eb6')
vim.cmd('autocmd BufEnter * hi CmpItemKindModule        guifg=#131313 guibg=#ff7eb6')
vim.cmd('autocmd BufEnter * hi CmpItemKindOperator      guifg=#131313 guibg=#ff7eb6')
vim.cmd('autocmd BufEnter * hi CmpItemKindVariable      guifg=#131313 guibg=#525252')
vim.cmd('autocmd BufEnter * hi CmpItemKindFile          guifg=#131313 guibg=#525252')
vim.cmd('autocmd BufEnter * hi CmpItemKindUnit          guifg=#131313 guibg=#FFAB91')
vim.cmd('autocmd BufEnter * hi CmpItemKindSnippet       guifg=#131313 guibg=#FFAB91')
vim.cmd('autocmd BufEnter * hi CmpItemKindFolder        guifg=#131313 guibg=#FFAB91')
vim.cmd('autocmd BufEnter * hi CmpItemKindMethod        guifg=#131313 guibg=#82cfff')
vim.cmd('autocmd BufEnter * hi CmpItemKindValue         guifg=#131313 guibg=#82cfff')
vim.cmd('autocmd BufEnter * hi CmpItemKindEnumMember    guifg=#131313 guibg=#82cfff')
vim.cmd('autocmd BufEnter * hi CmpItemKindInterface     guifg=#131313 guibg=#3ddbd9')
vim.cmd('autocmd BufEnter * hi CmpItemKindColor         guifg=#131313 guibg=#3ddbd9')
vim.cmd('autocmd BufEnter * hi CmpItemKindTypeParameter guifg=#131313 guibg=#3ddbd9')

vim.cmd('autocmd BufEnter * hi CmpItemAbbrDeprecated    guifg=#525252 guibg=none')
vim.cmd('autocmd BufEnter * hi CmpItemAbbrMatch         guifg=#dde1e6 guibg=none')
vim.cmd('autocmd BufEnter * hi CmpItemAbbrMatchFuzzy    guifg=#dde1e6 guibg=none')
vim.cmd('autocmd BufEnter * hi CmpItemMenu              guifg=#ff7eb6 guibg=none')

vim.cmd('autocmd BufEnter * hi BarbecueContextFile          guibg=#161616 guifg=#525252')
vim.cmd('autocmd BufEnter * hi BarbecueContextModule        guibg=#161616 guifg=#ff7eb6')
vim.cmd('autocmd BufEnter * hi BarbecueContextNamespace        guibg=#161616 guifg=#42be65')
vim.cmd('autocmd BufEnter * hi BarbecueContextPackage         guibg=#161616 guifg=#ee5396')
vim.cmd('autocmd BufEnter * hi BarbecueContextClass         guibg=#161616 guifg=#ff7eb6')
vim.cmd('autocmd BufEnter * hi BarbecueContextMethod        guibg=#161616 guifg=#82cfff')
vim.cmd('autocmd BufEnter * hi BarbecureContectProperty      guibg=#161616 guifg=#3ddbd9')
vim.cmd('autocmd BufEnter * hi BarbecueContextField         guibg=#161616 guifg=#ee5396')
vim.cmd('autocmd BufEnter * hi BarbecueContextConstructor   guibg=#161616 guifg=#F9E2AF')
vim.cmd('autocmd BufEnter * hi BarbecueContextEnum          guibg=#161616 guifg=#42be65')
vim.cmd('autocmd BufEnter * hi BarbecueContextInterface     guibg=#161616 guifg=#3ddbd9')
vim.cmd('autocmd BufEnter * hi BarbecueContextFunction      guibg=#161616 guifg=#ff7eb6')
vim.cmd('autocmd BufEnter * hi BarbecueContextVariable      guibg=#161616 guifg=#525252')
vim.cmd('autocmd BufEnter * hi BarbecueContextConstant      guibg=#161616 guifg=#F9E2AF')
vim.cmd('autocmd BufEnter * hi BarbecueContextString      guibg=#161616 guifg=#82cfff')
vim.cmd('autocmd BufEnter * hi BarbecueContextNumber      guibg=#161616 guifg=#82cfff')
vim.cmd('autocmd BufEnter * hi BarbecueContextBoolean      guibg=#161616 guifg=#F9E2AF')
vim.cmd('autocmd BufEnter * hi BarbecueContextArray      guibg=#161616 guifg=#F9E2AF')
vim.cmd('autocmd BufEnter * hi BarbecueContextObject      guibg=#161616 guifg=#ff7eb6')
vim.cmd('autocmd BufEnter * hi BarbecueContextKey			guibg=#161616 guifg=#42be65')
vim.cmd('autocmd BufEnter * hi BarbecueContextNull         guibg=#161616 guifg=#ee5396')
vim.cmd('autocmd BufEnter * hi BarbecueContextEnumMember    guibg=#161616 guifg=#82cfff')
vim.cmd('autocmd BufEnter * hi BarbecueContextText          guibg=#161616 guifg=#42be65')
vim.cmd('autocmd BufEnter * hi BarbecueContextStruct        guibg=#161616 guifg=#ff7eb6')
vim.cmd('autocmd BufEnter * hi BarbecueContextEvent        guibg=#161616 guifg=#ff7eb6')
vim.cmd('autocmd BufEnter * hi BarbecueContextOperator      guibg=#161616 guifg=#ff7eb6')
vim.cmd('autocmd BufEnter * hi BarbecueContextReference     guibg=#161616 guifg=#F9E2AF')
vim.cmd('autocmd BufEnter * hi BarbecueContextTypeParameter guibg=#161616 guifg=#3ddbd9')
