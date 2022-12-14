local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true,
		registers = true,
		spelling = {
			enabled = true,
			suggestions = 20,
		},
		presets = {
			operators = false,
			motions = true,
			text_objects = true,
			windows = true,
			nav = true,
			z = true,
			g = true,
		},
	},
	key_labels = {
		["<space>"] = "SPC",
		["<cr>"] = "RET",
		["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»",
		separator = "➜",
		group = "+",
	},
	popup_mappings = {
		scroll_down = "<c-d>",
		scroll_up = "<c-u>",
	},
	window = {
		border = "rounded",
		position = "bottom",
		margin = { 1, 0, 1, 0 },
		padding = { 2, 2, 2, 2 },
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 },
		width = { min = 20, max = 50 },
		spacing = 3,
		align = "left",
	},
	ignore_missing = true,
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
	show_help = true,
	triggers = "auto",
	triggers_blacklist = {
		i = { "j", "k" },
		v = { "j", "k" },
	},
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
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	[" "] = { "<cmd>Telescope find_files<CR>", "Find File" },
	["."] = { "<cmd>Telescope file_browser<CR>", "Browse files" },
	[","] = { "<cmd>Telescope buffers<CR>", "Change buffer" },

	b = {
		name = "Buffer",
		b = { "<cmd>JABSOpen<cr>", "See open buffers" },
		n = { "<cmd>bnext<cr>", "Next Buffer" },
		p = { "<cmd>bprevious<cr>", "Prev Buffer" },
		k = { "<cmd>Bdelete<CR>", "Close Buffer" },
		B = { "<cmd>Telescope buffers<cr>", "Change Buffer" },
	},

	f = {
		name = "File",
		f = { "<cmd>Telescope find_files<cr>", "Find Files" },
		F = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer Find" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		b = { "<cmd>Telescope file_browser<cr>", "File Browser" },
		c = { "<cmd>cd ~/.config/nvim | e $MYVIMRC<CR>", "Edit config" },
		g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
		n = { "<cmd>enew<cr>", "New file" },
		s = { "<cmd>w!<CR>", "Save" },
		S = { "<cmd>source %<CR>", "Source current file" },
	},

	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Lazygit" },
		j = { "<cmd>Gitsigns next_hunk<cr>", "Next Hunk" },
		k = { "<cmd>Gitsigns prev_hunk<cr>", "Prev Hunk" },
		l = { "<cmd>Gitsigns blame_line<cr>", "Blame" },
		p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
		s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
		r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
		R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer" },
		S = { "<cmd>Gitsigns stage_buffer<cr>", "Stage Buffer" },
		u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo Stage Hunk" },
		t = { "<cmd>Telescope git_status<cr>", "See git status" },
		f = { "<cmd>Telescope git_files<cr>", "See git files" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
	},

	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		D = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
		f = { "<cmd>lua vim.lsp.buf.format({async=true})<cr>", "Format" },
		I = { "<cmd>LspInfo<cr>", "LSP Info" },
		i = { "<cmd>Mason<cr>", "Mason Info" },
		j = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" },
		k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
		K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
		R = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
		d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to definition" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
		q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
	},

	o = {
		name = "Open",
		N = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
		H = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
		t = { "<cmd>ToggleTerm direction=float<cr>", "Floating Terminal" },
		T = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal Terminal" },
		x = { "<cmd>!xdg-open %<CR>", "Open file with XDG-Open" },
		m = { "<cmd>MarkdownPreview<CR>", "Open Markdown Preview" },
	},

	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	q = {
		name = "Quit/Session",
		q = { "<cmd>q!<CR>", "Quit" },
		x = { "<cmd>x!<CR>", "Save and quit" },
		f = { "<cmd>SearchSession<CR>", "Search session" },
		s = { "<cmd>SaveSession<CR>", "Save session" },
		d = { "<cmd>DeleteSession<CR>", "Delete session" },
		r = { "<cmd>RestoreSession<CR>", "Restore session" },
	},

	t = {
		name = "Telescope",
		s = { "<cmd>Telescope symbols<cr>", "Symbols" },
		b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer Find" },
		C = { "<cmd>Telescope commands<cr>", "Commands History" },
		c = { "<cmd>Telescope neoclip<cr>", "Neoclip" },
		n = { "<cmd>Telescope notify<cr>", "Show notifications" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		m = { "<cmd>Telescope marks<cr>", "Marks" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
	},

	w = {
		name = "Window",
		w = { "<C-w>w", "Switch window" },
		c = { "<C-w>c", "Close window" },
		s = { "<C-w>s", "Split horizontal window" },
		v = { "<C-w>v", "Split vertical window" },
		h = { "<C-w>h", "Go to the Left window" },
		j = { "<C-w>j", "Go to the Down window" },
		k = { "<C-w>k", "Go to the Up window" },
		l = { "<C-w>l", "Go to the Right window" },
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
