return {
	"nvimdev/galaxyline.nvim",
	enabled = true,
	event = "BufWinEnter",
	config = function  ()

		local gl = require('galaxyline')
		local gls = gl.section
		gl.short_line_list = { 'NvimTree', 'vista', 'dbui', 'packager', 'toggleterm', 'neo-tree', 'Trouble' }

		local colors = {
			bg = '#34302c',
			dark_bg = '#34302c',
			fg = '#eadfd5',
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
					return "  " .. vim.fn.mode()
				end,
				separator = " |",
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
				highlight = { colors.fg, colors.dark_bg },
			},
		}

		gls.left[4] = {
			DiffModified = {
				provider = "DiffModified",
				icon = "~",
				highlight = { colors.fg, colors.dark_bg },
			},
		}
		gls.left[5] = {
			DiffRemove = {
				provider = "DiffRemove",
				separator_highlight = { "NONE", colors.dark_bg },
				icon = "-",
				highlight = { colors.fg, colors.dark_bg },
			},
		}

		gls.right[0] = {
			DiagnosticError = {
				separator_highlight = { "NONE", colors.dark_bg },
				provider = "DiagnosticError",
				condition = checkwidth,
				icon = "e: ",
				highlight = { colors.fg, colors.dark_bg },
			},
		}

		gls.right[1] = {
			DiagnosticWarn = {
				provider = "DiagnosticWarn",
				condition = checkwidth,
				icon = "w: ",
				highlight = { colors.fg, colors.dark_bg },
			},
		}

		gls.right[2] = {
			DiagnosticHint = {
				provider = "DiagnosticHint",
				condition = checkwidth,
				icon = "h: ",
				highlight = { colors.fg, colors.dark_bg },
			},
		}

		gls.right[3] = {
			DiagnosticInfo = {
				provider = "DiagnosticInfo",
				condition = checkwidth,
				icon = "i: ",
				highlight = { colors.fg, colors.dark_bg },
			},
		}

		gls.right[4] = {
			FileType = {
				separator = "   ",
				separator_highlight = { "NONE", colors.dark_bg },
				provider = function()
					if not buffer_not_empty() then
						return ""
					end
					return "[" .. vim.bo.filetype .. "]"
				end,
				condition = buffer_not_empty,
				highlight = { colors.fg, colors.dark_bg },
			},
		}

		gls.right[5] = {
			LineInfo = {
				provider = "LineColumn",
				condition = checkwidth,
				separator = "   ",
				separator_highlight = { "NONE", colors.dark_bg },
				highlight = { colors.fg, colors.dark_bg },
			},
		}
		gls.right[6] = {
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
	end
}
