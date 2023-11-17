return {
    "nvimdev/galaxyline.nvim",
	enabled = true,
    event = "BufWinEnter",
    config = function  ()

        local gl = require('galaxyline')
        local gls = gl.section
        gl.short_line_list = {'NvimTree','vista','dbui','packager','toggleterm','neo-tree'}

        local colors = {
            bg = '#0d0e0f',
            dark_bg = '#171a1a',
            fg = '#ebdbb2',
            dark_fg = '#665c54',
            yellow = '#fabd2f',
            cyan = '#458588',
            green = '#689d6a',
            orange = '#d65d0e',
            magenta = '#b16286',
            blue = '#458588',
            red = '#cc241d'
        }

        local icons = {
            error = " 󰅚 ",
            warn = "  ",
            info = "  ",
            hint = " 󰌶 ",
            git = " 󰊢 ",
            gitadd = "  ",
            gitdel = "  ",
            gitmod = "  ",
            cog    = " 󰢻 "
        }

        local buffer_not_empty = function()
            if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
                return true
            end
            return false
        end

        local function highlight(group, fg, bg, gui)
            local comd = string.format("highlight %s guifg=%s guibg=%s", group, fg, bg)
            if gui ~= nil then
                comd = comd .. " gui=" .. gui
            end
            vim.cmd(comd)
        end

        local checkwidth = function()
            local squeeze_width = vim.fn.winwidth(0) / 2
            if squeeze_width > 40 then
                return true
            end
            return false
        end

        gls.left[1] = {
            ViMode = {
                provider = function()
                    -- auto change color according the vim mode
                    local mode_color = {
                        n = colors.blue,
                        i = colors.green,
                        v = colors.yellow,
                        [""] = colors.yellow,
                        V = colors.yellow,
                        c = colors.red,
                        no = colors.magenta,
                        s = colors.orange,
                        S = colors.orange,
                        [""] = colors.orange,
                        ic = colors.yellow,
                        R = colors.red,
                        Rv = colors.red,
                        cv = colors.orange,
                        ce = colors.orange,
                        r = colors.red,
                        rm = colors.cyan,
                        ["r?"] = colors.cyan,
                        ["!"] = colors.red,
                        t = colors.blue,
                    }
                    vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim.fn.mode()])
                    return "▊ 󰪥  "
                end,
                highlight = { colors.red, colors.bg, "bold" },
            },
        }

        gls.left[2] = {
            LineNr = {
                provider = function()
                    local total_line = vim.fn.line("$")
                    return total_line
                end,
                separator = " ",
                separator_highlight = { "NONE", colors.bg },
                condition = buffer_not_empty,
                highlight = { colors.fg, colors.bg },
            },
        }

        gls.left[3] = {
            FileIcon = {
                provider = function()
                    local fname, ext = vim.fn.expand("%:t"), vim.fn.expand("%:e")
                    local icon, iconhl = require("nvim-web-devicons").get_icon(fname, ext)
                    if icon == nil then
                        return ""
                    end
                    local fg = vim.fn.synIDattr(vim.fn.hlID(iconhl), "fg")
                    highlight("GalaxyFileIcon", fg, colors.bg)
                    return " " .. icon .. "  "
                end,
                condition = buffer_not_empty,
            },
        }

        gls.left[4] = {
            FileName = {
                provider = { "FileName" },
                separator = "",
                condition = buffer_not_empty,
                separator_highlight = { "NONE", colors.bg },
                highlight = { colors.green, colors.bg, "bold" },
            },
        }

        gls.left[5] = {
            LineInfo = {
                provider = "LineColumn",
                condition = checkwidth,
                separator = " ",
                separator_highlight = { "NONE", colors.bg },
                highlight = { colors.dark_fg, colors.bg },
            },
        }
        gls.left[6] = {
            PerCent = {
                provider = "LinePercent",
                conditon = checkwidth,
                separator = " ",
                separator_highlight = { "NONE", colors.bg },
                highlight = { colors.dark_fg, colors.bg, "bold" },
            },
        }

        gls.left[7] = {
            DiffAdd = {
                provider = "DiffAdd",
                icon = icons.gitadd,
                highlight = { colors.green, colors.bg },
            },
        }

        gls.left[8] = {
            DiffModified = {
                provider = "DiffModified",
                icon = icons.gitmod,
                highlight = { colors.orange, colors.bg },
            },
        }
        gls.left[9] = {
            DiffRemove = {
                provider = "DiffRemove",
                separator_highlight = { "NONE", colors.bg },
                icon = icons.gitdel,
                highlight = { colors.red, colors.bg },
            },
        }

        gls.right[0] = {
            DiagnosticError = {
                separator_highlight = { "NONE", colors.bg },
                provider = "DiagnosticError",
                condition = checkwidth,
                icon = icons.error,
                highlight = { colors.red, colors.bg },
            },
        }

        gls.right[1] = {
            DiagnosticWarn = {
                provider = "DiagnosticWarn",
                condition = checkwidth,
                icon = icons.warn,
                highlight = { colors.yellow, colors.bg },
            },
        }

        gls.right[2] = {
            DiagnosticHint = {
                provider = "DiagnosticHint",
                condition = checkwidth,
                icon = icons.hint,
                highlight = { colors.cyan, colors.bg },
            },
        }

        gls.right[3] = {
            DiagnosticInfo = {
                provider = "DiagnosticInfo",
                condition = checkwidth,
                icon = icons.info,
                highlight = { colors.blue, colors.bg },
            },
        }

        gls.right[4] = {
            GetLspClient = {
                provider = "GetLspClient",
                icon = icons.cog,
                highlight = { colors.dark_fg, colors.bg },
            },
        }

        gls.right[5] = {
            FileType = {
                separator = " ",
                separator_highlight = { "NONE", colors.bg },
                provider = function()
                    if not buffer_not_empty() then
                        return ""
                    end
                    return "  " .. vim.bo.filetype
                end,
                condition = buffer_not_empty,
                highlight = { colors.cyan, colors.bg },
            },
        }

        gls.right[6] = {
            FileEncode = {
                provider = "FileEncode",
                separator = " ",
                separator_highlight = { "NONE", colors.bg },
                highlight = { colors.fg, colors.bg, "bold" },
            },
        }

        gls.right[7] = {
            GitIcon = {
                provider = function()
                    return icons.git
                end,
                separator = " ",
                separator_highlight = { "NONE", colors.bg },
                condition = require("galaxyline.condition").check_git_workspace,
                highlight = { colors.orange, colors.bg, "bold" },
            },
        }

        gls.right[8] = {
            GitBranch = {
                provider = "GitBranch",
                separator = " ",
                separator_highlight = { "NONE", colors.bg },
                condition = require("galaxyline.condition").check_git_workspace,
                highlight = { colors.fg, colors.bg, "bold" },
            },
        }

        gls.right[9] = {
            ViMode2 = {
                provider = function()
                    return " ▊"
                end,
                separator = " ",
                separator_highlight = { "NONE", colors.bg },
                highlight = "GalaxyViMode",
            },
        }
        gls.short_line_left[0] = {
            LeftIcon = {
                provider = function()
                    return ""
                    -- return "▊ "
                end,
                highlight = { colors.blue, colors.dark_bg },
            },
        }

        -- gls.short_line_left[2] = {
        --     BufferType = {
        --         provider = "FileTypeName",
        --         separator = " ",
        --         separator_highlight = { "NONE", colors.dark_bg },
        --         highlight = { colors.blue, colors.dark_bg, "bold" },
        --     },
        -- }

        -- gls.short_line_left[3] = {
        -- 	FileName = {
        -- 		condition = buffer_not_empty,
        -- 		provider = function ()
        -- 		local fileinfo = require('galaxyline.provider.fileinfo')
        -- 		local fname = fileinfo.get_current_file_name()
        -- 		for _,v in ipairs(gl.short_line_list) do
        -- 			if v == vim.bo.filetype then
        -- 				return ''
        -- 			end
        -- 		end
        -- 		return fname
        -- 		end,
        -- 		highlight = {colors.white,colors.dark_bg,'bold'}
        -- 	}
        -- }
    end
}
