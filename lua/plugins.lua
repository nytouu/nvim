return {
	-- Lua stuff
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-lua/popup.nvim" },

	-- LSP
	{ "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
		 	require("config.plugins.lsp")
		end,
		event = "BufRead"
    },
	{
		"glepnir/lspsaga.nvim",
		config = function()
			require("config.plugins.lsp-saga")
		end,
        event = "BufRead"
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
			require("config.plugins.colors")
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

    -- Themes
	{
		"shaunsingh/oxocarbon.nvim",
	},
	{
		"sainnhe/everforest",
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
			require("config.plugins.statusline")
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
	}
}
