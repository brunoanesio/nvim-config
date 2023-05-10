local M = {}

M.lsp_signs = { Error = " ", Warn = "! ", Hint = " ", Info = " " }

M.cmp_kinds = {
	Text = " ",
	Method = " ",
	Function = " ",
	Constructor = " ",
	Field = " ",
	Variable = "",
	Class = " ",
	Interface = " ",
	Module = " ",
	Property = " ",
	Unit = " ",
	Value = " ",
	Enum = " ",
	Keyword = " ",
	Snippet = " ",
	Color = " ",
	File = " ",
	Reference = " ",
	Folder = " ",
	EnumMember = " ",
	Constant = " ",
	Struct = "  ",
	Event = "",
	Operator = " ",
	TypeParameter = " ",
}

M.mason_packages = {
	"bash-language-server",
	"black",
	"css-lsp",
	"djlint",
	"eslint_d",
	"emmet-ls",
	"html-lsp",
	"isort",
	"json-lsp",
	"lua-language-server",
	"marksman",
	"prettier",
	"python-lsp-server",
	"rust-analyzer",
	"ruff",
	"ruff-lsp",
	"shellcheck",
	"shfmt",
	"stylua",
	"taplo",
	"typescript-language-server",
}

M.lsp_servers = {
	"tsserver",
	"lua_ls",
	"bashls",
	"jsonls",
	"cssls",
	"taplo",
	"html",
}

M.diagnostics_active = true

function M.on_attach(on_attach)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local buffer = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			on_attach(client, buffer)
		end,
	})
end

function M.warn(msg, notify_opts)
	vim.notify(msg, vim.log.levels.WARN, notify_opts)
end

function M.error(msg, notify_opts)
	vim.notify(msg, vim.log.levels.ERROR, notify_opts)
end

function M.info(msg, notify_opts)
	vim.notify(msg, vim.log.levels.INFO, notify_opts)
end

---@param silent boolean?
---@param values? {[1]:any, [2]:any}
function M.toggle(option, silent, values)
	if values then
		if vim.opt_local[option]:get() == values[1] then
			vim.opt_local[option] = values[2]
		else
			vim.opt_local[option] = values[1]
		end
		return require("plugins.utils").info(
			"Set " .. option .. " to " .. vim.opt_local[option]:get(),
			{ title = "Option" }
		)
	end
	vim.opt_local[option] = not vim.opt_local[option]:get()
	if not silent then
		if vim.opt_local[option]:get() then
			require("plugins.utils").info("Enabled " .. option, { title = "Option" })
		else
			require("plugins.utils").warn("Disabled " .. option, { title = "Option" })
		end
	end
end

function M.toggle_diagnostics()
	M.diagnostics_active = not M.diagnostics_active
	if M.diagnostics_active then
		vim.diagnostic.show()
		require("plugins.utils").info("Enabled Diagnostics", { title = "Lsp" })
	else
		vim.diagnostic.hide()
		require("plugins.utils").warn("Disabled Diagnostics", { title = "Lsp" })
	end
end

function M.get_root()
	---@type string?
	local path = vim.api.nvim_buf_get_name(0)
	path = path ~= "" and vim.loop.fs_realpath(path) or nil
	---@type string[]
	local roots = {}
	if path then
		for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
			local workspace = client.config.workspace_folders
			local paths = workspace
					and vim.tbl_map(function(ws)
						return vim.uri_to_fname(ws.uri)
					end, workspace)
				or client.config.root_dir and { client.config.root_dir }
				or {}
			for _, p in ipairs(paths) do
				local r = vim.loop.fs_realpath(p)
				if path:find(r, 1, true) then
					roots[#roots + 1] = r
				end
			end
		end
	end
	table.sort(roots, function(a, b)
		return #a > #b
	end)
	---@type string?
	local root = roots[1]
	if not root then
		path = path and vim.fs.dirname(path) or vim.loop.cwd()
		---@type string?
		root = vim.fs.find(M.root_patterns, { path = path, upward = true })[1]
		root = root and vim.fs.dirname(root) or vim.loop.cwd()
	end
	---@cast root string
	return root
end

return M