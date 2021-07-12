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
    use 'neovim/nvim-lspconfig'
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
	use 'tjdevries/astronauta.nvim'
    use {
		'kabouzeid/nvim-lspinstall',
		cmd = "LspInstall"
	}
    use {
		'hrsh7th/nvim-compe',
		config = function()
			require("plug.lsp-compe")
		end
	}

    -- Colors
    use {
		'norcalli/nvim-colorizer.lua',
		config = function()
			require("plug.colors")
		end,}
    use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

    -- Themes
    use 'folke/tokyonight.nvim'

    -- UI stuff
    use {
		'nvim-telescope/telescope.nvim',
		-- config = function()
		-- 	require("plug.telescope")
		-- end
	}
	use 'dominikduda/vim_current_word'
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
    use 'kyazdani42/nvim-web-devicons'

    -- File explorer
    use {
		'kyazdani42/nvim-tree.lua',
		config = function()
			require("plug.nvim-tree")
		end
	}

    -- Quality of life stuff
    use 'terrortylor/nvim-comment'
    use 'windwp/nvim-autopairs'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'karb94/neoscroll.nvim'
	use 'L3MON4D3/LuaSnip'
	use 'rafamadriz/friendly-snippets'
    use 'phaazon/hop.nvim'
	use 'kdheepak/lazygit.nvim'
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

    -- Not useful but cool stuff
	use 'folke/zen-mode.nvim'
    -- use 'andweeb/presence.nvim'
    -- use 'dstein64/nvim-scrollview'
end)
