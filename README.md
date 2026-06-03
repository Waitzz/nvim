# Neovim Config

A powerful and highly customizable Neovim configuration based on Lua, using Lazy.nvim as the plugin manager.

## 🚀 Installation

### Prerequisites

- Neovim >= 0.12.0
- Git >= 2.31.0
- Cargo
- Node.js >= v20.0.0
- tree-sitter-cli
- Python >= 3.12
- mcp-hub

### Install Dependencies

```bash
# Install tree-sitter-cli using Cargo
cargo install --locked tree-sitter-cli

# Install mcp-hub using npm
npm install -g mcp-hub@latest
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