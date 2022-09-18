local function lsp_server()
	local msg = "No Active Lsp"
	local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return msg
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return client.name
		end
	end
	return msg
end

-- local navic = require("nvim-navic")

require("lualine").setup({
	options = {
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
		theme = "catppuccin",
		disabled_filetypes = { "alpha" },
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = { { "mode", separator = { left = "" } } },
		lualine_b = {
			{ "branch", separator = { right = "" } },
			{ "diff", symbols = { added = " ", modified = "柳", removed = " " } },
		},
		-- lualine_c = { "filename", { navic.get_location, cond = navic.is_available }, "diagnostics" },
		lualine_c = { "filename", "diagnostics" },
		lualine_x = { { lsp_server, icon = " :", separator = { right = "" } }, "filetype" },
		lualine_y = { "progress" },
		lualine_z = { { "location", separator = { right = "" } } },
	},
	extensions = { "nvim-tree", "toggleterm", "neo-tree" },
})
