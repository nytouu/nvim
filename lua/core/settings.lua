vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"

-- vim.wo.cc = "120"
vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menuone,noselect"
vim.o.ignorecase = true
vim.o.pumheight = 10
vim.o.pumblend = 0
vim.o.mouse = "a"
vim.o.mousemoveevent = true
vim.wo.cursorline = false
vim.o.title = true
TERMINAL = vim.fn.expand("$TERMINAL")
vim.cmd('let &titleold="' .. TERMINAL .. '"')
vim.o.titlestring = "nvim - %t %r"
vim.o.titlelen = 50
vim.wo.number = true
vim.o.hidden = true
vim.opt.isfname:append("@-@")
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.list = true
vim.opt.listchars:append("eol:~,extends:»,precedes:«,leadmultispace:·   ,multispace: ,tab:· ,trail:_,nbsp:_")
-- vim.opt.listchars:append("eol:~,extends:»,precedes:«,leadmultispace:    ,multispace: ,tab:  ,trail: ,nbsp:_")
vim.o.cmdheight = 1
vim.o.showcmd = true
vim.o.inccommand = "split"
vim.o.confirm = true
vim.o.showtabline = 2
vim.o.showmode = false
vim.o.termguicolors = true
vim.o.updatetime = 50
vim.bo.autoindent = true
vim.bo.smartindent = true
vim.opt.smarttab = true
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
vim.opt.hlsearch = true
vim.opt.laststatus = 2
vim.opt.statusline = "%2{mode()} | %f %m %r %= %{&spelllang} %y #%{bufnr()} %8(%l,%c%) %8p%%"

vim.g.persisting = true
vim.o.sessionoptions = "buffers,curdir,folds,tabpages,winpos,winsize"

if vim.g.neovide then
	vim.o.guifont = "Liga SFMono Nerd Font:h11"
	vim.g.neovide_padding_top = 24
	vim.g.neovide_padding_bottom = 24
	vim.g.neovide_padding_right = 24
	vim.g.neovide_padding_left = 24
	vim.g.neovide_refresh_rate = 144
	vim.g.neovide_cursor_trail_size = 0.1
	vim.g.neovide_cursor_animation_length = 0.01
	vim.opt.linespace = 4
	vim.g.neovide_refresh_rate_idle = 5
	vim.o.mouse = "a"
end
