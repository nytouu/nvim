return {
	"echasnovski/mini.starter",
	lazy = false,
	config = true,
	opts = {
		header = "⚡ Neovim",
		footer = "",
		items = {
			{ name = "f Find files",      action = ":Telescope find_files", section = "" },
			{ name = "w Find word",       action = ":Telescope live_grep",  section = "" },
			{ name = "r Recent files",    action = ":Telescope oldfiles",   section = "" },
			{ name = "s Recent sessions", action = ":Telescope persisted",  section = "" },
			{
				name = "n Open notes",
				action = function()
					vim.cmd("cd ~/notes/airavata")

					require("neorg").setup()
					vim.cmd("Neorg workspace airavata")
				end,
				section = ""
			},
			{ name = "q Quit", action = ":qa!", section = "" },
		},
	},
}
