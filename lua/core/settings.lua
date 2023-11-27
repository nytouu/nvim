vim.o.background = "dark"

vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"

-- vim.cmd("set colorcolumn=100")
vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menuone,noselect"
vim.o.ignorecase = true
-- vim.wo.foldmethod = "indent"
-- vim.wo.foldlevel = 99
-- vim.o.foldcolumn = '1'
vim.o.pumheight = 10
vim.o.pumblend = 0
vim.o.mouse = "a"
vim.wo.cursorline = false
vim.o.title = true
TERMINAL = vim.fn.expand("$TERMINAL")
vim.cmd('let &titleold="' .. TERMINAL .. '"')
vim.o.titlestring = "nvim - %t %r"
vim.o.titlelen = 50
vim.wo.number = true
vim.o.hidden = true
vim.cmd("set ts=4")
vim.cmd("set sw=4")
-- vim.cmd("set listchars=trail:-,nbsp:+")
-- vim.cmd("set fillchars+=foldopen:▾,foldsep:│,foldclose:▸ ")
vim.o.cmdheight = 1
vim.o.confirm = true
vim.o.showtabline = 2
vim.o.showmode = false
vim.o.termguicolors = true
vim.o.updatetime = 100
vim.o.timeoutlen = 300
vim.bo.smartindent = true
vim.bo.expandtab = true
vim.wo.wrap = false
vim.wo.signcolumn = "yes"
vim.o.conceallevel = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.synmaxcol = 1024
vim.cmd("syntax on")
vim.opt.shortmess:append("c")
vim.cmd("let &fcs='eob: '")
vim.o.backup = false
vim.o.writebackup = false
vim.opt.scrolloff = 6
vim.opt.sidescrolloff = 6
vim.opt.hlsearch = false

-- vim.opt.laststatus = 2
-- vim.opt.statusline = '%2{mode()} | %f %m %r %= %{&spelllang} %y #%{bufnr()} %8(%l,%c%) %8p%%'
