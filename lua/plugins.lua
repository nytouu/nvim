return {
	-- Lua stuff
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-lua/popup.nvim" },
	{ "folke/neodev.nvim" },

	-- LSP
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("config.plugins.lsp")
		end,
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("config.plugins.lsp-saga")
		end,
		event = "LspAttach",
	},
	{
		"mhartington/formatter.nvim",
		config = function()
			require("config.plugins.formatter")
		end,
		event = "LspAttach",
	},
	{
		"VidocqH/lsp-lens.nvim",
		config = function ()
			require("lsp-lens").setup()
		end,
		event = "BufRead"
	},
	{
		"lvimuser/lsp-inlayhints.nvim",
		config = function ()
			require("lsp-inlayhints").setup()
		end,
		event = "LspAttach"
	},

	-- Completion stuff
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("config.plugins.cmp")
		end,
		dependencies = {
			"windwp/nvim-autopairs",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"tamago324/cmp-zsh",
			"hrsh7th/cmp-cmdline",
			"lukas-reineke/cmp-rg",
			"onsails/lspkind.nvim"
		},
		event = "InsertEnter",
    },
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("config.plugins.snippets")
		end,
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		event = "InsertEnter",
	},

	-- Colors
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("config.plugins.colorizer")
		end,
		event = "BufRead",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("config.plugins.treesitter")
		end,
		event = "VeryLazy",
		build = ":TSUpdate",
	},

	-- Colorschemes
	{
		"shaunsingh/oxocarbon.nvim",
		-- "folke/tokyonight.nvim",
		"catppuccin/nvim",
		"Yazeed1s/minimal.nvim",
		"projekt0n/github-nvim-theme"
	},

	-- UI stuff
	{
		"folke/noice.nvim",
		config = function()
			require("config.plugins.noice")
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		event = "BufWinEnter",
	},
	{
		"vigoux/notifier.nvim",
		config = function()
			require("config.plugins.notify")
		end,
	},
	{
		"sitiom/nvim-numbertoggle",
		event = "BufWinEnter",
	},
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("config.plugins.telescope")
		end,
		cmd = "Telescope",
	},
	{
		"dominikduda/vim_current_word",
		event = "BufEnter",
	},
	{
		"nvimdev/dashboard-nvim",
		config = function()
			require("config.plugins.dashboard")
		end,
		event = "VimEnter",
	},
	{
		"akinsho/bufferline.nvim",
		config = function()
			require("config.plugins.bufferline")
		end,
		event = "BufWinEnter",
	},
	{
		"NTBBloodbath/galaxyline.nvim",
		config = function()
			require("config.plugins.galaxyline")
		end,
		event = "BufWinEnter",
	},
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("config.plugins.toggleterm")
		end,
		cmd = "ToggleTerm",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("config.plugins.git")
		end,
		event = "BufReadPre",
	},
    
	-- {
	-- 	"xiyaowong/nvim-transparent",
	-- 	config = function()
	-- 		require("config.plugins.transparent")
	-- 	end,
	-- 	event = "VimEnter",
	-- },
	{
		"Bekaboo/deadcolumn.nvim",
		config = function()
			require("config.plugins.column")
		end,
		event = "BufEnter",
	},

	-- Icons
	{
		"yamatsum/nvim-nonicons",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-nonicons").setup({})
		end,
	},

	-- File explorer
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("config.plugins.nvim-tree")
		end,
		cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeOpen" },
	},

	-- Markdown
	-- {
	-- 	"jbyuki/venn.nvim",
	-- 	ft = { "md", "markdown" },
	-- },
	-- {
	-- 	"NFrid/due.nvim",
	-- 	config = function()
	-- 		require("due_nvim").setup()
	-- 	end,
	-- 	ft = { "md", "markdown" },
	-- },
	-- {
	-- 	"jakewvincent/mkdnflow.nvim",
	-- 	config = function()
	-- 		require("mkdnflow").setup()
	-- 	end,
	-- 	ft = { "md", "markdown" },
	-- },
	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	build = "cd app && npm install",
	-- 	ft = { "md", "markdown" },
	-- },

	-- Quality of life stuff
	-- {
	-- 	"mg979/vim-visual-multi",
	-- 	event = "VeryLazy"
	-- },
	{
		"famiu/bufdelete.nvim",
		cmd = "Bdelete",
	},
	{
		"folke/which-key.nvim",
		config = function()
			require("config.plugins.which-key")
		end,
		event = "VeryLazy",
	},
	{
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup()
		end,
		event = "VeryLazy",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("config.plugins.indent")
		end,
		event = "BufReadPre",
	},
	{
		"simrat39/rust-tools.nvim",
		dependencies = { "Saecki/crates.nvim" },
		config = function()
			require("config.plugins.rust")
		end,
		ft = { "rs", "rust", "toml" },
	},

	-- cool stuff
	{
		"ray-x/web-tools.nvim",
		config = function()
			require("web-tools").setup({
				keymaps = {
					rename = nil,
					repeat_rename = ".",
				},
			})
		end,
		ft = { "html", "js", "javascript" },
	},
	-- {
	-- 	"folke/trouble.nvim",
	-- 	config = function()
	-- 		require("config.plugins.lsp-trouble")
	-- 	end,
	-- 	cmd = { "TroubleToggle", "Trouble" },
	-- },
	{
		"monaqa/dial.nvim",
		event = "BufEnter",
	},
	-- {
	-- 	"phaazon/hop.nvim",
	-- 	config = function()
	-- 		require("config.plugins.hop")
	-- 	end,
	-- 	cmd = { "HopWord", "HopChar2", "HopLine" },
	-- },
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
	},
	-- {
	-- 	"andweeb/presence.nvim",
	-- 	config = function()
	-- 		require("config.plugins.discord")
	-- 	end,
	-- 	event = "VeryLazy",
	-- },
	-- {
	-- 	"axieax/urlview.nvim",
	-- 	config = function()
	-- 		require("urlview").setup()
	-- 	end,
	-- 	cmd = "UrlView",
	-- },
	{
		"utilyre/sentiment.nvim",
		version = "*",
		config = function()
			require("sentiment").setup()
		end,
		event = "InsertEnter",
	},
	{
		"ThePrimeagen/vim-be-good",
		cmd = "VimBeGood",
	},
	-- {
	-- 	'nvim-orgmode/orgmode',
	-- 	dependencies = {
	-- 		{ 'nvim-treesitter/nvim-treesitter', lazy = true },
	-- 		"akinsho/org-bullets.nvim",
	-- 		"lukas-reineke/headlines.nvim"
	-- 	},
	-- 	event = 'VeryLazy',
	-- 	config = function()
	-- 		-- Load treesitter grammar for org
	-- 		require('orgmode').setup_ts_grammar()
	--
	-- 		-- Setup treesitter
	-- 		require('nvim-treesitter.configs').setup({
	-- 			highlight = {
	-- 				enable = true,
	-- 				additional_vim_regex_highlighting = { 'org' },
	-- 			},
	-- 			ensure_installed = { 'org' },
	-- 		})
	--
	-- 		-- Setup orgmode
	-- 		require('orgmode').setup({
	-- 			org_agenda_files = '~/orgfiles/**/*',
	-- 			org_default_notes_file = '~/orgfiles/refile.org',
	-- 		})
	-- 	end,
	-- }
}
