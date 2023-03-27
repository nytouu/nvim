-- colorscheme
vim.g.minimal_italic_functions = true
vim.g.minimal_italic_comments = true
vim.g.minimal_italic_keywords = true
vim.g.minimal_transparent_background = true
vim.o.background = "dark"
vim.cmd[[colorscheme minimal]]

vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"

vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menuone,noselect"
vim.cmd('set colorcolumn=99999')
vim.o.ignorecase = true
vim.wo.foldmethod = "indent"
vim.wo.foldlevel = 99
vim.o.pumheight = 10
vim.o.pumblend = 0
vim.o.mouse = "a"
vim.wo.cursorline = true
vim.o.title = true
TERMINAL = vim.fn.expand('$TERMINAL')
vim.cmd('let &titleold="'..TERMINAL..'"')
vim.o.titlestring="nvim - %t %r"
vim.o.titlelen = 50
vim.wo.number = true
vim.wo.relativenumber = false
vim.o.hidden = true
vim.cmd('set ts=4')
vim.cmd('set sw=4')
vim.cmd('set listchars=trail:-,nbsp:+')
vim.o.cmdheight = 1
vim.o.confirm = true
vim.o.showtabline = 2
vim.o.showmode = false
vim.o.termguicolors = true
vim.o.updatetime = 50
vim.o.timeoutlen = 200
vim.bo.smartindent = true
vim.bo.expandtab = true
vim.wo.wrap = false
vim.wo.signcolumn = "yes"
vim.o.conceallevel = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.synmaxcol = 1024
-- vim.o.lazyredraw = true
vim.cmd('syntax on')
vim.opt.shortmess:append("c")
vim.cmd("let &fcs='eob: '")
vim.o.backup = false
vim.o.writebackup = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.hlsearch = false

-- neovide stuff
vim.o.guifont = "SF Mono,nonicons"
vim.g.neovide_refresh_rate=144
vim.g.neovide_cursor_animation_length=0.03
vim.g.neovide_cursor_trail_length=0.3
vim.g.neovide_cursor_antialiasing=true
vim.g.neovide_cursor_vfx_mode="pixiedust"
vim.g.neovide_cursor_vfx_particle_lifetime=2.2
vim.g.neovide_cursor_vfx_particle_density=10.0
vim.g.neovide_cursor_vfx_particle_phase=3.0
vim.g.neovide_transparency = 0.9
vim.g.transparency = 0.9
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

if vim.g.neovide then
	vim.g.transparent_enabled = false
else
	vim.g.transparent_enabled = true
end
