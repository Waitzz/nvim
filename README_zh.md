# Neovim 配置

一个功能强大、易于定制的 Neovim 配置，基于 Lua 配置，使用 Lazy.nvim 作为插件管理器。

## 🚀 安装

### 前置要求

- Neovim >= 0.12.0
- Git >= 2.31.0
- Cargo
- Node.js >= v20.0.0
- tree-sitter-cli
- Python >= 3.12
- mcp-hub

### 安装依赖

```bash
# 使用 Cargo 安装 tree-sitter-cli
cargo install --locked tree-sitter-cli

# 使用 npm 安装 mcp-hub
npm install -g mcp-hub@latest
```

### 安装步骤

1. 备份现有配置

```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

2. 克隆本配置

```bash
git clone https://github.com/Waitzz/nvim.git ~/.config/nvim
```

3. 启动 Neovim

```bash
nvim
```

Lazy.nvim 会自动安装所有插件。

## 📁 配置结构

```
~/.config/nvim/
├── init.lua           # 主入口文件
├── lua/
│   ├── options.lua     # 基础选项设置
│   ├── keymaps.lua     # 全局快捷键
│   ├── colorscheme.lua # 主题配置
│   ├── lsp.lua         # LSP 配置
│   ├── plugins.lua     # 插件列表
│   └── configs/        # 各插件配置文件
└── README.md           # 项目文档
```

## 🎨 定制

### 修改主题

在 `lua/colorscheme.lua` 中修改主题名称：

```lua
local colorscheme = "catppuccin-mocha"  -- 更改为你喜欢的主题
```

### 添加插件

在 `lua/plugins.lua` 中添加新插件：

```lua
{
    "作者/插件名",
    config = function()
        require("configs/插件配置")
    end,
},
```

### 自定义选项

在 `lua/options.lua` 中修改基础选项和设置。
