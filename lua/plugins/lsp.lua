return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local utils = require("utils")
			local lsp_utils = require("utils.lsp-utils")
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")

			lsp_utils.setup()

			mason_lspconfig.setup({
				ensure_installed = utils.lsp_servers,
			})

			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						on_attach = lsp_utils.on_attach,
						capabilities = lsp_utils.capabilities,
					})
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
										enabled = false,
										maxLineLength = 95,
									},
									rope_completion = {
										enabled = false,
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
			})
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = {
			pip = {
				upgrade_pip = true,
			},
			ui = {
				border = "rounded",
				icons = {
					package_installed = "",
					package_pending = "➜",
					package_uninstalled = "",
				},
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local utils = require("utils")
			local mr = require("mason-registry")
			local packages = utils.mason_packages
			for _, package in ipairs(packages) do
				local p = mr.get_package(package)
				if not p:is_installed() then
					p:install()
				end
			end
		end,
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufReadPre",
		config = function()
			local nls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			local lsp_formatting = function(bufnr)
				vim.lsp.buf.format({
					filter = function(client)
						return client.name == "null-ls"
					end,
					bufnr = bufnr,
				})
			end
			local on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							lsp_formatting(bufnr)
						end,
					})
				end
			end
			local formatting = nls.builtins.formatting
			local diagnostics = nls.builtins.diagnostics
			local code_actions = nls.builtins.code_actions

			nls.setup({
				sources = {
					-- Python and Django
					formatting.isort.with({ extra_args = { "--profile black" } }),
					formatting.black.with({ extra_args = { "--fast" } }),
					formatting.djlint,
					diagnostics.djlint,
					formatting.stylua,
					formatting.prettier,
					code_actions.eslint_d,
					formatting.shfmt,
				},
				on_attach = on_attach,
			})
		end,
	},
}
