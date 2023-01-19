local tools = {
	"bash-language-server",
	"black",
	"css-lsp",
	"djlint",
	"eslint_d",
	"emmet-ls",
	"flake8",
	"html-lsp",
	"isort",
	"json-lsp",
	"lua-language-server",
	"marksman",
	"prettier",
	"python-lsp-server",
	"rust-analyzer",
	"shellcheck",
	"shfmt",
	"stylua",
	"taplo",
	"typescript-language-server",
}
local settings = {
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
}
require("mason").setup(settings)
require("mason-lspconfig").setup({
	automatic_installation = true,
})
require("mason-tool-installer").setup({
	ensure_installed = tools,
	auto_update = false,
	run_on_start = true,
})
local lspconfig = require("lspconfig")
lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
	on_attach = require("user.lsp.handlers").on_attach,
	capabilities = require("user.lsp.handlers").capabilities,
})
require("mason-lspconfig").setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({})
	end,
	["sumneko_lua"] = function()
		lspconfig.sumneko_lua.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})
	end,
	["jsonls"] = function()
		lspconfig.jsonls.setup({
			init_options = {
				provideFormatter = false,
			},
		})
	end,
	["pylsp"] = function()
		lspconfig.pylsp.setup({
			settings = {
				pylsp = {
					plugins = {
						flake8 = {
							enabled = false, -- Disabled otherwise it gets duplicated
							maxLineLength = 95,
						},
						rope_completion = {
							enabled = false, -- Disabled otherwise it gets duplicated
						},
					},
				},
			},
		})
	end,
	["tsserver"] = function()
		require("typescript").setup({
			disable_formatting = true,
		})
	end,
	["emmet_ls"] = function()
		lspconfig.emmet_ls.setup({
			filetypes = { "html", "htmldjango", "css", "typescriptreact", "javascriptreact" },
		})
	end,
	["html"] = function()
		lspconfig.html.setup({
			filetypes = { "html", "htmldjango" },
			init_options = {
				embeddedLanguages = {
					configurationSection = { "html", "css", "javascript" },
					css = true,
					javascript = true,
				},
				provideFormatter = false,
			},
		})
	end,
	["rust_analyzer"] = function()
		require("rust-tools").setup({})
	end,
})
