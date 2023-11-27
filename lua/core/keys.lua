local keymap = vim.api.nvim_set_keymap

-- indent
keymap("n", "<M-h>", "<<", { silent = true })
keymap("n", "<M-l>", ">>", { silent = true })
keymap("v", "<M-h>", "<gv", { noremap = true, silent = true })
keymap("v", "<M-l>", ">gv", { noremap = true, silent = true })

-- move lines up or down
keymap("n", "<M-k>", ":move-2<CR>==", { silent = true })
keymap("n", "<M-j>", ":move+<CR>==", { silent = true })
keymap("x", "<M-k>", ":move '<-2<CR>gv=gv", { noremap = true, silent = true })
keymap("x", "<M-j>", ":move '>+1<CR>gv=gv", { noremap = true, silent = true })

keymap("i", "<C-j>", '"\\<C-n>"', { noremap = true, expr = true })
keymap("i", "<C-k>", '"\\<C-p>"', { noremap = true, expr = true })

-- window movement
keymap("n", "<C-h>", "<C-w>h", { silent = true })
keymap("n", "<C-j>", "<C-w>j", { silent = true })
keymap("n", "<C-k>", "<C-w>k", { silent = true })
keymap("n", "<C-l>", "<C-w>l", { silent = true })

-- terminal window navigation
vim.cmd([[
	tnoremap <C-h> <C-\><C-N><C-w>h
	tnoremap <C-j> <C-\><C-N><C-w>j
	tnoremap <C-k> <C-\><C-N><C-w>k
	tnoremap <C-l> <C-\><C-N><C-w>l
	inoremap <C-j> <C-\><C-N><C-w>j
	inoremap <C-k> <C-\><C-N><C-w>k
	tnoremap <Esc> <C-\><C-n>
]])

-- navigation
keymap("n", "n", "nzzzv", { silent = true })
keymap("n", "N", "Nzzzv", { silent = true })
keymap("n", "<C-d>", "<C-d>zz", { silent = true })
keymap("n", "<C-u>", "<C-u>zz", { silent = true })

-- folds
keymap("n", "<leader>Fo", ":foldopen<CR>", {noremap = true, silent = true, desc = "Open fold"})
keymap("n", "<leader>Fq", ":foldclose<CR>", {noremap = true, silent = true, desc = "Close fold"})

-- hightlight toggle
keymap("n", "<leader>tH", ":set hlsearch!<CR> ", { noremap = true, silent = true, desc = "Toggle search highlight" })

-- buffer
keymap("n", "<leader>bs", ":source %<CR> ", { noremap = true, silent = true, desc = "Source file" })

-- splits
keymap("n", "<leader>sh", ":split<CR> ", { noremap = true, silent = true, desc = "Horizontal split" })
keymap("n", "<leader>sv", ":vsplit<CR> ", { noremap = true, silent = true, desc = "Vertical split" })

-- lazy
keymap("n", "<leader>LL", ":Lazy<CR> ", { noremap = true, silent = true, desc = "Open Lazy" })
keymap("n", "<leader>Ls", ":Lazy sync<CR> ", { noremap = true, silent = true, desc = "Sync plugins" })
keymap("n", "<leader>Lh", ":Lazy health<CR> ", { noremap = true, silent = true, desc = "Check Lazy health" })
keymap("n", "<leader>Lp", ":Lazy profile<CR> ", { noremap = true, silent = true, desc = "Lazy profile" })
keymap("n", "<leader>Lc", ":Lazy clean<CR> ", { noremap = true, silent = true, desc = "Lazy profile" })

keymap("x", "<leader>up", '"_dP', { desc = "Paste no buffer" })
keymap("n", "<leader>uss", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], { desc = "Current word on file" })
keymap("n", "<leader>usl", [[:s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], { desc = "Current word on line" })
keymap("n", "<leader>ux", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Set file as executable" })
