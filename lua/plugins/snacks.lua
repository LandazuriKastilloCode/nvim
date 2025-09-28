---@diagnostic disable: undefined-global
return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    explorer = { enabled = false },
    gitbrowse = { enabled = false },
    indent = { enabled = true },
    input = { enabled = true },
    lazygit = { enabled = false },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    terminal = { enabled = false },
    words = { enabled = true },
    zen = { enabled = false },
    styles = {
      notification = {
        -- wo = { wrap = true } -- Wrap notifications
      },
    },
  },
  -- stylua: ignore start
  keys = {
      -- Top Pickers & Explorer
      { "<leader><space>", function() Snacks.picker.smart() end, desc = "Find Smart files" },
      { "<leader>,",       function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>/",       function() Snacks.picker.grep() end, desc = "Search grep" },
      { "<leader>:",       function() Snacks.picker.command_history() end, desc = "Command history" },

      -- Find
      -- { "<leader>fb", function() Snacks.picker.buffers() end, desc = "[F]ind [B]uffers" },
      -- { "<leader>fg", function() Snacks.picker.git_files() end, desc = "[F]ind [G]it files" },
      -- { "<leader>fr", function() Snacks.picker.recent() end, desc = "[F]ind [R]ecent" },

      -- Git
      { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "[B]ranches" },
      { "<leader>gl", function() Snacks.picker.git_log() end, desc = "[L]og" },
      { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "[L]og Line" },
      { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "[S]tash" },
      { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "[D]iff (Hunks)" },

      -- Search / Grep
      { "<leader>st", function() Snacks.picker.git_status() end, desc = "[T]ouched files" },
      { "<leader>sp", function() Snacks.picker.projects() end, desc = "[P]rojects" },
      { "<leader>sn", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "[N]eovim files" },
      { "<leader>sf", function() Snacks.picker.files() end, desc = "[F]iles" },
      { "<leader>sb", function() Snacks.picker.lines() end, desc = "[B]uffer Lines" },
      { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Open [B]uffers" },
      { "<leader>sg", function() Snacks.picker.grep() end, desc = "[G]rep" },
      { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual [W]ord", mode = { "n", "x" } },

      -- Registers / History / Commands
      { '<leader>s"', function() Snacks.picker.registers() end, desc = "registers" },
      { '<leader>s/', function() Snacks.picker.search_history() end, desc = "history" },
      { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "[A]utocmds" },
      { "<leader>sc", function() Snacks.picker.command_history() end, desc = "[C]ommand history" },
      { "<leader>sC", function() Snacks.picker.commands() end, desc = "[C]ommands" },

      -- Diagnostics / Help / Marks / Man / Quickfix
      { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "[D]iagnostics" },
      { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer [D]iagnostics" },
      { "<leader>sh", function() Snacks.picker.help() end, desc = "[H]elp pages" },
      { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "[K]eymaps" },
      { "<leader>sm", function() Snacks.picker.marks() end, desc = "[M]arks" },
      { "<leader>sM", function() Snacks.picker.man() end, desc = "[M]an Pages" },
      { "<leader>sq", function() Snacks.picker.qflist() end, desc = "[Q]uickfix List" },
      { "<leader>sr", function() Snacks.picker.resume() end, desc = "[R]esume" },
      { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "[C]olorschemes" },

      -- LSP
      { "grd", function() Snacks.picker.lsp_definitions() end, desc = "[G]oto LSP Definition" },
      { "grD", function() Snacks.picker.lsp_declarations() end, desc = "[G]oto LSP Declaration" },
      { "grr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "[G]oto [L]SP References" },
      { "grI", function() Snacks.picker.lsp_implementations() end, desc = "[G]oto [L]SP Implementation" },
      { "grt", function() Snacks.picker.lsp_type_definitions() end, desc = "[G]oto LSP [t]ype definition" },
      { "<leader>grs", function() Snacks.picker.lsp_symbols() end, desc = "[G]oto LSP [S]ymbols" },
      { "<leader>grS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "[G]oto LSP workspace [S]ymbols" },

      -- Other
      { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
      { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
      { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
      { "<leader>bd", function() Snacks.bufdelete() end, desc = "[B]uffer [D]elete" },
      { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
      { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
      { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
      { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    },
  -- stylua: ignore end
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end

        -- Override print to use snacks for `:=` command
        if vim.fn.has 'nvim-0.11' == 1 then
          vim._print = function(_, ...)
            dd(...)
          end
        else
          vim.print = _G.dd
        end
      end,
    })
  end,
}
