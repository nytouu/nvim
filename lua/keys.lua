require('nvim_comment').setup()

-- leader
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- fold open/close
vim.api.nvim_set_keymap('n', '<Leader>Fo', ':foldopen<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>Fq', ':foldopen<CR>', {silent = true})

-- toggle stuff
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>te', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>ta', ':AerialToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>tr', ':LspTroubleToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>tt', ':ToggleTerm<CR>', {noremap = true, silent = true})

-- hop
vim.api.nvim_set_keymap('n', 's', ":HopChar2<CR>", {silent = true})

-- dashboard
vim.api.nvim_set_keymap('n', '<Leader>fd', ':Dashboard<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>ff', ':DashboardFindFile<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fg', ':DashboardFindWord<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fh', ':DashboardFindHistory<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fn', ':DashboardNewFile<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>fs', ':e $HOME/.config/nvim/lua/settings.lua<CR>', {noremap = true, silent = true})

-- quit/close
vim.api.nvim_set_keymap('n', '<Leader>qq', ':q<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>qa', ':qa<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>qb', ':Bdelete<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>qh', ':set hlsearch!<CR>', {noremap = true, silent = true})

-- write
vim.api.nvim_set_keymap('n', '<Leader>ww', ':w<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>wq', ':wq<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>wa', ':wqa<CR>', {silent = true})

-- buffer movement
vim.api.nvim_set_keymap('n', '<S-j>', ':BufferLineCycleNext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-k>', ':BufferLineCyclePrev<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>bp', ':BufferLinePick<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>b1', ':lua require"bufferline".go_to_buffer(1)<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>b2', ':lua require"bufferline".go_to_buffer(2)<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>b3', ':lua require"bufferline".go_to_buffer(3)<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>b4', ':lua require"bufferline".go_to_buffer(4)<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>b5', ':lua require"bufferline".go_to_buffer(5)<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>b6', ':lua require"bufferline".go_to_buffer(6)<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>b7', ':lua require"bufferline".go_to_buffer(7)<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>b8', ':lua require"bufferline".go_to_buffer(8)<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>b9', ':lua require"bufferline".go_to_buffer(9)<CR>', {noremap = true, silent = true})

-- git stuff
vim.api.nvim_set_keymap('n','<Leader>gj',':Gitsigns next_hunk<CR>',{noremap = true, silent = true})
vim.api.nvim_set_keymap('n','<Leader>gk',':Gitsigns prev_hunk<CR>',{noremap = true, silent = true})
vim.api.nvim_set_keymap('n','<Leader>gh',':Gitsigns preview_hunk<CR>',{noremap = true, silent = true})
vim.api.nvim_set_keymap('n','<Leader>gl',':LazyGit<CR>',{noremap = true, silent = true})

-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

-- split
vim.api.nvim_set_keymap('n', '<Leader>sh', ':split<CR>',  {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>sv', ':vsplit<CR>', {noremap = true, silent = true})

-- Terminal window navigation
vim.cmd([[
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l
  inoremap <C-h> <C-\><C-N><C-w>h
  inoremap <C-j> <C-\><C-N><C-w>j
  inoremap <C-k> <C-\><C-N><C-w>k
  inoremap <C-l> <C-\><C-N><C-w>l
  tnoremap <Esc> <C-\><C-n>
]])

-- resize with arrows
vim.cmd([[
    nnoremap <silent> <C-Up>    :resize -1<CR>
    nnoremap <silent> <C-Down>  :resize +1<CR>
    nnoremap <silent> <C-Left>  :vertical resize -2<CR>
    nnoremap <silent> <C-Right> :vertical resize +2<CR>
]])

-- better indenting
vim.api.nvim_set_keymap('n', '<M-h>', '<<', {silent = true})
vim.api.nvim_set_keymap('n', '<M-l>', '>>', {silent = true})
vim.api.nvim_set_keymap('v', '<M-h>', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<M-l>', '>gv', {noremap = true, silent = true})

-- move lines up or down
vim.api.nvim_set_keymap('n', '<M-k>', ':move-2<CR>', {silent = true}) -- move a single line in normal
vim.api.nvim_set_keymap('n', '<M-j>', ':move+<CR>',  {silent = true})
vim.api.nvim_set_keymap('x', '<M-k>', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true}) -- move multiple lines in visual
vim.api.nvim_set_keymap('x', '<M-j>', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

-- lsp saga stuff
vim.cmd("nnoremap <silent> <Leader>ld :Lspsaga preview_definition<CR>")
vim.cmd("nnoremap <silent> <Leader>lc <cmd>lua vim.lsp.buf.declaration()<CR>")
vim.cmd("nnoremap <silent> <Leader>lr <cmd>lua vim.lsp.buf.references()<CR>")
vim.cmd("nnoremap <silent> <Leader>li <cmd>lua vim.lsp.buf.implementation()<CR>")
vim.cmd("nnoremap <silent> <Leader>la :Lspsaga code_action<CR>")
vim.cmd("nnoremap <silent> <Leader>lh :Lspsaga hover_doc<CR>")
vim.cmd('nnoremap <silent> <Leader>ls :Lspsaga signature_help<CR>')
vim.cmd("nnoremap <silent> <Leader>lj :Lspsaga diagnostic_jump_next<CR>")
vim.cmd("nnoremap <silent> <Leader>lk :Lspsaga diagnostic_jump_prev<CR>")
-- scroll down hover doc or scroll in definition preview
-- vim.cmd("nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
-- scroll up hover doc
-- vim.cmd("nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")
-- vim.cmd('command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()')
