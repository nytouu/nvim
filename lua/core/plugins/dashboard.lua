return {
	{
		"nvimdev/dashboard-nvim",
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
                        },
                        {
                            icon = "  ",
                            desc = "Find Word                              ",
                            key = "spc f w",
                            action = "Telescope live_grep",
                        },
                        {
                            icon = "  ",
                            desc = "Recent Files                            ",
                            key = "spc f r",
                            action = "Telescope oldfiles",
                        },
                        {
                            icon = "󰢻  ",
                            desc = "Neovim Config                           ",
                            key = "spc f c",
                            action = "Telescope find_files cwd=$HOME/.config/nvim",
                        },
                        {
                            icon = "  ",
                            desc = "Quit                                    ",
                            key = "spc q q",
                            action = ":q",
                        },
                    },
                    footer = { "lazy loaded " .. stats.count .. " plugins" },
                },
            })
		end,
		event = "VimEnter",
	},
}
