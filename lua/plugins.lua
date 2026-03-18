local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("configs/catppuccin")
        end,
    },

    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require("configs/dashboard")
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        config = function()
            require("configs/nvim-tree")
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        "akinsho/bufferline.nvim",
        version = "*",
        config = function()
            require("configs/bufferline")
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("configs/lualine")
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        config = function()
            require("configs/snacks")
        end,
    },

    {
        "hedyhli/outline.nvim",
        config = function()
            require("configs/outline")
        end,
    },

    {
        "numToStr/Comment.nvim",
        config = function()
            require("configs/comment")
        end,
    },

    {
        "johnfrankmorgan/whitespace.nvim",
        config = function()
            require("configs/whitespace")
        end,
    },

    {
        "jake-stewart/multicursor.nvim",
        config = function()
            require("configs/multicursor")
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("configs/gitsigns")
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("configs/treesitter")
        end,
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("configs/autopairs")
        end,
    },

    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("configs/mason")
        end,
    },

    {
        "saghen/blink.cmp",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
            "Kaiser-Yang/blink-cmp-avante",
        },
        version = "*",
        config = function()
            require("configs/blink-cmp")
        end,
    },

    {
        "nvimdev/lspsaga.nvim",
        config = function()
            require("configs/lspsaga")
        end,
    },

    {
        "Mr-LLLLL/interestingwords.nvim",
        config = function()
            require("configs/interestingwords")
        end,
    },

    {
        "RRethy/vim-illuminate",
        config = function()
            require("configs/illuminate")
        end,
    },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },

    {
        "yetone/avante.nvim",
        build = vim.fn.has("win32") ~= 0
                and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
            or "make",
        event = "VeryLazy",
        version = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "folke/snacks.nvim",
        },

        keys = require("configs/avante").keys,
        opts = require("configs/avante").opts,
    },

    {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
            file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
    },

    {
        "ravitemer/mcphub.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        build = "npm install -g mcp-hub@latest",
        config = function()
            require("configs/mcphub")
        end,
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("configs/noice")
        end,
    },

    {
        "nmac427/guess-indent.nvim",
        opts = {},
    },

    "sindrets/diffview.nvim",

    {
        "stevearc/conform.nvim",
        config = function()
            require("configs/conform")
        end,
    },
})
