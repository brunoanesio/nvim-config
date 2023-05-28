local M = {}
local hipatterns = require("mini.hipatterns")
M.hipatterns_config = {
	highlighters = {
		-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
		fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
		hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
		todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
		note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

		-- Highlight hex color strings (`#rrggbb`) using that color
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
}
M.comment_config = {
	hooks = {
		pre = function()
			require("ts_context_commentstring.internal").update_commentstring({})
		end,
	},
}
M.indent_config = {
	symbol = "│",
	options = { try_as_border = true },
}
M.indent_init = function()
	vim.api.nvim_create_autocmd("Filetype", {
		pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
		callback = function()
			vim.b.miniindentscope_disable = true
		end,
	})
end
M.animate_config = {
	resize = {
		enable = false,
	},
	open = {
		enable = false,
	},
	close = {
		enable = false,
	},
}
return M
