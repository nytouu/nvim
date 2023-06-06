local keymap = vim.api.nvim_set_keymap

keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle explorer" })

-- buffer movement
keymap("n", "<S-j>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
keymap("n", "<S-k>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

-- better window movement
keymap("n", "<C-h>", "<C-w>h", { silent = true })
keymap("n", "<C-j>", "<C-w>j", { silent = true })
keymap("n", "<C-k>", "<C-w>k", { silent = true })
keymap("n", "<C-l>", "<C-w>l", { silent = true })

keymap("i", "<C-h>", "<Left>", { silent = true })
keymap("i", "<C-l>", "<Right>", { silent = true })

keymap("n", "s", ":HopChar2<CR>", { silent = true })

-- Terminal window navigation
vim.cmd([[
	tnoremap <C-h> <C-\><C-N><C-w>h
	tnoremap <C-j> <C-\><C-N><C-w>j
	tnoremap <C-k> <C-\><C-N><C-w>k
	tnoremap <C-l> <C-\><C-N><C-w>l
	inoremap <C-j> <C-\><C-N><C-w>j
	inoremap <C-k> <C-\><C-N><C-w>k
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
-- Better nav for omnicomplete
-- vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
-- vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

keymap("n", "n", "nzzzv", { silent = true })
keymap("n", "N", "Nzzzv", { silent = true })
keymap("n", "<C-d>", "<C-d>zz", { silent = true })
keymap("n", "<C-u>", "<C-u>zz", { silent = true })

keymap("n", "<leader>Fo", ":foldopen<CR>", {noremap = true, silent = true, desc = "Open fold"})
keymap("n", "<leader>Fq", ":foldclose<CR>", {noremap = true, silent = true, desc = "Close fold"})

keymap("n", "<leader>te", ":NvimTreeToggle<CR>", {noremap = true, silent = true, desc = "Toggle explorer"})
keymap("n", "<leader>tr", ":TroubleToggle<CR>", {noremap = true, silent = true, desc = "Toggle diagnostics"})
keymap("n", "<leader>tt", ":ToggleTerm<CR>", {noremap = true, silent = true, desc = "Toggle terminal"})
keymap("n", "<leader>tT", ":TransparentToggle<CR>:lua require('autocmd')<CR>", {noremap = true, silent = true, desc = "Toggle transparency"})
keymap("n", "<leader>th", ":set hlsearch!<CR> ", { noremap = true, silent = true, desc = "Toggle search highlight" })

keymap("n", "<leader>fd", ":Dashboard<CR>", {noremap = true, silent = true, desc = "Open dashboard"})
keymap("n", "<leader>ff", ":Telescope find_files<CR>", {noremap = true, silent = true, desc = "Find files"})
keymap("n", "<leader>fw", ":Telescope live_grep<CR>", {noremap = true, silent = true, desc = "Find word"})
keymap("n", "<leader>fr", ":Telescope oldfiles<CR>", {noremap = true, silent = true, desc = "Recent files"})
keymap("n", "<leader>fc", ":Telescope find_files cwd=$HOME/.config/nvim/<CR>", {noremap = true, silent = true, desc = "Open config"})

keymap("n", "<leader>qq", ":q<CR> ", { noremap = true, silent = true, desc = "Quit" })
keymap("n", "<leader>qa", ":qa<CR> ", { noremap = true, silent = true, desc = "Quit all" })
keymap("n", "<leader>qb", ":Bdelete<CR> ", { noremap = true, silent = true, desc = "Close buffer" })

keymap("n", "<leader>ww", ":w<CR> ", { noremap = true, silent = true, desc = "Write file" })
keymap("n", "<leader>wq", ":w<CR> ", { noremap = true, silent = true, desc = "Write & quit" })
keymap("n", "<leader>wa", ":w<CR> ", { noremap = true, silent = true, desc = "Write all" })

keymap("n", "<leader>bp", ":BufferLinePick<CR> ", { noremap = true, silent = true, desc = "Pick buffer" })
keymap("n", "<leader>bs", ":source %<CR> ", { noremap = true, silent = true, desc = "Source file" })

keymap("n", "<leader>gg", ":LazyGit<CR> ", { noremap = true, silent = true, desc = "Open lazygit" })
-- keymap("n", "<leader>gd", ":DiffviewOpen %<CR> ", { silent = true, desc = "Open lazygit" })
keymap("n", "<leader>gj", ":Gitsigns next_hunk<CR>", { noremap = true, silent = true, desc = "Next hunk" })
keymap("n", "<leader>gk", ":Gitsigns prev_hunk<CR>", { noremap = true, silent = true, desc = "Previous hunk" })
keymap("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { noremap = true, silent = true, desc = "Preview hunk" })
keymap("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { noremap = true, silent = true, desc = "Reset hunk" })

keymap("n", "<leader>lD", ":Lspsaga peek_definition<CR> ", { noremap = true, silent = true, desc = "Peek definition" })
keymap("n", "<leader>ld", ":Lspsaga goto_definition<CR> ", { noremap = true, silent = true, desc = "Go to definition" })
keymap("n", "<leader>lr", ":Lspsaga rename<CR> ", { noremap = true, silent = true, desc = "Rename symbol" })
keymap("n", "<leader>lf", ":Lspsaga lsp_finder<CR> ", { noremap = true, silent = true, desc = "Lsp finder" })
keymap("n", "<leader>li", ":LspInfo<CR> ", { noremap = true, silent = true, desc = "Lsp info" })
keymap("n", "<leader>la", ":Lspsaga code_action<CR> ", { noremap = true, silent = true, desc = "Code actions" })
keymap("n", "<leader>lh", ":Lspsaga hover_doc<CR> ", { noremap = true, silent = true, desc = "Hover doc" })
keymap("n", "<leader>lj", ":Lspsaga diagnostic_jump_next<CR> ", { noremap = true, silent = true, desc = "Jump to next diagnostic" })
keymap("n", "<leader>lk", ":Lspsaga diagnostic_jump_prev<CR> ", { noremap = true, silent = true, desc = "Jump to previous diagnostic" })
keymap("n", "<leader>ll", ":Mason<CR> ", { noremap = true, silent = true, desc = "Open Mason" })

keymap("n", "<leader>sh", ":split<CR> ", { noremap = true, silent = true, desc = "Horizontal split" })
keymap("n", "<leader>sv", ":vsplit<CR> ", { noremap = true, silent = true, desc = "Vertical split" })

keymap("n", "<leader>hh", ":HopChar2<CR> ", { noremap = true, silent = true, desc = "Hop to chars" })
keymap("n", "<leader>hw", ":HopWord<CR> ", { noremap = true, silent = true, desc = "Hop to word" })
keymap("n", "<leader>hl", ":HopWord<CR> ", { noremap = true, silent = true, desc = "Hop to line" })

keymap("n", "<leader>LL", ":Lazy<CR> ", { noremap = true, silent = true, desc = "Open Lazy" })
keymap("n", "<leader>Ls", ":Lazy sync<CR> ", { noremap = true, silent = true, desc = "Sync plugins" })
keymap("n", "<leader>Lh", ":Lazy health<CR> ", { noremap = true, silent = true, desc = "Check Lazy health" })
keymap("n", "<leader>Lp", ":Lazy profile<CR> ", { noremap = true, silent = true, desc = "Lazy profile" })
keymap("n", "<leader>Lc", ":Lazy clean<CR> ", { noremap = true, silent = true, desc = "Lazy profile" })

-- keymap("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
-- keymap("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
-- keymap("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
-- keymap("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })

function _G.Toggle_venn()
	local venn_enabled = vim.inspect(vim.b.venn_enabled)
	if venn_enabled == "nil" then
		vim.b.venn_enabled = true
		vim.cmd([[setlocal ve=all]])
		-- draw a line on HJKL keystokes
		vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
		vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
		-- draw a box by pressing "f" with visual selection
		vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", { noremap = true })
	else
		vim.cmd([[setlocal ve=]])
		vim.cmd([[mapclear <buffer>]])
		vim.b.venn_enabled = nil
	end
end

keymap("n", "<leader>uv", ":lua Toggle_venn()<CR>", { noremap = true, desc = "Toggle Venn mode" })
keymap("x", "<leader>up", '"_dP', { desc = "Paste no buffer" })
keymap("n", "<leader>uss", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], { desc = "Current word on file" })
keymap("n", "<leader>usl", [[:s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], { desc = "Current word on line" })
keymap("n", "<leader>ux", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Set file as executable" })
keymap("n", "<leader>uu", "<cmd>UrlView<CR>", { silent = true, desc = "View links" })
keymap("n", "<leader>uU", "<cmd>UrlView lazy<CR>", { silent = true, desc = "View Lazy links" })
keymap("n", "<leader>uf", "<cmd>Format<CR>", { silent = true, desc = "Format file" })

keymap("n", "<leader>ubb", "<cmd>BrowserOpen<CR>", { silent = true, desc = "Open browser server" })
keymap("n", "<leader>ubr", "<cmd>BrowserRestart<CR>", { silent = true, desc = "Restart browser server" })
keymap("n", "<leader>ubs", "<cmd>BrowserSync<CR>", { silent = true, desc = "Connect to browser server" })
keymap("n", "<leader>ubS", "<cmd>BrowserSync<CR>", { silent = true, desc = "Stop browser server" })
