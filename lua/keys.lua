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
keymap("n", "<M-k>", ":move-2<CR>", { silent = true })
keymap("n", "<M-j>", ":move+<CR>", { silent = true })
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

keymap("n", "<leader>lr", ":IncRename ", { silent = true, desc = "Rename" })

keymap("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
keymap("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
keymap("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
keymap("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })

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
keymap("n", "<leader>us", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], { desc = "Substitue current word" })
keymap("n", "<leader>ux", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Set file as executable" })
keymap("n", "<leader>uu", "<cmd>UrlView<CR>", { silent = true, desc = "View links" })
keymap("n", "<leader>uU", "<cmd>UrlView lazy<CR>", { silent = true, desc = "View Lazy links" })
keymap("n", "<leader>uf", "<cmd>Format<CR>", { silent = true, desc = "Format file" })
