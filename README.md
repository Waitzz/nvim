# Neovim Config

A powerful and highly customizable Neovim configuration based on Lua, using Lazy.nvim as the plugin manager.

## ✨ Features

- 🎨 **Modern UI**: Beautiful interface with Catppuccin theme and icons
- 🚀 **Fast Navigation**: Integrated Telescope, NvimTree and Outline plugins for efficient file and code browsing
- 💡 **Intelligent Completion**: Fast code completion experience with blink.cmp
- 🤖 **AI Assistant**: Integrated Avante.nvim and MCP Hub for AI-assisted programming
- 📝 **Markdown Support**: Complete Markdown preview and editing features
- 🔧 **Development Tools**: Built-in LSP, Treesitter, Git tools and terminal
- ⚙️ **Highly Customizable**: Modular configuration, easy to extend and maintain

## 📦 Main Plugins

### UI/Interface
- **catppuccin/nvim** - Theme system
- **nvimdev/dashboard-nvim** - Startup dashboard
- **nvim-tree/nvim-tree.lua** - File tree
- **akinsho/bufferline.nvim** - Buffer tabs
- **nvim-lualine/lualine.nvim** - Status line
- **folke/noice.nvim** - Command line interface

### Editing Enhancement
- **nvim-treesitter/nvim-treesitter** - Syntax highlighting
- **windwp/nvim-autopairs** - Auto pairing
- **numToStr/Comment.nvim** - Commenting utility
- **jake-stewart/multicursor.nvim** - Multi-cursor support
- **RRethy/vim-illuminate** - Highlight current variable
- **johnfrankmorgan/whitespace.nvim** - Whitespace handling

### Navigation & Search
- **nvim-telescope/telescope.nvim** - Fuzzy finder
- **hedyhli/outline.nvim** - Code outline
- **crusj/bookmarks.nvim** - Bookmark management

### AI & Intelligent Features
- **yetone/avante.nvim** - AI programming assistant
- **ravitemer/mcphub.nvim** - MCP protocol support
- **saghen/blink.cmp** - Intelligent code completion

### Development Tools
- **williamboman/mason.nvim** - LSP management
- **neovim/nvim-lspconfig** - LSP configuration
- **nvimdev/lspsaga.nvim** - LSP UI enhancement
- **lewis6991/gitsigns.nvim** - Git signs
- **akinsho/toggleterm.nvim** - Terminal toggle

## 🚀 Installation

### Prerequisites
- Neovim >= 0.11.0
- Git >= 2.31.0
- Cargo
- Node.js >= v20.0.0
- tree-sitter-cli

### Install Dependencies

```bash
# Install tree-sitter-cli using Cargo
cargo install --locked tree-sitter-cli
```

### Installation Steps

1. Backup existing configuration
```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

2. Clone this configuration
```bash
git clone https://github.com/Waitzz/nvim.git ~/.config/nvim
```

3. Start Neovim
```bash
nvim
```

Lazy.nvim will automatically install all plugins.

## ⌨️ Keybindings

### Basic Navigation
- `<leader>e` - Toggle file tree
- `<leader>t` - Toggle code outline
- `<F12>` - Toggle terminal

### AI Features
- `<leader>a+` - Select current file in NvimTree (Avante extension)

### LSP Features
Standard LSP keybindings are automatically configured by Lazy.nvim.

## 📁 Configuration Structure

```
~/.config/nvim/
├── init.lua           # Main entry file
├── lua/
│   ├── options.lua     # Basic options settings
│   ├── keymaps.lua     # Global keybindings
│   ├── colorscheme.lua # Theme configuration
│   ├── lsp.lua         # LSP configuration
│   ├── plugins.lua     # Plugin list
│   └── configs/        # Individual plugin configurations
└── README.md           # Project documentation
```

## 🎨 Customization

### Change Theme
Modify the theme name in `lua/colorscheme.lua`:

```lua
local colorscheme = "catppuccin-mocha"  -- Change to your preferred theme
```

### Add Plugins
Add new plugins in `lua/plugins.lua`:

```lua
{
    "author/plugin-name",
    config = function()
        require("configs/plugin-config")
    end,
},
```

### Custom Options
Modify basic options and settings in `lua/options.lua`.

## 🛠 Maintenance

### Update Plugins
```vim
:Lazy update
```

### Clean Unused Plugins
```vim
:Lazy clean
```

## 📝 License

This project is licensed under the MIT License. See LICENSE file for details.

---

**Tip**: If you encounter any issues, you can check the Lazy.nvim status (`:Lazy`) and LSP logs (`:LspInfo`) to diagnose problems.