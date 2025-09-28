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
      { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "[G]it [B]ranches" },
      { "<leader>gl", function() Snacks.picker.git_log() end, desc = "[G]it [L]og" },
      { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "[G]it [L]og Line" },
      { "<leader>gs", function() Snacks.picker.git_status() end, desc = "[G]it [S]tatus" },
      { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "[G]it [S]tash" },
      { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "[G]it [D]iff (Hunks)" },

      -- Search / Grep
      { "<leader>sp", function() Snacks.picker.projects() end, desc = "[S]earch [P]rojects" },
      { "<leader>sn", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "[S]earch [N]eovim files" },
      { "<leader>sf", function() Snacks.picker.files() end, desc = "[S]earch [F]iles" },
      { "<leader>sb", function() Snacks.picker.lines() end, desc = "[S]earch [B]uffer Lines" },
      { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "[S]earch Open [B]uffers" },
      { "<leader>sg", function() Snacks.picker.grep() end, desc = "[S]earch [G]rep" },
      { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "[S]earch Visual [W]ord", mode = { "n", "x" } },

      -- Registers / History / Commands
      { '<leader>s"', function() Snacks.picker.registers() end, desc = "[S]earch registers" },
      { '<leader>s/', function() Snacks.picker.search_history() end, desc = "[S]earch history" },
      { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "[S]earch [A]utocmds" },
      { "<leader>sc", function() Snacks.picker.command_history() end, desc = "[S]earch [C]ommand history" },
      { "<leader>sC", function() Snacks.picker.commands() end, desc = "[S]earch [C]ommands" },

      -- Diagnostics / Help / Marks / Man / Quickfix
      { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "[S]earch [D]iagnostics" },
      { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "[S]earch Buffer [D]iagnostics" },
      { "<leader>sh", function() Snacks.picker.help() end, desc = "[S]earch [H]elp pages" },
      { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "[S]earch [K]eymaps" },
      { "<leader>sm", function() Snacks.picker.marks() end, desc = "[S]earch [M]arks" },
      { "<leader>sM", function() Snacks.picker.man() end, desc = "[S]earch [M]an Pages" },
      { "<leader>sq", function() Snacks.picker.qflist() end, desc = "[S]earch [Q]uickfix List" },
      { "<leader>sR", function() Snacks.picker.resume() end, desc = "[S]earch [R]esume" },
      { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "[S]earch [C]olorschemes" },

      -- LSP
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "LSP [G]oto Definition" },
      { "gD", function() Snacks.picker.lsp_declarations() end, desc = "LSP [G]oto Declaration" },
      { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "[L]SP References" },
      { "gI", function() Snacks.picker.lsp_implementations() end, desc = "[L]SP Goto Implementation" },
      { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "[L]SP Type Definition" },
      { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "[L]SP Symbols" },
      { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "[L]SP Workspace Symbols" },

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
