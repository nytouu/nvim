return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		enabled = true,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
                progress = {
                    enabled = false,
                    format = "lsp_progress",
                    format_done = "lsp_progress_done",
                    throttle = 1000 / 30, -- frequency to update lsp progress message
                    view = "mini",
                },
			},
			presets = { inc_rename = true },
			cmdline = {
				view = "cmdline_popup",
			},
			views = {
				cmdline_popup = {
					border = {
						style = "none",
						padding = { 1, 3 },
					},
					filter_options = {},
					win_options = {
						winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
					},
					position = {
						row = "97%",
						col = "50%",
					},
					size = {
						width = "98%",
					},
				},
			},
		},
	},
	{
		"rcarriga/nvim-notify",
		enabled = false,
		config = function()
			require("notify").setup({
				background_colour = "NotifyBackground",
				fps = 144,
				icons = {
					DEBUG = "",
					ERROR = "",
					INFO = "",
					TRACE = "✎",
					WARN = "",
				},
				level = 2,
				minimum_width = 50,
				render = "compact",
				stages = "slide",
				time_formats = {
					notification = "%T",
					notification_history = "%FT%T",
				},
				timeout = 5000,
				top_down = true,
			})
		end,
	},
}
