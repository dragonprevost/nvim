return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "pyright",
      "debugpy",
      "black",
      "ruff",
      "mypy",
    }
  },
  lazy = false,
  config = function()
    require("mason").setup()
  end,

}
