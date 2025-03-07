return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    opts = {
      suggestion = { enabled = true },
      panel = { enabled = true },
    },
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    dependencies = {
      { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
      { 'nvim-lua/plenary.nvim' }, -- for HTTP(S) request
    },
    opts = {
      debug = false, -- Enable debugging
      -- See Configuration section for rest of the options
    },
    keys = {
      {
        '<leader>cc',
        function()
          require('CopilotChat').toggle()
        end,
        desc = 'Toggle Copilot Chat',
      },
      {
        '<leader>ce',
        function()
          local chat = require 'CopilotChat'
          chat.explain()
        end,
        desc = 'Explain code using Copilot Chat',
      },
      {
        '<leader>ct',
        function()
          local chat = require 'CopilotChat'
          chat.test()
        end,
        desc = 'Generate tests using Copilot Chat',
      },
    },
  },
}
