local M = {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    opts = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics
        local code_actions = null_ls.builtins.code_actions
        local completion = null_ls.builtins.completion
        local lsp_formatting = function(bufnr)
            vim.lsp.buf.format({
                filter = function(client)
                    return client.name == "null-ls"
                end,
                bufnr = bufnr,
            })
        end

        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

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
        return {
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
        }
    end,
}

return M