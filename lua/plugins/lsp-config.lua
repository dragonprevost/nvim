return {
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				ensure_installed = {
					"pyright",
				},
				auto_install = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.pyright.setup({
				capabilities = capabilities,
				python = {
					analysis = {
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
					},
					venvPath = vim.fn.getcwd() .. "/venv/",
					pythonPath = vim.fn.getcwd() .. "/venv/bin/python"
				},
			})

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
