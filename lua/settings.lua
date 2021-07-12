vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_sidebars = { "NvimTree", "Outline", "toggleterm", "terminal", "packer" }
-- vim.g.tokyonight_dark_sidebar = false
vim.cmd('colorscheme tokyonight')

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
vim.o.cmdheight = 1
vim.o.confirm = true
vim.o.showtabline = 2
vim.o.showmode = false
vim.o.termguicolors = true
vim.o.updatetime = 300
vim.o.timeoutlen = 200
vim.bo.smartindent = true
vim.bo.expandtab = true
vim.wo.wrap = false
vim.wo.signcolumn = "yes"
vim.o.conceallevel = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.synmaxcol = 1024
vim.cmd('syntax on')
vim.cmd('set shortmess+=c')
vim.o.backup = false
vim.o.writebackup = false
vim.cmd('hi CurrentWordTwins guibg=#2c3044')
vim.cmd('let g:vim_current_word#highlight_current_word = 0')
vim.cmd('let g:vim_current_word#highlight_twins = 1')
vim.cmd('let g:vim_current_word#highlight_delay = 0')

-- neovide stuff
vim.o.guifont = "JetBrainsMono Nerd Font:h18"
vim.g.neovide_refresh_rate = 140
vim.g.neovide_cursor_animation_length = 0
