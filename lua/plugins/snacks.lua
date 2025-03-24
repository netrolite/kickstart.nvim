return {
  'folke/snacks.nvim',
  priority = 999,
  lazy = false,
  ---@type snacks.Config

  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    --  dashboard = { enabled = true },
    --  explorer = { enabled = true },
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
