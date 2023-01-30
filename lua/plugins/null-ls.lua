return {
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
