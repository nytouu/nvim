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
    show_help = false,
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
		r = {"<cmd>TroubleToggle<cr>","Toggle diagnostics"},
		t = {"<cmd>ToggleTerm<cr>","Toggle terminal"},
		-- T = {"<cmd>TransparentToggle<cr>","Toggle trancparency"}
	},
	f = {
		name = "Find",
		d = {"<cmd>Dashboard<cr>","Open dashboard"},
		f = {"<cmd>Telescope find_files<cr>","Find file"},
		w = {"<cmd>Telescope live_grep<cr>","Find word"},
		r = {"<cmd>Telescope oldfiles<cr>","Recent files"},
		c = {"<cmd>Telescope find_files cwd=$HOME/.config/nvim/<cr>","Open config"}
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
		s = {"<cmd>source %<cr>","Source buffer"},
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
		d = {
			d = {"<cmd>DiffviewOpen<cr>","Open Diffview"},
			c = {"<cmd>DiffviewClose<cr>","Close Diffview"},
		},
		j = {"<cmd>Gitsigns next_hunk<cr>","Next hunk"},
		k = {"<cmd>Gitsigns prev_hunk<cr>","Previous hunk"},
		p = {"<cmd>Gitsigns preview_hunk<cr>","Preview hunk"},
		r = {"<cmd>Gitsigns reset_hunk<cr>","Reset hunk"}
	},
	l = {
		name = "Lsp",
		d = {"<cmd>Lspsaga peek_definition<cr>","Peek to definiton"},
		D = {"<cmd>Lspsaga goto_definition<cr>","Peek to definiton"},
		r = {"<cmd>Lspsaga rename<cr>","Rename"},
		f = {"<cmd>Lspsaga lsp_finder<cr>","Lsp Finder"},
		i = {"<cmd>LspInfo<cr>","Info"},
		a = {"<cmd>Lspsaga code_action<cr>","Code action"},
		h = {"<cmd>Lspsaga hover_doc<cr>","Hover doc"},
		-- s = {"<cmd>Lspsaga signature_help<cr>","Signature help"},
		j = {"<cmd>Lspsaga diagnostic_jump_next<cr>","Jump to next diagnostic"},
		k = {"<cmd>Lspsaga diagnostic_jump_prev<cr>","Jump to previous diagnostic"},
		m = {"<cmd>Mason<cr>","Open Mason window"},
	},
	s = {
		name = "Split",
		h = {"<cmd>split<cr>","Horizontal split"},
		v = {"<cmd>vsplit<cr>","Vertical split"}
	},
	h = {
		name = "Hop",
		h = {"<cmd>HopChar2<cr>","Hop to chars"},
		w = {"<cmd>HopWord<cr>","Hop to word"},
		l = {"<cmd>HopLine<cr>","Hop to line"}
	},
	L = {
		name = "Lazy",
		L = {"<cmd>Lazy<cr>","Open Lazy"},
		s = {"<cmd>Lazy sync<cr>","Sync plugins"},
		h = {"<cmd>Lazy health<cr>","Check Lazy Health"},
		p = {"<cmd>Lazy profile<cr>","Lazy Profile"},
		c = {"<cmd>Lazy clean<cr>","Clean plugins"},
	},
}

require("which-key").register(mappings, opts)
