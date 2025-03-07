# Quan "Legion" Doan vim config

██╗    ██╗   ██╗███████╗███████╗    ██╗   ██╗██╗███╗   ███╗    ██████╗ ████████╗██╗    ██╗
██║    ██║   ██║██╔════╝██╔════╝    ██║   ██║██║████╗ ████║    ██╔══██╗╚══██╔══╝██║    ██║
██║    ██║   ██║███████╗█████╗      ██║   ██║██║██╔████╔██║    ██████╔╝   ██║   ██║ █╗ ██║
██║    ██║   ██║╚════██║██╔══╝      ╚██╗ ██╔╝██║██║╚██╔╝██║    ██╔══██╗   ██║   ██║███╗██║
██║    ╚██████╔╝███████║███████╗     ╚████╔╝ ██║██║ ╚═╝ ██║    ██████╔╝   ██║   ╚███╔███╔╝
╚═╝     ╚═════╝ ╚══════╝╚══════╝      ╚═══╝  ╚═╝╚═╝     ╚═╝    ╚═════╝    ╚═╝    ╚══╝╚══╝ 

## Installation

### Install External Dependencies

Required:
- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- Clipboard tool (xclip/xsel/win32yank)
- A [Nerd Font](https://www.nerdfonts.com/) (optional)

### Install Configuration

```sh
git clone https://github.com/quandoan21-legion/QuanLegionDoanVimRC.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

## Plugin Overview

### Core Plugins
- **lazy.nvim**: Modern plugin manager
- **nvim-treesitter**: Advanced syntax highlighting
- **tokyonight.nvim**: Main color scheme

### Git Integration
- **gitsigns.nvim**: Git decorations and hunk management
- **lazygit.nvim**: Terminal UI for git commands
- **vim-fugitive**: Git commands integration
- **vim-rhubarb**: GitHub integration

### UI Enhancement
- **noice.nvim**: Improved UI notifications
- **neo-tree.nvim**: File explorer
- **bufferline.nvim**: Buffer management
- **lualine.nvim**: Status line
- **dashboard-nvim**: Start screen
- **indent-blankline.nvim**: Indentation guides
- **rainbow-delimiters.nvim**: Rainbow brackets

### IDE Features
- **nvim-lspconfig**: LSP configuration
- **mason.nvim**: Package manager for LSP
- **nvim-cmp**: Completion engine
- **LuaSnip**: Snippet engine
- **telescope.nvim**: Fuzzy finder
- **which-key.nvim**: Keybinding helper

### AI and Code Assistance
- **copilot.lua**: GitHub Copilot integration
- **CopilotChat.nvim**: AI chat integration

### Editor Enhancement
- **auto-save.nvim**: Automatic file saving
- **toggleterm.nvim**: Terminal integration
- **conform.nvim**: Code formatting
- **todo-comments.nvim**: TODO highlighting
- **mini.nvim**: Various small utilities

### Code Quality
- **mason-lspconfig.nvim**: LSP configurations
- **mason-tool-installer.nvim**: Automatic tool installation
- **fidget.nvim**: LSP progress UI

### Key Features
- 🎨 Modern and clean UI with Tokyo Night theme
- 🌈 Rainbow brackets and indent guides
- 🤖 GitHub Copilot integration
- 📦 Automatic LSP setup
- 💾 Auto-save functionality
- 🔍 Fuzzy finding with Telescope
- 🐙 Comprehensive Git integration
- ⚡ Fast startup time
- 🔧 Easy configuration

### Default Keymaps

#### General
- `<Space>`: Leader key
- `<leader>e`: Toggle file explorer
- `<leader>sf`: Find files
- `<leader>sg`: Live grep
- `<leader>f`: Format buffer

#### Git
- `<leader>lg`: Open LazyGit
- `<leader>gs`: Git status
- `<leader>gb`: Git blame

#### Copilot
- `<leader>cc`: Toggle Copilot Chat
- `<leader>ce`: Explain code
- `<leader>ct`: Generate tests

#### Terminal
- `<S-T>`: Toggle floating terminal
