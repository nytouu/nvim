local db = require('dashboard')
local stats = require("lazy").stats()

db.preview_file_height = 12
db.preview_file_width = 80
db.hide_statusline = false
db.hide_tabline = false
db.custom_header = {
'                                 ',
'  ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆        ',
'   ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦      ',
'         ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄    ',
'          ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀ ⠢⣀⡀⠈⠙⠿⠄   ',
'         ⢠⣿⣿⣿⠈   ⠈⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀  ',
'  ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄ ',
' ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾   ',
'⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄ ',
'⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄',
'     ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆   ⠁',
'      ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃    ',
'                                 ',
}

db.custom_footer = { "lazy loaded " .. stats.count .. " plugins in " .. stats.startuptime .. "ms"}
db.custom_center = {
    {icon = '  ',
    desc = 'Recent Files                            ',
    shortcut = 'spc f h',
    action ='Telescope oldfiles'},
    {icon = '  ',
    desc = 'Find Files                              ',
    action =  'Telescope find_files',
    shortcut = 'spc f f'},
    {icon = '漣 ',
    desc = 'Neovim Config                           ',
    action = 'Telescope find_files cwd=$HOME/.config/nvim',
    shortcut = 'spc f c'},
    {icon = '  ',
    desc = 'Quit                                    ',
    action =  ':q',
    shortcut = 'spc q q'},
}





--[[
vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_section = {
    a = {description = {'  Recent Files       spc f h'}, command = 'Telescope oldfiles'},
    b = {description = {'  Find File          spc f f'}, command = 'Telescope find_files'},
    c = {description = {'漣 Neovim Config      spc f c'}, command = 'Telescope find_files cwd=$HOME/.config/nvim'},
    d = {description = {'  Quit               spc q q'}, command = ':q'}
}

vim.cmd "let packages = len(globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))"
vim.api.nvim_exec(
]]--
-- [[
    -- let g:dashboard_custom_footer = ['packer loaded '..packages..' plugins']
-- ]],
-- false
-- )

--[[

vim.g.dashboard_custom_header =
-- {
-- '                                                  ',
-- '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠤⠴⠶⠶⠤⣄⣀⣀⣀⣀⡴⠛⡶⠦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⠴⢊⠕⠊⠉⠉⠉⠢⡘⠀⠀⠀⠀⠀⠀⠑⣔⣚⣣⡀⣀⠀⠀⠀⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⠴⠖⠋⠁⠀⠀⠻⣟⣋⣙⠻⠥⠞⠁⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⢳⠀⠀⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡴⠖⠛⠉⠀⢀⡔⠋⠉⡤⠤⠔⠒⠒⠒⠐⠚⠛⠛⠛⠛⠓⠒⠒⠲⠤⠤⠤⠤⠔⡲⠚⠀⠀⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⠀⠀⠀⣠⡴⠚⠉⠀⠀⠀⠀⠀⠈⠳⠦⠔⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⠀⢠⡞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡌⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⣼⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⣼⠁⠀⢀⣠⠤⠶⠶⠶⠶⠶⢤⡀⠀⠀⠀⠀⠀⢠⡘⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠤⠭⣲⡦⡴⢾⡟⠁⠀⠀⠀⠀',
-- '⠀⠀⠀⡇⠀⣼⠋⠀⠀⠀⠀⠀⠀⠀⠀⠈⢳⡀⠀⠀⠀⠀⠙⢦⣙⣄⣀⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⡏⠀⠀⠀⣿⡼⠲⠽⠆⠀⠀⠀⠀',
-- '⠀⠀⠰⡇⢰⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣳⠀⠀⠀⠀⠀⠀⣯⢬⠱⣟⠁⠀⠀⠀⠀⠀⠀⠀⣸⢤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠃⠀⠀⠀⠀⠀⠀⠁⠈⠓⠚⠀⠀⠀⠀⠀⠀⠀⣰⠃⠀⣳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠁⠸⣆⠀⠀⠀⠀⠀⠀⠐⠒⠻⠯⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⠾⠿⠭⠭⠴⠦⠤⠤⣤⠀⠀⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⠀⠈⠛⠓⠲⠶⢦⣄⠀⢠⣀⠚⢶⠺⠿⠶⠳⠶⠶⠶⠦⠦⠤⠴⠶⠶⠒⠋⠁⠉⠉⠙⠒⠒⠒⠲⠖⠚⠉⠀⠀⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⣈⣿⠛⠶⠷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                   ',
-- '                     big froge                    ',
-- '                                                  '
-- }
-- {
-- '  ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆        ',
-- '   ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦      ',
-- '         ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄    ',
-- '          ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀ ⠢⣀⡀⠈⠙⠿⠄   ',
-- '         ⢠⣿⣿⣿⠈   ⠈⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀  ',
-- '  ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄ ',
-- ' ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾   ',
-- '⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄ ',
-- '⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄',
-- '     ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆   ⠁',
-- '      ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃    ',
-- '                                 ',
-- '             hydra               '
-- }
--
]]--
