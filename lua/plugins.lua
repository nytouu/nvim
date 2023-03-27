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
		"glepnir/lspsaga.nvim",
		config = function()
			require("config.plugins.lsp-saga")
		end,
        event = "BufRead"
	},
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
		cmd = "IncRename"
	},

	-- Completion stuff
    {
		"hrsh7th/nvim-cmp",
		config = function()
		 	require("config.plugins.cmp")
		end,
		event = "InsertEnter",
	},
	{
		"L3MON4D3/LuaSnip",
		config = function()
		 	require("config.plugins.snippets")
		end,
        dependencies = {
            "rafamadriz/friendly-snippets",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-calc",
            "f3fora/cmp-spell",
            "tamago324/cmp-zsh",
            "KadoBOT/cmp-plugins",
        },
		event = "InsertEnter"
	},
	{
		"onsails/lspkind.nvim",
		event = "InsertEnter"
	},

    -- Colors
    {
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("config.plugins.colorizer")
		end,
        event = "BufRead"
	},
    {
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("config.plugins.treesitter")
		end,
		event = "VeryLazy",
		build = ":TSUpdate"
	},

    -- Colorschemes
	{
		"shaunsingh/oxocarbon.nvim",
		"sainnhe/everforest",
		"folke/tokyonight.nvim",
		"ChristianChiarulli/nvcode-color-schemes.vim",
		"catppuccin/nvim",
		"EdenEast/nightfox.nvim",
		"Yazeed1s/minimal.nvim"
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
        event = "BufWinEnter"
    },
    {
		"nvim-telescope/telescope.nvim",
        config = function()
            require("config.plugins.telescope")
        end,
        cmd = "Telescope"
	},
	{
		"dominikduda/vim_current_word",
	    event = "VeryLazy"
	},
	{
	 	"glepnir/dashboard-nvim",
	 	config = function()
	 		require("config.plugins.dashboard")
	 	end,
	 	event = "VimEnter"
	},
    {
		"akinsho/bufferline.nvim",
		config = function()
		 	require("config.plugins.bufferline")
		end,
		event = "BufWinEnter"
	},
    {
		"NTBBloodbath/galaxyline.nvim",
		config = function()
			require("config.plugins.galaxyline")
		end,
        event = "BufWinEnter"
	},
    {
		"akinsho/toggleterm.nvim",
		config = function()
		 	require("config.plugins.toggleterm")
		end,
		cmd = "ToggleTerm"
	},
    {
		"lewis6991/gitsigns.nvim",
		config = function()
		 	require("config.plugins.git")
		end,
		event = "BufReadPre"
	},
	-- {
	-- 	"xiyaowong/nvim-transparent",
	-- 	config = function ()
	-- 		require("config.plugins.transparent")
	-- 	end,
	-- 	event = "VimEnter"
	-- },
	{
		"petertriho/nvim-scrollbar",
		config = function ()
			require("config.plugins.scrollbar")
		end,
		event = "VeryLazy"
	},
	{
		"m4xshen/smartcolumn.nvim",
		config = function ()
			require("config.plugins.smartcolumn")
		end,
		event = "VeryLazy"
	},


    -- Icons
    {
        "yamatsum/nvim-nonicons",
        dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
		 	require("nvim-nonicons").setup{}
	    end
    },

    -- File explorer
    {
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("config.plugins.nvim-tree")
		end,
        cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeOpen" }
	},

    -- Quality of life stuff
    {
		"famiu/bufdelete.nvim",
		 cmd = "Bdelete"
	},
    {
		"folke/which-key.nvim",
		config = function()
			require("config.plugins.which-key")
	 	end,
		event = "VeryLazy"
	},
    {
		"terrortylor/nvim-comment",
		config = function()
		 	require("nvim_comment").setup()
		end,
		event = "VeryLazy"
	},
    {
		"windwp/nvim-autopairs",
		config = function()
		 	require("config.plugins.autopairs")
		end,
        event = "VeryLazy"
	},
    {
		"lukas-reineke/indent-blankline.nvim",
		config = function()
		 	require("config.plugins.indent")
		end,
        event = "BufReadPre"
	},
    {
        "mcauley-penney/tidy.nvim",
        config = function()
            require("tidy").setup()
        end,
        event = "BufWritePre"
    },
	{
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("config.plugins.hlslens")
		end,
		event = "VimEnter"
	},

    -- cool stuff
	{
		"folke/zen-mode.nvim",
		config = function()
			require("config.plugins.zen")
		end,
		cmd = "ZenMode"
	},
	{
		"ray-x/web-tools.nvim",
		config = function ()
			require"web-tools".setup({
				keymaps = {
					rename = nil,
					repeat_rename = ".",
				},
			})
		end,
		ft = { "html", "js", "javascript" }
	},
	{
		"folke/trouble.nvim",
		config = function ()
			require("config.plugins.lsp-trouble")
		end,
		cmd = { "TroubleToggle", "Trouble" },
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = "LazyGit"
	},
	{
		"monaqa/dial.nvim",
		event = "VeryLazy"
	},
	{
		"phaazon/hop.nvim",
		config = function()
			require("config.plugins.hop")
		end,
		cmd = { "HopWord", "HopChar2", "HopLine" }
	},
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime"
	},
	{
		"toppair/peek.nvim",
		ft = { "md", "markdown" },
		config = function ()
			require("config.plugins.peek")
		end,
		build = "deno task --quiet build:fast"
	},
	{
		"alec-gibson/nvim-tetris",
		cmd = "Tetris"
	},
	{
		"chaimleib/vim-renpy",
		ft = { "rpy", "renpy" }
	},
	{
		"sindrets/diffview.nvim",
		config = function ()
			require("diffview")
		end,
		cmd =  { "DiffviewOpen" }
	},
	{
		"andweeb/presence.nvim",
		config = function ()
			require("config.plugins.discord")
		end,
		event = "VeryLazy"
	},
	{
		"jbyuki/venn.nvim",
		-- event = "VeryLazy",
		ft = { "md", "markdown" }
	},
	{
		"NFrid/due.nvim",
		config = function ()
			require('due_nvim').setup()
		end,
		ft = { "md", "markdown" }
	},
	{
		"axieax/urlview.nvim",
		config = function ()
			require("urlview").setup()
		end,
		cmd = "UrlView"
	},
	-- { "chrisgrieser/nvim-spider" },
}
