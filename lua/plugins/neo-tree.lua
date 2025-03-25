-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>N', ':Neotree toggle<CR>', desc = 'Toggle Neotree', silent = true },
  },
  lazy = false,
  opts = {
    filesystem = {
      hijack_netrw_behavior = 'open_current',
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      filtered_items = {
        always_show = { -- remains visible even if other settings would normally hide it
          '.gitignore',
        },
        always_show_by_pattern = { -- uses glob style patterns
          '.env*',
        },
      },
    },
    window = {
      mappings = {
        ['<Tab>'] = function(state)
          local node = state.tree:get_node()
          if require('neo-tree.utils').is_expandable(node) then
            state.commands['toggle_node'](state)
          else
            state.commands['open'](state)
            vim.cmd 'Neotree reveal'
          end
        end,

        -- replace old bindings for ordering files that start with o
        -- because I want to use o for opening files and toggling directories
        ['o'] = 'open',
        ['O'] = {
          'show_help',
          nowait = false,
          config = { title = 'Order by', prefix_key = 'O' },
        },
        ['Oc'] = { 'order_by_created', nowait = false },
        ['oc'] = 'noop',

        ['Od'] = { 'order_by_diagnostics', nowait = false },
        ['od'] = 'noop',

        ['Og'] = { 'order_by_git_status', nowait = false },
        ['og'] = 'noop',

        ['Om'] = { 'order_by_modified', nowait = false },
        ['om'] = 'noop',

        ['On'] = { 'order_by_name', nowait = false },
        ['on'] = 'noop',

        ['Os'] = { 'order_by_size', nowait = false },
        ['os'] = 'noop',

        ['Ot'] = { 'order_by_type', nowait = false },
        ['ot'] = 'noop',

        -- unbind unnecessary things like searching for files inside neotree
        ['/'] = 'noop',
        ['f'] = 'noop',
      },
    },
  },
}
