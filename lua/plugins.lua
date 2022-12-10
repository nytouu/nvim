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
		'ray-x/lsp_signature.nvim',
        after = "lspsaga.nvim"
	}
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
		wants = "friendly-snippets",
		after = "nvim-cmp",
		config = function()
			require("plug.snippets")
		end,
	}
	use {
		"saadparwaiz1/cmp_luasnip",
		after = "LuaSnip",
	}
	use {
		"hrsh7th/cmp-nvim-lua",
		after = "cmp_luasnip",
	}
	use {
		"hrsh7th/cmp-nvim-lsp",
		after = "cmp-nvim-lua",
		}
	use {
		"hrsh7th/cmp-buffer",
		after = "cmp-nvim-lsp",
	}
	use {
		"hrsh7th/cmp-path",
		after = "cmp-buffer"
	}
	use {
		"hrsh7th/cmp-calc",
		after = "cmp-path"
	}
	use {
		"f3fora/cmp-spell",
		after = "cmp-calc"
	}
    use {
        "tamago324/cmp-zsh",
        after = "cmp-spell"
    }
    use {
        "KadoBOT/cmp-plugins",
        after = "cmp-zsh",
        config = function()
            require("cmp-plugins").setup({
                files = { "plugins.lua" }
            })
        end
    }
	use {
		"rafamadriz/friendly-snippets",
		after = "cmp-plugins",
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
		'catppuccin/nvim',
		as = 'catppuccin',
	}
    use {
		'shaunsingh/oxocarbon.nvim',
		run = './install.sh'
    }

    -- UI stuff
    use {
        "xiyaowong/nvim-transparent",
			--         config = function ()
			-- vim.cmd([[
			-- 	if !exists('g:neovide')
			-- 		lua require("transparent").setup({ enable = true })
			-- 	endif
			-- ]])
			--             end,
        event = "VimEnter"
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
		'folke/lsp-trouble.nvim',
		config = function()
			require("plug.lsp-trouble")
		end,
		cmd = "TroubleToggle"
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
		-- after = "startup.nvim",
		config = function()
			require("plug.statusline")
		end,
		-- event = "BufWinEnter"
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
        requires = {'kyazdani42/nvim-web-devicons'}
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
        "antoinemadec/FixCursorHold.nvim"
    }
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
		'phaazon/hop.nvim',
		config = function()
			require("plug.hop")
		end,
		event = "BufRead"
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
	use {
		'dstein64/vim-startuptime',
		cmd = "StartupTime"
	}

    -- Syntax
    use {
        'tridactyl/vim-tridactyl',
        event = "BufRead"
    }
end)
