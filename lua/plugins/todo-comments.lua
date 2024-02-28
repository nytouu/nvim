return {
	"folke/todo-comments.nvim",
	enabled = false,
    event = { "BufEnter" },
	opts = {
		signs = true,
		sign_priority = 4,
		keywords = {
			FIX = {
				icon = " ",
				color = "error",
				alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
			},
			TODO = { icon = " ", color = "info", alt = { "todo" } },
			HACK = { icon = " ", color = "warning" },
			WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
			PERF = { icon = "󰅒 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = "󰍨 ", color = "hint", alt = { "INFO" } },
			TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
		},
        highlight = {
            comments_only = true,
            pattern = {
                [[.*<(KEYWORDS)\s*:]],
                [[.*<(KEYWORDS)\s*!]]
            }
        },
		search = {
			command = "rg",
			args = {
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
			}
		}
	},
	keys  = {
		{ "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todos" },
	},
}
