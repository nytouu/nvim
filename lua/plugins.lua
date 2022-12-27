---@diagnostic disable: undefined-global
local execute = vim.api.nvim_command
local fn = vim.fn

vim.cmd("packadd packer.nvim")

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"

require('packer').init({
	display = {
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
        prompt_border = "none"
   }
})

return require('packer').startup(function()

    -- Impatient for faster loading
	use {
		'lewis6991/impatient.nvim'
	}

    -- Packer can manage itself as an optionnal plugin
    use {
        'wbthomason/packer.nvim',
        event = "VimEnter"
    }

    -- Lua stuff
    use {
        'nvim-lua/plenary.nvim',
		after = "impatient.nvim"
    }
    use {
        'nvim-lua/popup.nvim',
		after = "impatient.nvim"
    }

    -- LSP
    use {
		'neovim/nvim-lspconfig'
	}
    use {
		'glepnir/lspsaga.nvim',
		branch = "main",
		config = function()
			require("plug.lsp-saga")
		end,
        after = "nvim-lspconfig"
	}
    use {
        "williamboman/mason-lspconfig.nvim",
		config = function()
			require("plug.lsp")
		end
    }
    use {
        'williamboman/mason.nvim'
	}

	-- Completion stuff
   use {
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("plug.cmp")
		end
	}
	use {
		"L3MON4D3/LuaSnip",
		wants = {
            "friendly-snippets",
        },
		after = "nvim-cmp",
		config = function()
			require("plug.snippets")
		end,
        requires = {
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-calc",
            "f3fora/cmp-spell",
            "tamago324/cmp-zsh",
            "rafamadriz/friendly-snippets",
            "KadoBOT/cmp-plugins",
        }
	}
	use {
		"onsails/lspkind.nvim",
		event = "InsertEnter"
	}

    -- Colors
    use {
		'norcalli/nvim-colorizer.lua',
		config = function()
			require("plug.colors")
		end,
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
    use {
		'shaunsingh/oxocarbon.nvim',
    }

    -- UI stuff
    use {
		"folke/noice.nvim",
		config = function()
			require("plug.noice")
		end,
        requires = {
            "MunifTanjim/nui.nvim",
        },
        after = "nvim-web-devicons"
    }

    use {
        "utilyre/barbecue.nvim",
        requires = "smiteshp/nvim-navic",
        after = "nvim-web-devicons",
        config = function()
            require("plug.bbq")
        end,
    }
    use {
		'nvim-telescope/telescope.nvim',
		config = function()
			require("plug.telescope")
		end,
        after = "plenary.nvim"
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
		'akinsho/bufferline.nvim',
		config = function()
			require("plug.bufferline")
		end,
		event = "BufWinEnter"
	}
    use {
		'NTBBloodbath/galaxyline.nvim',
		config = function()
			require("plug.statusline")
		end,
	}
    use {
		'akinsho/toggleterm.nvim',
		config = function()
			require("plug.toggleterm")
		end,
		cmd = "ToggleTerm"
	}
    use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require("plug.git")
		end
	}

    -- Icons
    use {
        'yamatsum/nvim-nonicons',
        requires = {'nvim-tree/nvim-web-devicons'},
		config = function()
			require("nvim-nonicons").setup{}
		end
    }

    -- File explorer
    use {
		'kyazdani42/nvim-tree.lua',
		config = function()
			require("plug.nvim-tree")
		end,
        cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeOpen" }
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
		end,
        after = "nvim-cmp"
	}
    use {
		'lukas-reineke/indent-blankline.nvim',
		config = function()
			require("plug.indent")
		end,
        event = "BufWinEnter"
	}
    use {
        'mcauley-penney/tidy.nvim',
        config = function()
            require("tidy").setup()
        end,
        event = "BufWritePre"
    }

    -- Not useful but cool stuff
	use {
		'folke/zen-mode.nvim',
		config = function()
			require("plug.zen")
		end,
		cmd = "ZenMode"
	}
end)
