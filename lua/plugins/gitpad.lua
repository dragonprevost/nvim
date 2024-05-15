return {
  'yujinyuz/gitpad.nvim',
  config = function()
    local gitpad = require('gitpad')
    gitpad.setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    })
    local notes_daily 
    vim.keymap.set("n", "<leader>np", gitpad.toggle_gitpad, {})
    vim.keymap.set("n", "<leader>nb", gitpad.toggle_gitpad_branch)
    vim.keymap.set(
      "n", "<leader>nd",
      function()
        local date_filename = 'daily-' .. os.date('%Y-%m-%d.md')
        gitpad.toggle_gitpad({ filename = date_filename, title='Daily notes' })
      end,
      {}
    )
  end
}
