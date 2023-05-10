return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
			{ "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local utils = require("plugins.utils")
			local lsp_utils = require("plugins.lsp-utils")
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
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
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
									autopep8 = {
										enabled = false,
									},
									black = {
										enabled = true,
									},
									ruff = {
										enabled = true,
									},
									rope_completion = {
										enabled = false,
										eager = false,
									},
									rope_autoimport = {
										enabled = true,
										memory = false,
									},
									pycodestyle = {
										enabled = false,
									},
									pyflakes = {
										enabled = false,
									},
									pylint = {
										enabled = false,
									},
									mccabe = {
										enabled = false,
									},
								},
							},
						},
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
		cmd = "Mason",
		keys = { { "<leader>li", "<cmd>Mason<CR>", desc = "Mason" } },
		opts = {
			pip = {
				upgrade_pip = true,
			},
			ui = {
				border = "none",
				icons = {
					package_installed = "",
					package_pending = "➜",
					package_uninstalled = "",
				},
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local utils = require("plugins.utils")
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
		event = { "BufReadPre", "BufNewFile" },
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
					formatting.isort.with({ extra_args = { "--profile black" } }),
					formatting.black.with({ extra_args = { "--fast" } }),
					-- diagnostics.ruff,
					diagnostics.djlint,
					formatting.djlint,
					formatting.stylua,
					formatting.prettier,
					formatting.shfmt,
					code_actions.eslint_d,
				},
				on_attach = on_attach,
			})
		end,
	},
}