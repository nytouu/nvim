-- OLD STATUS LINE
vim.cmd [[packadd galaxyline.nvim]]
local fileinfo = require 'galaxyline.provider_fileinfo'
local devicons = require 'nvim-web-devicons'
local condition = require('galaxyline.condition')
local gl = require('galaxyline')

local gls = gl.section
gl.short_line_list = {'packager', 'NvimTree', 'dbui', 'vista'}

local colors = {
    -- bg = '#1a1b26',
    -- bg = '#1d202f',
    bg = '#1f2335',
    fg = '#c0caf5',
    red = '#f7768e',
    green = '#9ece6a',
    orange = '#e0af68',
    blue = '#7aa2f7',
    purple = '#bb9af2',
    cyan = '#7dcfff',
    yellow = '#ffe771'
}

local mode_map = {
    ['n'] = {'normal', colors.blue},
    ['i'] = {'insert', colors.cyan},
    ['R'] = {'replace', colors.red},
    ['v'] = {'visual', colors.yellow},
    ['V'] = {'vline', colors.yellow},
    ['c'] = {'command', colors.green},
    ['s'] = {'select', colors.orange},
    ['S'] = {'sline', colors.orange},
    ['t'] = {'terminal', colors.blue},
    [''] = {'vblock', colors.yellow},
    [''] = {'sblock', colors.yellow},
    ['Rv'] = {'virtual'},
    ['rm'] = {'--more'}
}

local sep = {
    rightfull   = '▐',
    right       = '▕',
    leftfull    = '▌',
    left        = '▏'
    -- rightfull   = '',
    -- right       = '',
    -- leftfull    = '',
    -- left        = ''
}

local icons = {
    locked      = '',
    unsaved     = '',
    info        = '',
    warn        = '',
    err         = '',
    git         = '',
    gitadd      = '',
    gitdel      = '',
    gitmod      = '柳'
}


local function mode_label() return mode_map[vim.fn.mode()][1] or 'N/A' end
local function mode_hl() return mode_map[vim.fn.mode()][2] or colors.bg end

local function highlight(group, fg, bg, gui)
    local comd = string.format('highlight %s guifg=%s guibg=%s', group, fg, bg)
    if gui ~= nil then comd = comd .. ' gui=' .. gui end
    vim.cmd(comd)
end

local function buffer_not_empty()
    if vim.fn.empty(vim.fn.expand '%:t') ~= 1 then return true end
    return false
end

local function wide_enough()
    local squeeze_width = vim.fn.winwidth(0)
    if squeeze_width > 80 then return true end
    return false
end


gls.left[1] =
{
    ViMode = {
        provider = function()
            local modehl = mode_hl()
            highlight('GalaxyViMode', colors.bg, modehl, 'bold')
            highlight('GalaxyViModeInv', modehl, colors.bg, 'bold')
            return string.format('  %s ', mode_label())
        end,
        separator = sep.leftfull,
        separator_highlight = 'GalaxyViModeInv',
    }
}
gls.left[2] =
{
    FileIcon = {
        provider = function()
            local fname, ext = vim.fn.expand '%:t', vim.fn.expand '%:e'
            local icon, iconhl = devicons.get_icon(fname, ext)
            if icon == nil then return '' end
            local fg = vim.fn.synIDattr(vim.fn.hlID(iconhl), 'fg')
            highlight('GalaxyFileIcon', fg, colors.bg)
            return ' ' .. icon .. ' '
        end,
        condition = buffer_not_empty
    }
}
gls.left[3] =
{
    FileName = {
        provider = function()
            if not buffer_not_empty() then return '' end
            local fname
            if wide_enough() then
                fname = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.')
            else
                fname = vim.fn.expand '%:t'
            end
            if #fname == 0 then return '' end
            if vim.bo.readonly then
                fname = fname .. ' ' .. icons.locked
            end
            if vim.bo.modified then
                fname = fname .. ' ' .. icons.unsaved
            end
            return ' ' .. fname .. ' '
        end,
        highlight = {colors.fg, colors.bg},
        separator = sep.left,
        separator_highlight = 'GalaxyViModeInv'
    }
}
gls.left[4] = {
    GitIcon = {
        provider = function()
            return ' ' .. icons.git
        end,
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.orange, colors.bg}
    }
}
gls.left[5] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.fg, colors.bg}
    }
}
gls.left[6] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = condition.hide_in_width,
        icon = icons.gitadd,
        highlight = {colors.green, colors.bg}
    }
}
gls.left[7] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = condition.hide_in_width,
        icon = icons.gitmod,
        highlight = {colors.blue, colors.bg}
    }
}
gls.left[8] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = condition.hide_in_width,
        icon = icons.gitdel,
        highlight = {colors.red, colors.bg}
    }
}


gls.right[1] =
{
    DiagnosticWarn = {
        provider = function()
            local n = vim.lsp.diagnostic.get_count(0, 'Warning')
            if n == 0 then return '' end
            return string.format(' %s %d ', icons.warn, n)
        end,
        highlight = {colors.yellow, colors.bg},
        separator = sep.right,
        separator_highlight = 'GalaxyViModeInv'
    }
}
gls.right[2] =
{
    DiagnosticError = {
        provider = function()
            local n = vim.lsp.diagnostic.get_count(0, 'Error')
            if n == 0 then return '' end
            return string.format(' %s %d ', icons.err, n)
        end,
        highlight = {colors.red, colors.bg}
    }
}
gls.right[3] =
{
    FileType = {
        provider = function()
            if not buffer_not_empty() then return '' end
            return ' ' .. vim.bo.filetype .. ' '
        end,
        condition = buffer_not_empty,
        highlight = {colors.fg, colors.bg},
        separator = sep.right,
        separator_highlight = 'GalaxyViModeInv'
    }
}
gls.right[4] =
{
    FileIcon = {
        provider = function()
            local fname, ext = vim.fn.expand '%:t', vim.fn.expand '%:e'
            local icon, iconhl = devicons.get_icon(fname, ext)
            if icon == nil then return '' end
            local fg = vim.fn.synIDattr(vim.fn.hlID(iconhl), 'fg')
            highlight('GalaxyFileIcon', fg, colors.bg)
            return ' ' .. icon .. ' '
        end,
        condition = buffer_not_empty
    }
}
gls.right[5] =
{
    PositionInfo = {
        provider = {
            function()
                return string.format(
                  '%s:%s', vim.fn.line('.'), vim.fn.col('.')
                )
            end
        },
        highlight = 'GalaxyViMode',
        condition = buffer_not_empty,
        separator = sep.rightfull,
        separator_highlight = 'GalaxyViModeInv'
    }
}
gls.right[6] =
{
    PercentInfo = {
        provider = fileinfo.current_line_percent,
        highlight = 'GalaxyViMode',
        condition = buffer_not_empty,
        separator = sep.right,
        separator_highlight = 'GalaxyViMode'
    }
}


for k, v in pairs(gls.left) do gls.short_line_left[k] = v end
table.remove(gls.short_line_left, 1)

for k, v in pairs(gls.right) do gls.short_line_right[k] = v end
table.remove(gls.short_line_right)
table.remove(gls.short_line_right)

gl.load_galaxyline()
