require("which-key").setup {
    plugins = {
        marks = true,
        registers = false,
        spelling = {
            enabled = false,
            suggestions = 20,
        },
        presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
        },
    },
    operators = { gc = "Comments" },
    key_labels = {
        ["<Leader>"] = "SPC",
        ["<cr>"] = "RET",
        ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»",
        separator = " ",
        group = " ",
    },
    window = {
        border = "none",
        position = "bottom",
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = { min = 3, max = 5 },
        width = { min = 20, max = 40 },
        spacing = 10,
        align = "center",
    },
    ignore_missing = false,
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "},
    show_help = true,
    triggers = {"<Leader>"},
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        i = { "j", "k" },
        v = { "j", "k" }
    }
}

local opts = {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
}

local mappings = {
	["e"] = "Explorer",
	F = {
		name = "Folds",
		o = {"<cmd>foldopen<cr>","Open fold"},
		q = {"<cmd>foldopen<cr>","Close fold"}
	},
	t = {
		name = "Toggle",
		e = {"<cmd>NvimTreeToggle<cr>","Toggle explorer"},
		r = {"<cmd>LspTroubleToggle<cr>","Toggle diagnostics"},
		t = {"<cmd>ToggleTerm<cr>","Toggle terminal"}
	},
	f = {
		name = "Find",
		d = {"<cmd>Dashboard<cr>","Open dashboard"},
		b = {"<cmd>Telescope file_browser<cr>","File browser"},
		f = {"<cmd>Telescope find_files<cr>","Find file"},
		g = {"<cmd>Telescope live_grep<cr>","Find word"},
		h = {"<cmd>Telescope oldfiles<cr>","Old files"},
		s = {"<cmd>e $HOME/.config/nvim/lua/settings.lua<cr>","Open settings"}
	},
	q = {
		name = "Quit",
		q = {"<cmd>q<cr>","Quit"},
		a = {"<cmd>qa<cr>","Close all"},
		b = {"<cmd>Bdelete<cr>","Close buffer"},
		h = {"<cmd>set hlsearch!<cr>","Remove search highlight"}
	},
	w = {
		name = "Write",
		w = {"<cmd>w<cr>","Save"},
		q = {"<cmd>wq<cr>","Save & quit"},
		a = {"<cmd>wa<cr>","Save all"}
	},
	b = {
		name = "Buffer",
		p = {"<cmd>BufferLinePick<cr>","Pick buffer"},
		["1"] = {"<cmd>lua require'bufferline'.go_to_buffer(1)<cr>","1st buffer"},
		["2"] = {"<cmd>lua require'bufferline'.go_to_buffer(2)<cr>","2nd buffer"},
		["3"] = {"<cmd>lua require'bufferline'.go_to_buffer(3)<cr>","3rd buffer"},
		["4"] = {"<cmd>lua require'bufferline'.go_to_buffer(4)<cr>","4th buffer"},
		["5"] = {"<cmd>lua require'bufferline'.go_to_buffer(5)<cr>","5th buffer"},
		["6"] = {"<cmd>lua require'bufferline'.go_to_buffer(6)<cr>","6th buffer"},
		["7"] = {"<cmd>lua require'bufferline'.go_to_buffer(7)<cr>","7th buffer"},
		["8"] = {"<cmd>lua require'bufferline'.go_to_buffer(8)<cr>","8th buffer"},
		["9"] = {"<cmd>lua require'bufferline'.go_to_buffer(9)<cr>","9th buffer"}
	},
	g = {
		name = "Git",
		g = {"<cmd>LazyGit<cr>","Open Lazygit"},
		j = {"<cmd>Gitsigns next_hunk<cr>","Next hunk"},
		k = {"<cmd>Gitsigns prev_hunk<cr>","Previous hunk"},
		p = {"<cmd>Gitsigns preview_hunk<cr>","Preview hunk"},
		r = {"<cmd>Gitsigns reset_hunk<cr>","Preview hunk"}
	},
	l = {
		name = "Lsp",
		d = {"<cmd>Lspsaga preview_definition<cr>","Go to definiton"},
		c = {"<cmd>lua vim.lsp.buf.declaration()<cr>","Go to declaration"},
		R = {"<cmd>lua vim.lsp.buf.references()<cr>","Go to references"},
		r = {"<cmd>lua lua vim.lsp.buf.rename()<cr>","Rename"},
		i = {"<cmd>LspInfo<cr>","Info"},
		a = {"<cmd>Lspsaga code_action<cr>","Code action"},
		h = {"<cmd>Lspsaga hover_doc<cr>","Hover doc"},
		s = {"<cmd>Lspsaga signature_help<cr>","Signature help"},
		j = {"<cmd>Lspsaga diagnostic_jump_next<cr>","Jump to next diagnostic"},
		k = {"<cmd>Lspsaga diagnostic_jump_prev<cr>","Jump to previous diagnostic"},
	},
	s = {
		name = "Split",
		h = {"<cmd>split<cr>","Horizontal split"},
		v = {"<cmd>vsplit<cr>","Vertical split"}
	},
	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" }
	}
}

require("which-key").register(mappings, opts)
