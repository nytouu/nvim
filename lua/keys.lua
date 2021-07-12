local keymap = vim.api.nvim_set_keymap

-- leader
vim.g.mapleader = ' '

keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
-- hop
keymap('n', 's', ":HopChar2<CR>", {silent = true})

-- buffer movement
keymap('n', '<S-j>', ':BufferLineCycleNext<CR>', {noremap = true, silent = true})
keymap('n', '<S-k>', ':BufferLineCyclePrev<CR>', {noremap = true, silent = true})

-- better window movement
keymap('n', '<C-h>', '<C-w>h', {silent = true})
keymap('n', '<C-j>', '<C-w>j', {silent = true})
keymap('n', '<C-k>', '<C-w>k', {silent = true})
keymap('n', '<C-l>', '<C-w>l', {silent = true})

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
keymap('n', '<M-h>', '<<', {silent = true})
keymap('n', '<M-l>', '>>', {silent = true})
keymap('v', '<M-h>', '<gv', {noremap = true, silent = true})
keymap('v', '<M-l>', '>gv', {noremap = true, silent = true})

-- move lines up or down
keymap('n', '<M-k>', ':move-2<CR>', {silent = true}) -- move a single line in normal
keymap('n', '<M-j>', ':move+<CR>',  {silent = true})
keymap('x', '<M-k>', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true}) -- move multiple lines in visual
keymap('x', '<M-j>', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

-- scroll down hover doc or scroll in definition preview
-- vim.cmd("nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
-- scroll up hover doc
-- vim.cmd("nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")
-- vim.cmd('command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()')
