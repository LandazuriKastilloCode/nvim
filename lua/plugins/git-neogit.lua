return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
    -- Only one of these is needed.
    'nvim-telescope/telescope.nvim', -- optional
  },
  config = function()
    local neogit = require 'neogit'

    vim.keymap.set('n', '<leader>gs', neogit.open, {
      silent = true,
      noremap = true,
      desc = 'Open Neogit [Status]',
    })
    vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewOpen<cr>', { desc = 'Diff against [H]ead' })
    vim.keymap.set('n', '<leader>gf', '<cmd>DiffviewFileHistory --follow %<cr>', { desc = 'Diff [F]ile history ' })
    vim.keymap.set('n', '<leader>gq', '<cmd>DiffviewClose<CR>', { desc = '[Q]uit diffview' })
  end,
}
