# Neovim 配置

一个功能强大、易于定制的 Neovim 配置，基于 Lua 配置，使用 Lazy.nvim 作为插件管理器。

## ✨ 特性

- 🎨 **现代 UI**：使用 Catppuccin 主题，支持美观的界面和图标
- 🚀 **快速导航**：集成 Telescope、NvimTree 和 Outline 插件，提供高效的文件和代码浏览
- 💡 **智能补全**：使用 blink.cmp 提供快速的代码补全体验
- 🤖 **AI 助手**：集成 Avante.nvim 和 MCP Hub，支持 AI 辅助编程
- 📝 ** Markdown 支持**：完整的 Markdown 预览和编辑功能
- 🔧 **开发工具**：内置 LSP、Treesitter、Git 工具和终端
- 📝 **代码格式化**：使用 Conform.nvim 自动格式化代码
- 🔍 **单词高亮**：彩色编码单词高亮，提高可读性
- 👁️ **增强 UI**：使用 Noice.nvim 提供现代命令行和通知系统
- ⚙️ **高度可定制**：模块化配置，易于扩展和维护

## 📦 主要插件

### UI/界面

- **catppuccin/nvim** - 主题系统
- **nvimdev/dashboard-nvim** - 启动界面
- **nvim-tree/nvim-tree.lua** - 文件树
- **akinsho/bufferline.nvim** - 标签栏
- **nvim-lualine/lualine.nvim** - 状态栏
- **folke/noice.nvim** - 命令行界面

### 编辑增强

- **nvim-treesitter/nvim-treesitter** - 语法高亮
- **windwp/nvim-autopairs** - 自动配对
- **numToStr/Comment.nvim** - 注释工具
- **jake-stewart/multicursor.nvim** - 多光标
- **RRethy/vim-illuminate** - 高亮当前变量
- **johnfrankmorgan/whitespace.nvim** - 空白字符处理

### 导航与搜索

- **nvim-telescope/telescope.nvim** - 模糊查找
- **hedyhli/outline.nvim** - 代码大纲
- **crusj/bookmarks.nvim** - 书签管理

### AI与智能功能

- **yetone/avante.nvim** - AI 编程助手
- **ravitemer/mcphub.nvim** - MCP 协议支持
- **saghen/blink.cmp** - 智能代码补全

### 代码格式化与增强

- **stevearc/conform.nvim** - 代码格式化
- **Mr-LLLLL/interestingwords.nvim** - 单词高亮
- **nmac427/guess-indent.nvim** - 智能缩进检测
- **sindrets/diffview.nvim** - Git 差异查看器

### UI/UX 增强

- **folke/noice.nvim** - 增强命令行和通知系统
- **iamcco/markdown-preview.nvim** - Markdown 预览
- **MeanderingProgrammer/render-markdown.nvim** - Markdown 渲染

### 开发工具

- **williamboman/mason.nvim** - LSP 管理
- **neovim/nvim-lspconfig** - LSP 配置
- **nvimdev/lspsaga.nvim** - LSP UI 增强
- **lewis6991/gitsigns.nvim** - Git 签名
- **akinsho/toggleterm.nvim** - 终端切换

## 🚀 安装

### 前置要求

- Neovim >= 0.11.0
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

## ⌨️ 快捷键

### 基础导航

- `<leader>e` - 切换文件树
- `<leader>t` - 切换代码大纲
- `<F12>` - 切换终端

### AI 功能

- `<leader>a+` - 在 NvimTree 中选择当前文件（Avante 扩展）
- `<leader>a-` - 在 NvimTree 中取消选择当前文件（Avante 扩展）

### 代码格式化

- `:Format` - 格式化当前缓冲区或选中范围

### Git 功能

- `:DiffviewOpen` - 打开 Git 差异视图
- `:DiffviewClose` - 关闭 Git 差异视图

### 单词高亮

- ` mw` - 高亮光标下的单词
- ` mW` - 取消高亮最后高亮的单词

### LSP 功能

基于 Lazy.nvim 自动设置，支持标准 LSP 快捷键

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

## 🛠 维护

### 更新插件

```vim
:Lazy update
```

### 清理未使用的插件

```vim
:Lazy clean
```

## 📝 许可证

本项目采用 MIT 许可证。详见 LICENSE 文件。

---

**提示**：如果遇到任何问题，可以先检查 Lazy.nvim 的状态 (`:Lazy`) 和 LSP 日志 (`:LspInfo`) 来诊断问题。
