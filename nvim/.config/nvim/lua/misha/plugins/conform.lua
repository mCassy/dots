return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				php = { "php-cs-fixer" },
				go = { "goimports", "gofumpt" },
			},
			formatters = {
				["php-cs-fixer"] = {
					command = vim.fn.stdpath("data") .. "/mason/bin/php-cs-fixer",
					args = {
						"fix",
						"--quiet",
						"--using-cache=no",
						"--no-interaction",
						"--rules=@PSR12,indentation_type,array_indentation",
						"$FILENAME",
					},
					stdin = false,
				},
			},
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { async = false, timeout_ms = 2000, lsp_format = "fallback" }
			end,
		})

		vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 2000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
