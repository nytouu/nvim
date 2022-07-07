local db = require('dashboard')
local count = #vim.tbl_keys(packer_plugins)

db.preview_file_height = 12
db.preview_file_width = 80
db.hide_statusline = false
db.hide_tabline = false
db.custom_header =
{
'                                            ',
'                                            ',
'                     @hpp                   ',
'                     "KKP                   ',
'           ,      ,+;n@nnw,    ,,           ',
'        ,||ppKN|||p##KKNpp|LKp!L@|IN,       ',
'      ;L##KKPL|$#KKM"````"TE|IKm`"K@LKp     ',
'    ||#KKM` ||#KKP .*||hw,  T|I#N   T||Km   ',
'   ||$#K`   |I#KP | |||$##N  @I#KH   ||$#N  ',
'   "|I8N    |I#Kb Y@@p##KBKP |I#KN  ,@$#KM  ',
'     TPLKm, Y|I8N  "KKKKKK* ||##KL,@$#KKP   ',
'       "Kp@bp$p@LKp,     .||p##KH@p#KK*     ',
'    U@#Kp`*KKK*Tb@@I#m |.{#KKKM*KKKPT@#Kp   ',
'     `*"         `PK#K HI#KM`        `**`   ',
'                  IK#K $K#B                 ',
'          ,Kpp    I#BB IhKKp   p#p,         ',
'          "KKKKmp##KKK TKKKKp##KKKM         ',
'            `TKKKKKKP`  `*KKKKKKM`          ',
'                                            ',
'                                            '
}

db.custom_footer = { "packer loaded " .. count .. " plugins" }
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
