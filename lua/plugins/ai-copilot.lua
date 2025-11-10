return {
  'zbirenbaum/copilot.lua',
  event = 'VeryLazy',
  config = function()
    require('copilot').setup {
      suggestion = {
        auto_trigger = true,
      },
      filetypes = {
        erl = false,
        erlang = false,
      },
    }
  end,
}
