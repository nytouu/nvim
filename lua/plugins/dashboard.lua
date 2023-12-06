return {
	{
		"nvimdev/dashboard-nvim",
		enabled = true,
		config = function()

			local stats = require("lazy").stats()

			require("dashboard").setup({
				theme = "doom",
				config = {
					header = {
						"                                 ",
						"                                 ",
						"                                 ",
						"                                 ",
						"  ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆        ",
						"   ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦      ",
						"         ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄    ",
						"          ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀ ⠢⣀⡀⠈⠙⠿⠄   ",
						"         ⢠⣿⣿⣿⠈   ⠈⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀  ",
						"  ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄ ",
						" ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾   ",
						"⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄ ",
						"⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄",
						"     ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆   ⠁",
						"      ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃    ",
						"                                 ",
						"                                 ",
						"                                 ",
						"                                 ",
					},
					center = {
						{
							icon = "  ",
							desc = "Find Files                              ",
							key = "spc f f",
							action = "Telescope find_files",
							icon_hl = 'Title',
							desc_hl = 'String',
							key_hl = 'Number',
						},
						{
							icon = "  ",
							desc = "Find Word                              ",
							key = "spc f w",
							action = "Telescope live_grep",
							icon_hl = 'Title',
							desc_hl = 'String',
							key_hl = 'Number',
						},
						{
							icon = "  ",
							desc = "Recent Files                            ",
							key = "spc f r",
							action = "Telescope oldfiles",
							icon_hl = 'Title',
							desc_hl = 'String',
							key_hl = 'Number',
						},
						{
							icon = "󰢻  ",
							desc = "Neovim Config                           ",
							key = "spc f c",
							action = "Telescope find_files cwd=$HOME/.config/nvim",
							icon_hl = 'Title',
							desc_hl = 'String',
							key_hl = 'Number',
						},
						{
							icon = "  ",
							desc = "Quit                                    ",
							key = "spc q q",
							action = ":q",
							icon_hl = 'Title',
							desc_hl = 'String',
							key_hl = 'Number',
						},
					},
					footer = {
						"",
						" " .. os.date('%Y-%m-%d'),
						" " .. os.date('%H:%M'),
						"",
						"lazy loaded " .. stats.count .. " plugins" ,
					},
				},
			})
			local hi = vim.api.nvim_set_hl

			hi(0, "DashboardHeader", {fg = "#ca98a3"})
			hi(0, "DashboardFooter", {fg = "#c4995b"})
		end,
		event = "VimEnter",
	},
}
