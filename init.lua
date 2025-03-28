--[[
=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

What is Kickstart?

  Kickstart.nvim is *not* a distribution.

  Kickstart.nvim is a starting point for your own configuration.
    The goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    Once you've done that, you can start exploring, configuring and tinkering to
    make Neovim your own! That might mean leaving Kickstart just the way it is for a while
    or immediately breaking it into modular pieces. It's up to you!

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know the Neovim basics, you can skip this step.)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua.

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite Neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or Neovim features used in Kickstart.

   NOTE: Look for lines like this

    Throughout the file. These are for you, the reader, to help you understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your Neovim config.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
  --

  -- Alternatively, use `config = function() ... end` for full control over the configuration.
  -- If you prefer to call `setup` explicitly, use:
  --    {
  --        'lewis6991/gitsigns.nvim',
  --        config = function()
  --            require('gitsigns').setup({
  --                -- Your gitsigns configuration here
  --            })
  --        end,
  --    }
  --
  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`.
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  {
    'mireq/luasnip-snippets',
    dependencies = { 'L3MON4D3/LuaSnip' },
    init = function()
      -- Mandatory setup function
      require('luasnip_snippets.common.snip_utils').setup()
    end,
  },
  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `opts` key (recommended), the configuration runs
  -- after the plugin has been loaded as `require(MODULE).setup(opts)`.

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.opt.timeoutlen
      delay = 0,
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      -- Mason must be loaded before its dependents so we need to set it up here.
      -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
      { 'williamboman/mason.nvim', opts = {} },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', opts = {} },

      -- Allows extra capabilities provided by nvim-cmp
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      -- Brief aside: **What is LSP?**
      --
      -- LSP is an initialism you've probably heard, but might not understand what it is.
      --
      -- LSP stands for Language Server Protocol. It's a protocol that helps editors
      -- and language tooling communicate in a standardized fashion.
      --
      -- In general, you have a "server" which is some tool built to understand a particular
      -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
      -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
      -- processes that communicate with some "client" - in this case, Neovim!
      --
      -- LSP provides Neovim with features like:
      --  - Go to definition
      --  - Find references
      --  - Autocompletion
      --  - Symbol Search
      --  - and more!
      --
      -- Thus, Language Servers are external tools that must be installed separately from
      -- Neovim. This is where `mason` and related plugins come into play.
      --
      -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
      -- and elegantly composed help section, `:help lsp-vs-treesitter`

      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      --
      --

      local lspconfig = require 'lspconfig'

      -- Setup JavaScript/TypeScript
      lspconfig.ts_ls.setup {}

      -- Setup Python
      lspconfig.pylsp.setup {
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = { enabled = true },
              pylint = { enabled = true },
              black = { enabled = true },
              rope_completion = { enabled = true },
              mypy = { enabled = true },
            },
          },
        },
      }

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Remember that Lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- Find references for the word under your cursor.
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
          ---@param client vim.lsp.Client
          ---@param method vim.lsp.protocol.Method
          ---@param bufnr? integer some lsp support methods only in specific files
          ---@return boolean
          local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- Diagnostic Config
      -- See :help vim.diagnostic.Opts
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      }

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        -- clangd = {},
        -- gopls = {},
        pyright = {},
        lemminx = {},
        -- rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`ts_ls`) will work just fine
        ts_ls = {},
        --

        lua_ls = {
          -- cmd = { ... },
          -- filetypes = { ... },
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- Ensure the servers and tools above are installed
      --
      -- To check the current status of installed tools and/or manually install
      -- other tools, you can run
      --    :Mason
      --
      -- You can press `g?` for help in this menu.
      --
      -- `mason` had to be setup earlier: to configure its options see the
      -- `dependencies` table for `nvim-lspconfig` above.
      --
      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {
        'ts_ls', -- TypeScript/JavaScript
        'eslint_d', -- JavaScript linting
        'pyright', -- Python
        'lemminx',
        'xmlformatter',
        'ast_grep',
        'pylsp', -- Python Language Server
        'black', -- Python formatting
      })
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for ts_ls)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
  --
  -- add lua snip
  --
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
        config = {
          center = {
            {
              icon = '',
              icon_hl = 'group',
              desc = 'description',
              desc_hl = 'group',
              key = 'shortcut key in dashboard buffer not keymap !!',
              key_hl = 'group',
              key_format = ' [%s]', -- `%s` will be substituted with value of `key`
              action = '',
            },
          },
          footer = {},
          vertical_center = false, -- Center the Dashboard on the vertical (from top to bottom)
        },
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
  -- Add to your config
  {
    'L3MON4D3/LuaSnip',
    config = function()
      local ls = require 'luasnip'
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node

      -- JavaScript/OWL Snippets
      ls.add_snippets('javascript', {
        s('log', {
          t 'console.log(',
          i(1, ''),
          t ');',
        }),
        s('func', {
          t 'function ',
          i(1, 'name'),
          t '(',
          i(2, 'params'),
          t ') {',
          t { '', '\t' },
          i(0),
          t { '', '}' },
        }),
        -- Add more JS snippets here
        init = function()
          local ls = require 'luasnip'
          ls.setup {
            -- Required to automatically include base snippets, like "c" snippets for "cpp"
            load_ft_func = require('luasnip_snippets.common.snip_utils').load_ft_func,
            ft_func = require('luasnip_snippets.common.snip_utils').ft_func,
            -- To enable auto-expansion
            enable_autosnippets = true,
            -- Uncomment to enable visual snippets triggered using <c-x>
            -- store_selection_keys = '<c-x>',
          }
          -- LuaSnip key bindings
          vim.keymap.set({ 'i', 's' }, '<Tab>', function()
            if ls.expand_or_jumpable() then
              ls.expand_or_jump()
            else
              vim.api.nvim_input '<C-V><Tab>'
            end
          end, { silent = true })
          vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
            ls.jump(-1)
          end, { silent = true })
          vim.keymap.set({ 'i', 's' }, '<C-E>', function()
            if ls.choice_active() then
              ls.change_choice(1)
            end
          end, { silent = true })
        end,
      })

      -- Python Snippets
      ls.add_snippets('python', {
        s('def', {
          t 'def ',
          i(1, 'function_name'),
          t '(',
          i(2, 'parameters'),
          t ') -> ',
          i(3, 'return_type'),
          t { ': ', '\t' },
          i(0),
          t { '', '' },
        }),
        -- Add more Python snippets here
      })
    end,
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = 'fallback'
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        python = { 'isort', 'black' },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        xml = { 'xmlformatter' },
      },
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          -- {
          --   'rafamadriz/friendly-snippets',
          --   config = function()
          --     require('luasnip.loaders.from_vscode').lazy_load()
          --   end,
          -- },
        },
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
      'hrsh7th/cmp-nvim-lsp-signature-help',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- Scroll the documentation window [b]ack / [f]orward
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          -- ['<C-y>'] = cmp.mapping.confirm { select = true },

          -- If you prefer more traditional completion keymaps,
          -- you can uncomment the following lines
          ['<CR>'] = cmp.mapping.confirm { select = true },
          --['<Tab>'] = cmp.mapping.select_next_item(),
          --['<S-Tab>'] = cmp.mapping.select_prev_item(),

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          ['<C-Space>'] = cmp.mapping.complete {},

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),

          -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        },
        sources = {
          {
            name = 'lazydev',
            -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
            group_index = 0,
          },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          { name = 'buffer' },
          { name = 'nvim_lsp_signature_help' },
        },
      }
    end,
  },
  { 'rebelot/kanagawa.nvim' },
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
      }

      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = {
        'javascript',
        'typescript',
        'python',
        'html',
        'css',
        'json',
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects

    {
      'folke/noice.nvim',
      event = 'VeryLazy',
      dependencies = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify',
      },
      config = function()
        require('noice').setup {
          -- Enable command-line UI
          cmdline = {
            enabled = true,
            view = 'cmdline_popup',
          },
          -- Enable search UI popup
          messages = {
            enabled = true,
          },
          -- Configure popup positions
          views = {
            notify = {
              backend = 'notify',
              render = 'minimal', -- ✨ makes notifications minimal
              replace = true,
              merge = true,
            },
            cmdline_popup = {
              position = {
                row = '20%', -- <== 👈 Move the cmdline 20% from top
                col = '50%',
              },
              size = {
                width = 60,
                height = 'auto',
              },
              border = {
                style = 'rounded',
              },
              win_options = {
                winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
              },
            },
            popupmenu = {
              relative = 'editor',
              position = {
                row = '25%',
                col = '50%',
              },
              size = {
                width = 60,
                height = 10,
              },
              border = {
                style = 'rounded',
                padding = { 0, 1 },
              },
              win_options = {
                winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
              },
            },
          },
          presets = {
            bottom_search = false, -- you want popup search, not bottom one
            command_palette = false,
            long_message_to_split = true,
          },
        }

        -- Optional: Replace native `vim.notify` with prettier version
        vim.notify = require 'notify'
      end,
    },
    {
      'nvimtools/none-ls.nvim',
      dependencies = {
        'nvimtools/none-ls-extras.nvim',
        'jayp0521/mason-null-ls.nvim',
      },
      config = function()
        local null_ls = require 'null-ls'
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics

        -- Ensure Mason installs formatters/linters
        require('mason-null-ls').setup {
          ensure_installed = {
            'ts_ls', -- TypeScript/JavaScript
            'eslint_d', -- JavaScript linting
            'ast_grep', -- Python
            'pylsp', -- Python Language Server
            'black', -- Python formatting
            -- 'ruff', -- Python linter
            'prettier', -- JS/HTML formatter
            'stylua', -- Lua formatter
            'eslint_d', -- JS linter
            'shfmt', -- Shell formatter
            'checkmake', -- Makefile linter
            'xmlformatter',
          },
          automatic_installation = true,
        }

        local sources = {
          -- ✅ Correcting imports & formatting for Python
          formatting.isort, -- Sort imports
          -- diagnostics.ruff, -- Ruff for linting
          formatting.ruff_format, -- Ruff's formatting (not a full replacement for Black)

          -- Other formatters
          null_ls.builtins.formatting.biome.with {
            command = 'biome', -- make sure it's installed
            args = { 'format', '--stdin-file-path', '$FILENAME' },
          },
          formatting.prettier.with { filetypes = { 'html', 'json', 'yaml', 'markdown' } },
          formatting.stylua,
          formatting.shfmt.with { args = { '-i', '4' } },
          formatting.terraform_fmt,
          formatting.xmlformatter,
        }

        local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
        null_ls.setup {
          sources = sources,
          on_attach = function(client, bufnr)
            if client.supports_method 'textDocument/formatting' then
              vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
              vim.api.nvim_create_autocmd('BufWritePre', {
                group = augroup,
                buffer = bufnr,
                callback = function()
                  vim.lsp.buf.format { async = false }
                end,
              })
            end
          end,
        }
      end,
    },
    --
    --

    --
    -- auto save
    --

    {
      'Pocco81/auto-save.nvim',
      config = function()
        require('auto-save').setup {
          enabled = true,
          execution_message = {
            message = function()
              return 'Auto-saved!'
            end,
            dim = 0.18,
            cleaning_interval = 1250,
          },
          trigger_events = { 'InsertLeave', 'TextChanged' }, -- Auto-save when leaving insert mode or modifying text
          debounce_delay = 135, -- Save delay in milliseconds
          conditions = {
            exists = true,
            filetype_is_not = {}, -- No exclusions
            modifiable = true,
          },
          write_all_buffers = false, -- Only save the current buffer
        }
      end,
    },

    -- Lazygit
    {
      'kdheepak/lazygit.nvim',
      keys = {
        { '<leader>lg', '<cmd>LazyGit<CR>', desc = 'Open LazyGit' },
      },
      config = function()
        vim.g.lazygit_floating_window_use_plenary = 0 -- Use default floating window
      end,
    },

    --
    -- Toggle terminal
    --
    {
      'akinsho/toggleterm.nvim',
      version = '*',
      config = function()
        require('toggleterm').setup {
          size = 15, -- Default terminal size
          shade_terminals = true,
          direction = 'float', -- Options: "horizontal" | "vertical" | "tab" | "float"
        }

        -- Set key binding for normal mode
        vim.keymap.set('n', 'T', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true, desc = 'Toggle terminal' })
        vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
      end,
    },
    --
    -- odoo snippet
    --
    {
      'mstuttgart/vscode-odoo-snippets',
      dependencies = {
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',
      },
      event = 'InsertEnter',
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load {
          paths = { vim.fn.stdpath 'data' .. '/lazy/vscode-odoo-snippets' },
        }
      end,
    },
    --
    -- buffer line
    --
    {
      'akinsho/bufferline.nvim',
      dependencies = 'nvim-tree/nvim-web-devicons',
      keys = {
        { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Previous Buffer' },
        { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
        { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle Pin' },
        { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete Non-Pinned Buffers' },
        { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete Buffers to the Right' },
        { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete Buffers to the Left' },
      },
      config = function()
        require('bufferline').setup {
          options = {
            diagnostics = 'nvim_lsp',
            separator_style = 'slant',
            show_close_icon = false,
            show_buffer_close_icons = false,
            offsets = {
              { filetype = 'NvimTree', text = 'File Explorer', highlight = 'Directory', text_align = 'left' },
            },
          },
        }
      end,
    },
    --
    -- codium text completion
    --
    --
    {
      'goolord/alpha-nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function()
        local alpha = require 'alpha'
        local dashboard = require 'alpha.themes.dashboard'

        -- Header
        local headers = {
          {
            [[                               __                ]],
            [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
            [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
            [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
            [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
            [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
          },

          {
            [[ _______             ____   ____.__         ]],
            [[ \      \   ____  ___\   \ /   /|__| _____  ]],
            [[ /   |   \_/ __ \/  _ \   Y   / |  |/     \ ]],
            [[/    |    \  ___(  <_> )     /  |  |  Y Y  \]],
            [[\____|__  /\___  >____/ \___/   |__|__|_|  /]],
            [[        \/     \/                        \/ ]],
          },

          {
            [[                                                                       ]],
            [[  ██████   █████                   █████   █████  ███                  ]],
            [[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
            [[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
            [[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
            [[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
            [[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
            [[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
            [[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
            [[                                                                       ]],
          },

          {
            [[                                                    ]],
            [[     dMMMMb  dMMMMMP .aMMMb  dMP dMP dMP dMMMMMMMMb ]],
            [[    dMP dMP dMP     dMP"dMP dMP dMP amr dMP"dMP"dMP ]],
            [[   dMP dMP dMMMP   dMP dMP dMP dMP dMP dMP dMP dMP  ]],
            [[  dMP dMP dMP     dMP.aMP  YMvAP" dMP dMP dMP dMP   ]],
            [[ dMP dMP dMMMMMP  VMMMP"    VP"  dMP dMP dMP dMP    ]],
            [[                                                    ]],
          },

          {
            [[                                                                                   ]],
            [[     /\__\         /\  \         /\  \         /\__\          ___        /\__\     ]],
            [[    /::|  |       /::\  \       /::\  \       /:/  /         /\  \      /::|  |    ]],
            [[   /:|:|  |      /:/\:\  \     /:/\:\  \     /:/  /          \:\  \    /:|:|  |    ]],
            [[  /:/|:|  |__   /::\~\:\  \   /:/  \:\  \   /:/__/  ___      /::\__\  /:/|:|__|__  ]],
            [[ /:/ |:| /\__\ /:/\:\ \:\__\ /:/__/ \:\__\  |:|  | /\__\  __/:/\/__/ /:/ |::::\__\ ]],
            [[ \/__|:|/:/  / \:\~\:\ \/__/ \:\  \ /:/  /  |:|  |/:/  / /\/:/  /    \/__/~~/:/  / ]],
            [[     |:/:/  /   \:\ \:\__\    \:\  /:/  /   |:|__/:/  /  \::/__/           /:/  /  ]],
            [[     |::/  /     \:\ \/__/     \:\/:/  /     \::::/__/    \:\__\          /:/  /   ]],
            [[     /:/  /       \:\__\        \::/  /       ~~~~         \/__/         /:/  /    ]],
            [[     \/__/         \/__/         \/__/                                   \/__/     ]],
            [[                                                                                   ]],
          },

          {
            [[                                     ]],
            [[      __                _            ]],
            [[   /\ \ \___  ___/\   /(_)_ __ ___   ]],
            [[  /  \/ / _ \/ _ \ \ / | | '_ ` _ \  ]],
            [[ / /\  |  __| (_) \ V /| | | | | | | ]],
            [[ \_\ \/ \___|\___/ \_/ |_|_| |_| |_| ]],
            [[                                     ]],
          },

          {
            [[                                                                                                   ]],
            [[ /\\\\\_____/\\\_______________________________/\\\________/\\\___________________________         ]],
            [[ \/\\\\\\___\/\\\______________________________\/\\\_______\/\\\__________________________         ]],
            [[ _\/\\\/\\\__\/\\\______________________________\//\\\______/\\\___/\\\_____________________       ]],
            [[  _\/\\\//\\\_\/\\\_____/\\\\\\\\______/\\\\\_____\//\\\____/\\\___\///_____/\\\\\__/\\\\\__       ]],
            [[   _\/\\\\//\\\\/\\\___/\\\/////\\\___/\\\///\\\____\//\\\__/\\\_____/\\\__/\\\///\\\\\///\\\_     ]],
            [[    _\/\\\_\//\\\/\\\__/\\\\\\\\\\\___/\\\__\//\\\____\//\\\/\\\_____\/\\\_\/\\\_\//\\\__\/\\\     ]],
            [[     _\/\\\__\//\\\\\\_\//\\///////___\//\\\__/\\\______\//\\\\\______\/\\\_\/\\\__\/\\\__\/\\\_   ]],
            [[      _\/\\\___\//\\\\\__\//\\\\\\\\\\__\///\\\\\/________\//\\\_______\/\\\_\/\\\__\/\\\__\/\\\   ]],
            [[       _\///_____\/////____\//////////_____\/////___________\///________\///__\///___\///___\///__ ]],
            [[                                                                                                   ]],
          },

          {
            [[                                                    ]],
            [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
            [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
            [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
            [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
            [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
            [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
            [[                                                    ]],
          },

          {
            [[                                                     ]],
            [[  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ ]],
            [[  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ]],
            [[ ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ]],
            [[ ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ]],
            [[ ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ]],
            [[ ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ]],
            [[ ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ]],
            [[    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ]],
            [[          ░    ░  ░    ░ ░        ░   ░         ░    ]],
            [[                                 ░                   ]],
            [[                                                     ]],
          },

          {
            [[                                                                   ]],
            [[ ███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄   ]],
            [[ ███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄ ]],
            [[ ███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███ ]],
            [[ ███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███ ]],
            [[ ███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███ ]],
            [[ ███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███ ]],
            [[ ███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███ ]],
            [[  ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀  ]],
            [[                                                                   ]],
          },

          {
            [[                                   ]],
            [[  ▐ ▄ ▄▄▄ .       ▌ ▐·▪  • ▌ ▄ ·.  ]],
            [[ •█▌▐█▀▄.▀·▪     ▪█·█▌██ ·██ ▐███▪ ]],
            [[ ▐█▐▐▌▐▀▀▪▄ ▄█▀▄ ▐█▐█•▐█·▐█ ▌▐▌▐█· ]],
            [[ ██▐█▌▐█▄▄▌▐█▌.▐▌ ███ ▐█▌██ ██▌▐█▌ ]],
            [[ ▀▀ █▪ ▀▀▀  ▀█▄▀▪. ▀  ▀▀▀▀▀  █▪▀▀▀ ]],
            [[                                   ]],
          },

          {
            [[                                       ]],
            [[    ▄   ▄███▄   ████▄     ▄   ▄█ █▀▄▀█ ]],
            [[     █  █▀   ▀  █   █      █  ██ █ █ █ ]],
            [[ ██   █ ██▄▄    █   █ █     █ ██ █ ▄ █ ]],
            [[ █ █  █ █▄   ▄▀ ▀████  █    █ ▐█ █   █ ]],
            [[ █  █ █ ▀███▀           █  █   ▐    █  ]],
            [[ █   ██                  █▐        ▀   ]],
            [[                         ▐             ]],
            [[                                       ]],
          },

          {
            [[                                                      ]],
            [[ ##    ## ########  #######  ##     ## #### ##     ## ]],
            [[ ###   ## ##       ##     ## ##     ##  ##  ###   ### ]],
            [[ ####  ## ##       ##     ## ##     ##  ##  #### #### ]],
            [[ ## ## ## ######   ##     ## ##     ##  ##  ## ### ## ]],
            [[ ##  #### ##       ##     ##  ##   ##   ##  ##     ## ]],
            [[ ##   ### ##       ##     ##   ## ##    ##  ##     ## ]],
            [[ ##    ## ########  #######     ###    #### ##     ## ]],
            [[                                                      ]],
          },

          {
            [[                                                            ]],
            [[ 888b    888                  888     888 d8b               ]],
            [[ 8888b   888                  888     888 Y8P               ]],
            [[ 88888b  888                  888     888                   ]],
            [[ 888Y88b 888  .d88b.   .d88b. Y88b   d88P 888 88888b.d88b.  ]],
            [[ 888 Y88b888 d8P  Y8b d88""88b Y88b d88P  888 888 "888 "88b ]],
            [[ 888  Y88888 88888888 888  888  Y88o88P   888 888  888  888 ]],
            [[ 888   Y8888 Y8b.     Y88..88P   Y888P    888 888  888  888 ]],
            [[ 888    Y888  "Y8888   "Y88P"     Y8P     888 888  888  888 ]],
            [[                                                            ]],
          },

          {
            [[                       ]],
            [[ 78 101 111 86 105 109 ]],
            [[                       ]],
          },

          {
            [[                                                                         ]],
            [[                               :                                         ]],
            [[ L.                     ,;    t#,                                        ]],
            [[ EW:        ,ft       f#i    ;##W.              t                        ]],
            [[ E##;       t#E     .E#t    :#L:WE              Ej            ..       : ]],
            [[ E###t      t#E    i#W,    .KG  ,#D  t      .DD.E#,          ,W,     .Et ]],
            [[ E#fE#f     t#E   L#D.     EE    ;#f EK:   ,WK. E#t         t##,    ,W#t ]],
            [[ E#t D#G    t#E :K#Wfff;  f#.     t#iE#t  i#D   E#t        L###,   j###t ]],
            [[ E#t  f#E.  t#E i##WLLLLt :#G     GK E#t j#f    E#t      .E#j##,  G#fE#t ]],
            [[ E#t   t#K: t#E  .E#L      ;#L   LW. E#tL#i     E#t     ;WW; ##,:K#i E#t ]],
            [[ E#t    ;#W,t#E    f#E:     t#f f#:  E#WW,      E#t    j#E.  ##f#W,  E#t ]],
            [[ E#t     :K#D#E     ,WW;     f#D#;   E#K:       E#t  .D#L    ###K:   E#t ]],
            [[ E#t      .E##E      .D#;     G#t    ED.        E#t :K#t     ##D.    E#t ]],
            [[ ..         G#E        tt      t     t          E#t ...      #G      ..  ]],
            [[             fE                                 ,;.          j           ]],
            [[              ,                                                          ]],
            [[                                                                         ]],
          },

          {
            [[                                                     ]],
            [[  __  __                 __  __                      ]],
            [[ /\ \/\ \               /\ \/\ \  __                 ]],
            [[ \ \ `\\ \     __    ___\ \ \ \ \/\_\    ___ ___     ]],
            [[  \ \ , ` \  /'__`\ / __`\ \ \ \ \/\ \ /' __` __`\   ]],
            [[   \ \ \`\ \/\  __//\ \L\ \ \ \_/ \ \ \/\ \/\ \/\ \  ]],
            [[    \ \_\ \_\ \____\ \____/\ `\___/\ \_\ \_\ \_\ \_\ ]],
            [[     \/_/\/_/\/____/\/___/  `\/__/  \/_/\/_/\/_/\/_/ ]],
            [[                                                     ]],
          },

          {
            [[                                                                  ]],
            [[     _/      _/                      _/      _/  _/               ]],
            [[    _/_/    _/    _/_/      _/_/    _/      _/      _/_/_/  _/_/  ]],
            [[   _/  _/  _/  _/_/_/_/  _/    _/  _/      _/  _/  _/    _/    _/ ]],
            [[  _/    _/_/  _/        _/    _/    _/  _/    _/  _/    _/    _/  ]],
            [[ _/      _/    _/_/_/    _/_/        _/      _/  _/    _/    _/   ]],
            [[                                                                  ]],
          },

          {
            [[                     ]],
            [[ -. . --- ...- .. -- ]],
            [[                     ]],
          },

          {
            [[                                                                       ]],
            [[                                                                     ]],
            [[       ████ ██████           █████      ██                     ]],
            [[      ███████████             █████                             ]],
            [[      █████████ ███████████████████ ███   ███████████   ]],
            [[     █████████  ███    █████████████ █████ ██████████████   ]],
            [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
            [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
            [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
            [[                                                                       ]],
          },
        }

        -- Pick a random header
        math.randomseed(os.time())
        dashboard.section.header.val = headers[math.random(#headers)]
        -- Buttons
        dashboard.section.buttons.val = {
          dashboard.button('f', '🔍  Find file', ':Telescope find_files<CR>'),
          dashboard.button('n', '📄  New file', ':ene <BAR> startinsert<CR>'),
          dashboard.button('r', '🕘  Recent files', ':Telescope oldfiles<CR>'),
          dashboard.button('g', '🔎  Grep text', ':Telescope live_grep<CR>'),
          dashboard.button('c', '🔧  Config', ':e $MYVIMRC<CR>'),
          dashboard.button('q', '🚪  Quit NVIM', ':qa<CR>'),
        }

        -- Footer
        dashboard.section.footer.val = '🚀 Happy Hacking with Neovim!'
        dashboard.section.footer.opts.hl = 'Type'

        -- Setup Alpha
        alpha.setup(dashboard.config)

        -- Autostart Alpha when no file or directory is passed, or when `nvim .` is used
        vim.api.nvim_create_autocmd('VimEnter', {
          callback = function()
            local arg = vim.fn.argv()[1]
            local is_dir = arg and vim.fn.isdirectory(arg) == 1

            if (vim.fn.argc() == 0 or is_dir) and vim.bo.filetype == '' then
              vim.cmd 'enew' -- open new empty buffer
              vim.cmd 'silent! bwipeout #' -- wipe the previous buffer (dir buffer)
              require('alpha').start()
            end
          end,
        })
      end,
    },
    -- smear cursor
    --
    { 'tpope/vim-surround' },

    {
      'sphamba/smear-cursor.nvim',
      opts = {},
    },

    --
    -- ts tool
    --
    {
      'pmizio/typescript-tools.nvim',
      dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
      opts = {},
    },
    --
    -- python gen
    --
    {
      'danymat/neogen',
      dependencies = 'nvim-treesitter/nvim-treesitter',
      config = true,
    },
    {
      'kopecmaciej/vi-mongo.nvim',
      config = function()
        require('vi-mongo').setup()
      end,
      cmd = { 'ViMongo' },
      keys = {
        { '<leader>vm', '<cmd>ViMongo<cr>', desc = 'ViMongo' },
      },
    },
    {
      -- Bufferline
      {
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
      },
    },
    {
      'tpope/vim-dadbod',
      dependencies = {
        'kristijanhusak/vim-dadbod-ui',
        'kristijanhusak/vim-dadbod-completion',
      },
      config = function()
        vim.g.db_ui_use_nerd_fonts = 1
      end,
    },
    --
    -- indent blank line
    --
    {
      'echasnovski/mini.nvim',
      version = '*',
      config = function()
        require('mini.indentscope').setup {
          draw = {
            delay = 100,
            animation = require('mini.indentscope').gen_animation.linear(), -- hoặc .linear() nếu bạn muốn có animation
            predicate = function(scope)
              return not scope.body.is_incomplete
            end,
            priority = 2,
          },

          mappings = {
            object_scope = 'ii',
            object_scope_with_border = 'ai',
            goto_top = '[i',
            goto_bottom = ']i',
          },

          options = {
            border = 'both',
            indent_at_cursor = true,
            n_lines = 10000,
            try_as_border = false,
          },

          symbol = '╎',
        }
      end,
    },
    --
    -- cappuchin
    --
    {
      'catppuccin/nvim',
      name = 'catppuccin',
      priority = 1000,
      config = function()
        require('catppuccin').setup {
          flavour = 'mocha', -- latte, frappe, macchiato, mocha
          integrations = {
            treesitter = true,
            native_lsp = {
              enabled = true,
              virtual_text = {
                errors = { 'italic' },
                hints = { 'italic' },
                warnings = { 'italic' },
                information = { 'italic' },
              },
            },
            indent_blankline = {
              enabled = true,
              scope_color = 'lavender',
              char = '▏',
            },
          },
        }
      end,
    },
    {
      'mbbill/undotree',
      keys = {
        { '<leader>u', '<cmd>UndotreeToggle<CR>', desc = 'Toggle UndoTree' },
      },
      config = function()
        vim.g.undotree_SetFocusWhenToggle = 1
      end,
    },
    {
      'gbprod/yanky.nvim',
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        ring = {
          history_length = 100,
          storage = 'shada',
          storage_path = vim.fn.stdpath 'data' .. '/databases/yanky.db', -- Only for sqlite storage
          sync_with_numbered_registers = true,
          cancel_event = 'update',
          ignore_registers = { '_' },
          update_register_on_cycle = false,
          permanent_wrapper = nil,
        },
        picker = {
          select = {
            action = nil, -- nil to use default put action
          },
          telescope = {
            use_default_mappings = true, -- if default mappings should be used
            mappings = nil, -- nil to use default mappings or no mappings (see `use_default_mappings`)
          },
        },
        system_clipboard = {
          sync_with_ring = true,
          clipboard_register = nil,
        },
        highlight = {
          on_put = true,
          on_yank = true,
          timer = 500,
        },
        preserve_cursor_position = {
          enabled = true,
        },
        textobj = {
          enabled = false,
        },
      },
    },
    {
      'olimorris/onedarkpro.nvim',
      priority = 1000, -- Ensure it loads first
      config = function()
        require('onedarkpro').setup {
          colors = {}, -- You can customize colors here
          styles = {
            comments = 'italic',
            keywords = 'bold',
            functions = 'bold',
            variables = 'NONE',
          },
          options = {
            cursorline = true, -- Highlight current line
            transparency = false, -- Disable background transparency
            terminal_colors = true, -- Enable terminal colors
          },
        }
      end,
    },

    --
    -- Chat gpt
    --
  },

  -- The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  { import = 'custom.plugins' },
  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move a line up or down using J / K
keymap('n', 'J', ':m .+1<CR>==', opts) -- Move current line down
keymap('n', 'K', ':m .-2<CR>==', opts) -- Move current line up

-- Move selected lines up or down (Visual Mode)
keymap('v', 'J', ":m '>+1<CR>gv=gv", opts) -- Move selected lines down
keymap('v', 'K', ":m '<-2<CR>gv=gv", opts) -- Move selected lines up

local function toggle_autosave()
  autosave_enabled = not autosave_enabled -- Toggle the state
  if autosave_enabled then
    vim.cmd 'autocmd TextChanged,InsertLeave * silent! wa' -- Enable auto-save
    print '📝 Auto-save: ON'
  else
    vim.cmd 'autocmd! TextChanged,InsertLeave' -- Disable auto-save
    print '🚫 Auto-save: OFF'
  end
end

vim.api.nvim_set_keymap('n', '<Leader>as', ':lua toggle_autosave()<CR>', { noremap = true, silent = true })

--
-- buffer line key bind
--
vim.api.nvim_set_keymap('n', '=', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '-', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bd', ':bdelete<CR>', { noremap = true, silent = true }) -- Close buffer
vim.api.nvim_set_keymap('n', '<Leader>bp', ':BufferLinePick<CR>', { noremap = true, silent = true }) -- Pick buffer
vim.keymap.set('n', '<leader>cg', '<cmd>ChatGPT<CR>', { desc = 'ChatGPT UI' })
vim.keymap.set('v', '<leader>ce', ':ChatGPTEditWithInstructions<CR>', { desc = 'Edit with GPT' })
vim.keymap.set('n', '<leader>cr', '<cmd>ChatGPTRun<CR>', { desc = 'Run GPT Action' })
vim.keymap.set('n', '<leader>du', function()
  require('dapui').toggle()
end, { desc = '[D]AP [U]I Toggle' })
-- Open/close DB UI
vim.keymap.set('n', '<leader>db', '<cmd>DBUI<CR>', { desc = 'Open DB UI' })

-- Toggle DB UI
vim.keymap.set('n', '<leader>dt', '<cmd>DBUIToggle<CR>', { desc = 'Toggle DB UI' })

-- Save current query buffer and execute it
vim.keymap.set('n', '<leader>dq', '<cmd>DB<CR>', { desc = 'Execute SQL Query' })
vim.keymap.set('n', '<leader>x', ':bd!<CR>', { noremap = true, silent = true, desc = 'Force Close Buffer' })

vim.keymap.set('n', ']p', '<Plug>(YankyPutIndentAfterLinewise)')
vim.keymap.set('n', '[p', '<Plug>(YankyPutIndentBeforeLinewise)')
vim.keymap.set('n', ']P', '<Plug>(YankyPutIndentAfterLinewise)')
vim.keymap.set('n', '[P', '<Plug>(YankyPutIndentBeforeLinewise)')

vim.keymap.set('n', '>p', '<Plug>(YankyPutIndentAfterShiftRight)')
vim.keymap.set('n', '<p', '<Plug>(YankyPutIndentAfterShiftLeft)')
vim.keymap.set('n', '>P', '<Plug>(YankyPutIndentBeforeShiftRight)')
vim.keymap.set('n', '<P', '<Plug>(YankyPutIndentBeforeShiftLeft)')
vim.keymap.set('n', '=p', '<Plug>(YankyPutAfterFilter)')
vim.keymap.set('n', '=P', '<Plug>(YankyPutBeforeFilter)')

vim.keymap.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)')
vim.keymap.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)')
vim.keymap.set({ 'n', 'x' }, 'gp', '<Plug>(YankyGPutAfter)')
vim.keymap.set({ 'n', 'x' }, 'gP', '<Plug>(YankyGPutBefore)')

vim.keymap.set('n', '<c-p>', '<Plug>(YankyPreviousEntry)')
vim.keymap.set('n', '<c-n>', '<Plug>(YankyNextEntry)')

vim.opt.termguicolors = true

require('bufferline').setup {
  options = {
    hover = {
      enabled = true,
      delay = 150,
      reveal = { 'close' },
    },
  },
}

-- Disable background in Normal and other modes
vim.cmd [[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi Pmenu guibg=NONE ctermbg=NONE
  hi FloatBorder guibg=NONE ctermbg=NONE
  hi NormalFloat guibg=NONE ctermbg=NONE
  hi VertSplit guibg=NONE ctermbg=NONE
  hi SignColumn guibg=NONE ctermbg=NONE
  hi StatusLine guibg=NONE ctermbg=NONE
  hi TabLineFill guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
]]
