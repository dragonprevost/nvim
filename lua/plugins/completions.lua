return {
  {
    "hrsh7th/cmp-nvim-lsp"
  },
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
    dependencies = {
		  "williamboman/mason-lspconfig.nvim",
		  "neovim/nvim-lspconfig",
    },
		config = function()
			local complete = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			complete.setup({
				sources = complete.config.sources({
					{ name = "gopls" },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = "pyright" },
				}),
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = complete.config.window.bordered(),
					documentation = complete.config.window.bordered(),
				},
				mapping = complete.mapping.preset.insert({
					["<C-b>"] = complete.mapping.scroll_docs(-4),
					["<C-f>"] = complete.mapping.scroll_docs(4),
					["<C-Space>"] = complete.mapping.complete(),
					["<C-e>"] = complete.mapping.abort(),
					["<CR>"] = complete.mapping.confirm({ select = true }),
				}),
			})
		end,
	},
}
