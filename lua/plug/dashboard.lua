vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_section = {
	a = {description = {'  File Browser       spc f b'}, command = 'Telescope file_browser'},
    b = {description = {'  Find File          spc f f'}, command = 'Telescope find_files'},
    d = {description = {'  Recent Files       spc f h'}, command = 'Telescope oldfiles'},
    e = {description = {'  Live Grep          spc f w'}, command = 'Telescope live_grep'},
    f = {description = {'漣 Neovim Config      spc f c'}, command = 'Telescope find_files cwd=/home/nytou/.config/nvim'},
    g = {description = {'  Quit               spc q q'}, command = ':q'}
}

vim.cmd "let packages = len(globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))"
vim.api.nvim_exec(
[[
    let g:dashboard_custom_footer = ['packer loaded '..packages..' plugins']
]],
false
)

vim.g.dashboard_custom_header =
{
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠤⠴⠶⠶⠤⣄⣀⣀⣀⣀⡴⠛⡶⠦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
 '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⠴⢊⠕⠊⠉⠉⠉⠢⡘⠀⠀⠀⠀⠀⠀⠑⣔⣚⣣⡀⣀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⠴⠖⠋⠁⠀⠀⠻⣟⣋⣙⠻⠥⠞⠁⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⢳⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡴⠖⠛⠉⠀⢀⡔⠋⠉⡤⠤⠔⠒⠒⠒⠐⠚⠛⠛⠛⠛⠓⠒⠒⠲⠤⠤⠤⠤⠔⡲⠚⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⣠⡴⠚⠉⠀⠀⠀⠀⠀⠈⠳⠦⠔⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⢠⡞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡌⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⣼⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⣼⠁⠀⢀⣠⠤⠶⠶⠶⠶⠶⢤⡀⠀⠀⠀⠀⠀⢠⡘⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠤⠭⣲⡦⡴⢾⡟⠁⠀⠀⠀⠀',
'⠀⠀⠀⡇⠀⣼⠋⠀⠀⠀⠀⠀⠀⠀⠀⠈⢳⡀⠀⠀⠀⠀⠙⢦⣙⣄⣀⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⡏⠀⠀⠀⣿⡼⠲⠽⠆⠀⠀⠀⠀',
'⠀⠀⠰⡇⢰⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣳⠀⠀⠀⠀⠀⠀⣯⢬⠱⣟⠁⠀⠀⠀⠀⠀⠀⠀⣸⢤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠃⠀⠀⠀⠀⠀⠀⠁⠈⠓⠚⠀⠀⠀⠀⠀⠀⠀⣰⠃⠀⣳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠁⠸⣆⠀⠀⠀⠀⠀⠀⠐⠒⠻⠯⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⠾⠿⠭⠭⠴⠦⠤⠤⣤⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠈⠛⠓⠲⠶⢦⣄⠀⢠⣀⠚⢶⠺⠿⠶⠳⠶⠶⠶⠦⠦⠤⠴⠶⠶⠒⠋⠁⠉⠉⠙⠒⠒⠒⠲⠖⠚⠉⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⣈⣿⠛⠶⠷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                   ',
'                     big froge                    '
}

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
