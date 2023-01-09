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
		event = "VeryLazy"
    },
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("config.plugins.lsp-saga")
		end,
        event = "VeryLazy"
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
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("config.plugins.colors")
		end,
        event = "VeryLazy"
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
        "utilyre/barbecue.nvim",
        dependencies = "smiteshp/nvim-navic",
         config = function()
             require("config.plugins.bbq")
        end,
        event = "VeryLazy"
    },
    {
		"nvim-telescope/telescope.nvim",
        config = function()
            require("config.plugins.telescope")
        end,
        event = "VeryLazy"
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
        event = "BufWinEnter"
	},
    {
        "mcauley-penney/tidy.nvim",
        config = function()
            require("tidy").setup()
        end,
        event = "BufWritePre"
    },

    -- Not ful but cool stuff
	{
		"folke/zen-mode.nvim",
		-- config = function()
		-- 	require("plug.zen")
		-- end,
		-- cmd = "ZenMode"
	},
	{
		"ray-x/web-tools.nvim",
		-- config = function ()
		-- 	require"web-tools".setup({
		-- 		keymaps = {
		-- 			rename = nil,
		-- 			repeat_rename = ".",
		-- 		},
		-- 	})
		-- end,
		-- ft = "html"
	}
	--  {
	-- 	"jakewvincent/mkdnflow.nvim",
	-- 	rocks = "luautf8",
	-- 	config = function()
	-- 		require("mkdnflow").setup({})
	-- 	end
	-- }
}
