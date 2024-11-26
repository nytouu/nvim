return {
	"folke/snacks.nvim",
	priority = 1000,
	enabled = true,
	lazy = false,
	opts = {
		styles = {
			notification = {
				border = "solid",
				zindex = 100,
				ft = "markdown",
				wo = {
					winblend = 5,
					wrap = false,
				},
				bo = { filetype = "snacks_notif" },
			}
		},
		bigfile = { enabled = true },
		notifier = {
			enabled = false,
			timeout = 3000,
			width = { min = 40, max = 0.4 },
			height = { min = 1, max = 0.6 },
			margin = { top = 0, right = 1, bottom = 0 },
			padding = true,
			sort = { "level", "added" },
			icons = {
				error = " ",
				warn = " ",
				info = " ",
				debug = " ",
				trace = " ",
			},
			style = "compact",
			top_down = true,
		},
		lazygit = {
			configure = true,
			config = {
				os = { editPreset = "nvim-remote" },
				gui = { nerdFontsVersion = "3" },
			},
			theme_path = vim.fs.normalize(vim.fn.stdpath("cache") .. "/lazygit-theme.yml"),
			theme = {
				[241]                      = { fg = "Special" },
				activeBorderColor          = { fg = "MatchParen", bold = true },
				cherryPickedCommitBgColor  = { fg = "Identifier" },
				cherryPickedCommitFgColor  = { fg = "Function" },
				defaultFgColor             = { fg = "Normal" },
				inactiveBorderColor        = { fg = "FloatBorder" },
				optionsTextColor           = { fg = "Function" },
				searchingActiveBorderColor = { fg = "MatchParen", bold = true },
				selectedLineBgColor        = { bg = "Visual" }, -- set to `default` to have no background colour
				unstagedChangesColor       = { fg = "DiagnosticError" },
			},
			win = {
				style = "lazygit",
			},
		},
		quickfile = { enabled = true },
		statuscolumn = { enabled = false },
		words = { enabled = false },
	},
	keys = {
		{ "<leader>gg", function() Snacks.lazygit() end, desc = "Open Lazygit window" },
		{ "<leader>go", function() Snacks.gitbrowse() end, desc = "Open git repo in browser" },
	}
}
