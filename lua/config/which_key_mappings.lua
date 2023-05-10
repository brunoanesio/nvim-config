return {
	mode = { "n", "v" },
	["e"] = { "<cmd>NeoTreeFocusToggle<CR>", "Explorer" },
	[" "] = { "<cmd>Telescope find_files<CR>", "Find File" },
	["."] = { "<cmd>Telescope file_browser<CR>", "Browse files" },
	[","] = { "<cmd>Telescope buffers<CR>", "Change buffer" },
	["v"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer Find" },
	b = {
		name = "Buffer",
		b = { "<cmd>Telescope buffers<cr>", "See open buffers" },
		n = { "<cmd>bnext<cr>", "Next Buffer" },
		p = { "<cmd>bprevious<cr>", "Prev Buffer" },
		k = { "<cmd>Bdelete<CR>", "Close Buffer" },
		B = { "<cmd>Telescope buffers<cr>", "Change Buffer" },
	},
	f = {
		name = "File",
		f = { "<cmd>Telescope find_files<cr>", "Find Files" },
		v = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer Find" },
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
		d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to definition" },
		r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
		q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
	},
	o = {
		name = "Open",
		x = { "<cmd>!xdg-open %<CR>", "Open file with XDG-Open" },
		m = { "<cmd>MarkdownPreview<CR>", "Open Markdown Preview" },
	},
	p = {
		name = "Plugins",
		l = { "<cmd>Lazy<cr>", "Lazy" },
		s = { "<cmd>Lazy sync<cr>", "Sync" },
		u = { "<cmd>Lazy update<cr>", "Update" },
		c = { "<cmd>Lazy check<cr>", "Check" },
		h = { "<cmd>Lazy health<cr>", "Lazy Health" },
	},
	q = {
		name = "Quit/Session",
		q = { "<cmd>q!<CR>", "Quit" },
		x = { "<cmd>x!<CR>", "Save and quit" },
		s = { "<cmd>lua require('persistence').load()<CR>", "Restore Session" },
		l = { "<cmd>lua require('persistence').load({ last = true })<CR>", "Restore Last Session" },
		d = { "<cmd>lua require('persistence').stop()<CR>", "Don't Save Current Session" },
	},
	t = {
		name = "Telescope",
		r = { "<cmd>Telescope lsp_references<cr>", "References" },
		s = { "<cmd>Telescope symbols<cr>", "Symbols" },
		S = { "<cmd>Telescope search_history<cr>", "Search History" },
		c = { "<cmd>Telescope commands<cr>", "Commands History" },
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
