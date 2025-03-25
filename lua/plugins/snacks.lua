return {
  'folke/snacks.nvim',
  priority = 999,
  lazy = false,
  ---@type snacks.Config
  opts = {
    indent = {
      animate = {
        enabled = false,
      },
    },
    input = { enabled = true },
    lazygit = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    image = { enabled = true },
  },
  keys = {
    {
      '<leader>lg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
    {
      '<leader>lh',
      function()
        Snacks.notifier.show_history()
      end,
    },
  },
}
