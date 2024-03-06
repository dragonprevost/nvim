return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = function()
    local neogen = require("neogen")
    neogen.setup({
      snippet_engine = "luasnip",
      input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
    })
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<Leader>ds", ":lua require('neogen').generate()<CR>", opts)
  end,
}
