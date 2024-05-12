return {
	"nvimdev/galaxyline.nvim",
	enabled = true,
	event = "BufWinEnter",
	config = function()
		local gl = require("galaxyline")
		local gls = gl.section
		gl.short_line_list = { "NvimTree", "vista", "dbui", "packager", "toggleterm", "neo-tree", "Trouble" }

		local colors = {
			bg = '#34302c',
			dark_bg = '#34302c',
			fg = '#eadfd5',
            red = "#D47766",
            green = "#85B695",
            orange = "#EBC06D",
            blue = "#A3A9CE",
            magenta = "#CF9BC2",
            aqua = "#89B3B6",
        }

		local buffer_not_empty = function()
			if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
				return true
			end
			return false
		end

		local checkwidth = function()
			local squeeze_width = vim.fn.winwidth(0) / 2
			if squeeze_width > 40 then
				return true
			end
			return false
		end

		gls.left[0] = {
			ViMode = {
				provider = function()
					-- auto change color according the vim mode
					local mode = {
						n = "normal",
						i = "insert",
						v = "visual",
						[""] = "visual block",
						V = "visual line",
						c = "command",
						no = "pending",
						s = "select",
						S = "select lines",
						[""] = "select block",
						ic = "insert",
						R = "replace",
						Rv = "virtual replace",
						cv = "ex mode",
						ce = "command editing",
						r = "replace",
						rm = "more",
						["r?"] = "confirm",
						["!"] = "shell",
						t = "terminal",
					}
					local color = {
						n = colors.green,
						i = colors.aqua,
						v = colors.blue,
						[""] = colors.blue,
						V = colors.blue,
						c = colors.red,
						no = colors.red,
						s = colors.blue,
						S = colors.blue,
						[""] = colors.blue,
						ic = colors.aqua,
						R = colors.magenta,
						Rv = colors.magenta,
						cv = colors.red,
						ce = colors.red,
						r = colors.red,
						rm = colors.aqua,
						["r?"] = colors.aqua,
						["!"] = colors.orange,
						t = colors.orange,
					}
                    vim.api.nvim_command("hi GalaxyViMode guibg=" .. color[vim.fn.mode()] .. " guifg=" .. colors.bg)
					return "  " .. mode[vim.fn.mode()] .. " "
				end,
				separator = " ",
				separator_highlight = { colors.fg, colors.dark_bg },
				highlight = { colors.fg, colors.dark_bg },
			},
		}

		gls.left[1] = {
			FilePath = {
				provider = { "FilePath" },
				separator = " ",
				condition = buffer_not_empty,
				separator_highlight = { "NONE", colors.dark_bg },
				highlight = { colors.fg, colors.dark_bg, "bold" },
			},
		}

		gls.right[2] = {
			GitBranch = {
				provider = "GitBranch",
				separator = " ",
				separator_highlight = { "NONE", colors.dark_bg },
				condition = require("galaxyline.condition").check_git_workspace,
				highlight = { colors.fg, colors.dark_bg, "bold" },
			},
		}

		gls.left[3] = {
			DiffAdd = {
				provider = "DiffAdd",
				icon = "+",
				highlight = { colors.green, colors.dark_bg },
			},
		}

		gls.left[4] = {
			DiffModified = {
				provider = "DiffModified",
				icon = "~",
				highlight = { colors.orange, colors.dark_bg },
			},
		}
		gls.left[5] = {
			DiffRemove = {
				provider = "DiffRemove",
				separator_highlight = { "NONE", colors.dark_bg },
				icon = "-",
				highlight = { colors.red, colors.dark_bg },
			},
		}

		gls.right[0] = {
			DiagnosticError = {
				separator_highlight = { "NONE", colors.dark_bg },
				provider = "DiagnosticError",
				condition = checkwidth,
				icon = " : ",
				highlight = { colors.red, colors.dark_bg },
			},
		}

		gls.right[1] = {
			DiagnosticWarn = {
				provider = "DiagnosticWarn",
				condition = checkwidth,
				icon = " : ",
				highlight = { colors.orange, colors.dark_bg },
			},
		}

		gls.right[2] = {
			DiagnosticHint = {
				provider = "DiagnosticHint",
				condition = checkwidth,
				icon = " : ",
				highlight = { colors.blue, colors.dark_bg },
			},
		}

		gls.right[3] = {
			DiagnosticInfo = {
				provider = "DiagnosticInfo",
				condition = checkwidth,
				icon = " : ",
				highlight = { colors.aqua, colors.dark_bg },
			},
		}

        gls.right[4] = {
            FileIcon = {
                provider = function()
                    local fname, ext = vim.fn.expand("%:t"), vim.fn.expand("%:e")
                    local icon, iconhl = require("nvim-web-devicons").get_icon(fname, ext)
                    if icon == nil then
                        return ""
                    end
                    local fg = vim.fn.synIDattr(vim.fn.hlID(iconhl), "fg")
                    vim.api.nvim_command("hi GalaxyFileIcon guibg=" .. colors.bg .. " guifg=" .. fg)
                    return "   " .. icon
                end,
                condition = buffer_not_empty,
            },
        }

		gls.right[5] = {
			FileType = {
				separator = "  ",
				separator_highlight = { "NONE", colors.dark_bg },
				provider = function()
					if not buffer_not_empty() then
						return ""
					end
					return vim.bo.filetype
				end,
				condition = buffer_not_empty,
				highlight = { colors.fg, colors.dark_bg },
			},
		}

		gls.right[6] = {
			LineInfo = {
				provider = "LineColumn",
				condition = checkwidth,
				separator = "   ",
				separator_highlight = { "NONE", colors.dark_bg },
				highlight = { colors.fg, colors.dark_bg },
			},
		}
		gls.right[7] = {
			PerCent = {
				provider = "LinePercent",
				conditon = checkwidth,
				separator = "   ",
				separator_highlight = { "NONE", colors.dark_bg },
				highlight = { colors.fg, colors.dark_bg, "bold" },
			},
		}

		gls.short_line_left[0] = {
			LeftIcon = {
				provider = function()
					return ""
					-- return "▊ "
				end,
				highlight = { colors.fg, colors.bg },
			},
		}
	end,
}
