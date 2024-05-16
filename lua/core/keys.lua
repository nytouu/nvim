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
keymap("n", "<leader>Fo", ":foldopen<CR>", { noremap = true, silent = true, desc = "Open fold" })
keymap("n", "<leader>Fq", ":foldclose<CR>", { noremap = true, silent = true, desc = "Close fold" })

-- hightlight toggle
keymap("n", "<leader>tH", ":set hlsearch!<CR> ", { noremap = true, silent = true, desc = "Toggle search highlight" })

-- buffer
keymap("n", "<leader>bs", ":source %<CR> ", { noremap = true, silent = true, desc = "Source file" })

-- nvim
keymap("n", "<leader>qq", ":q<CR>", { noremap = true, silent = true, desc = "Quit neovim" })
keymap("n", "<leader>qa", ":qa<CR>", { noremap = true, silent = true, desc = "Quit all" })
keymap("n", "<leader>qf", ":qa!<CR>", { noremap = true, silent = true, desc = "Force quit all" })

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

local function handle_n_N(key)
	do
		local function get_n_or_N(_key)
			local n_or_N = _key
			if n_or_N == "n" then
				return "N"
			elseif n_or_N == "N" then
				return "n"
			else
				return nil
			end
		end

		local function feed(_key)
			return vim.api.nvim_feedkeys(_key, "n", true)
		end

		local search_forward = vim.v.searchforward
		if search_forward == 0 then
			feed(get_n_or_N(key))
		elseif search_forward == 1 then
			feed(key)
		else
		end
	end
	local function set_hl()
		vim.opt.hlsearch = true
		return nil
	end

	vim.defer_fn(set_hl, 5)
end

vim.keymap.set({ "n" }, "n", function()
	handle_n_N("n")
end)
vim.keymap.set({ "n" }, "N", function()
	handle_n_N("N")
end)
