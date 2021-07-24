---@diagnostic disable: undefined-global
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"

return require('packer').startup(function()
    -- Packer can manage itself as an optionnal plugin
    use 'wbthomason/packer.nvim'

    -- Lua stuff
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'

    -- LSP
    use {
		'neovim/nvim-lspconfig',
        after = "nvim-lspinstall",
		config = function()
			require("plug.lsp")
		end
	}
    use {
		'glepnir/lspsaga.nvim',
		config = function()
			require("plug.lsp-saga")
		end,
		event = "BufWinEnter"
	}
    use {
		'ray-x/lsp_signature.nvim',
		event = "BufRead"
	}
    use {
		'kabouzeid/nvim-lspinstall',
		event = "BufRead"
	}
    use {
		'hrsh7th/nvim-compe',
		after = "nvim-lspconfig",
		config = function()
			require("plug.lsp-compe")
		end,
		event = "InsertEnter",
		-- wants = {"LuaSnip"},
		-- requires = {
		-- 	{
		-- 		"L3MON4D3/LuaSnip",
		-- 		wants = "friendly-snippets",
		-- 		event = "InsertCharPre",
		-- 		config = function()
		-- 			require("plugins.snippets")
		-- 		end
		-- 	},
		-- 	{
		-- 		"rafamadriz/friendly-snippets",
		-- 		event = "InsertCharPre"
		-- 	}
		-- }
	}

    -- Colors
    use {
		'norcalli/nvim-colorizer.lua',
		config = function()
			require("plug.colors")
		end,
		event = "BufRead"
	}
    use {
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require("plug.treesitter")
		end,
		event = "BufRead",
		run = ':TSUpdate'
	}

    -- Themes
    use 'folke/tokyonight.nvim'

    -- UI stuff
    use {
		'nvim-telescope/telescope.nvim',
		config = function()
			require("plug.telescope")
		end,
		cmd = "Telescope"
	}
	use {
		'dominikduda/vim_current_word',
	    event = "BufRead"
	}
    use {
		'glepnir/dashboard-nvim',
		config = function()
			require("plug.dashboard")
		end,
		event = "BufWinEnter"
	}
    use {
		'folke/lsp-trouble.nvim',
		config = function()
			require("plug.lsp-trouble")
		end,
		cmd = "LspTroubleToggle"
	}
    use {
		'akinsho/nvim-bufferline.lua',
		config = function()
			require("plug.bufferline")
		end,
		event = "BufWinEnter"
	}
    use {
		'glepnir/galaxyline.nvim',
		config = function()
			require("plug.statusline")
		end,
		event = "BufWinEnter"
	}
    use {
		'akinsho/nvim-toggleterm.lua',
		config = function()
			require("plug.toggleterm")
		end,
		cmd = "ToggleTerm"
	}
	use {
		'sindrets/diffview.nvim',
		config = function()
			require("plug.diffview")
		end,
		cmd = "DiffViewOpen"
	}
    use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require("plug.git")
		end,
		event = "BufRead"
	}

    -- Icons
    use {
		'kyazdani42/nvim-web-devicons',
	    config = function()
	        require("plug.icons")
		end
	}

    -- File explorer
    use {
		'kyazdani42/nvim-tree.lua',
		config = function()
			require("plug.nvim-tree")
		end,
		cmd = "NvimTreeToggle"
	}

    -- Quality of life stuff
    use {
		'famiu/bufdelete.nvim',
		cmd = "Bdelete"
	}
    use {
		'folke/which-key.nvim',
		config = function()
			require("plug.which-key")
		end,
		event = "BufWinEnter"
	}
    use {
		'famiu/nvim-reload',
		cmd = "Reload"
	}
    use {
		'terrortylor/nvim-comment',
		config = function()
			require("nvim_comment").setup()
		end,
		event = "BufRead"
	}
    use {
		'windwp/nvim-autopairs',
		config = function()
			require("plug.autopairs")
		end
	}
    use {
		'lukas-reineke/indent-blankline.nvim',
		config = function()
			require("plug.indent")
		end,
		event = "BufRead"
	}
    use {
		'karb94/neoscroll.nvim',
		config = function()
			require("plug.neoscroll")
		end,
		event = "BufWinEnter"
	}
    use {
		'phaazon/hop.nvim',
		config = function()
			require("plug.hop")
		end,
		event = "BufRead"
	}
	use {
		'kdheepak/lazygit.nvim',
		cmd = "LazyGit"
	}

    -- Not useful but cool stuff
	use {
		'folke/zen-mode.nvim',
		cmd = "ZenMode"
	}
	use {
		'dstein64/vim-startuptime',
		cmd = "StartupTime"
	}
    -- use 'andweeb/presence.nvim'
    -- use 'dstein64/nvim-scrollview'
end)
