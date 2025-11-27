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
        priority = 1000
    },

    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require("configs/dashboard")
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        }
    },

    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        config = function ()
            require("configs/nvim-tree")
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },

    {
        "akinsho/bufferline.nvim",
        version = "*",
        config = function ()
            require("configs/bufferline")
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },

    {
        "nvim-lualine/lualine.nvim",
        config = function ()
            require("configs/lualine")
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        config = function ()
            require("configs/telescope")
        end,
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    {
        "hedyhli/outline.nvim",
        config = function ()
            require("configs/outline")
        end
    },

    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function ()
            require("configs/toggleterm")
        end
    },

    {
        "numToStr/Comment.nvim",
        config = function ()
            require("configs/comment")
        end
    },

    {
        "johnfrankmorgan/whitespace.nvim",
        config = function ()
            require("configs/whitespace")
        end
    },

    {
        "brenton-leighton/multiple-cursors.nvim",
        opts = require("configs/multiple-cursors").opts,
        keys = require("configs/multiple-cursors").keys
    },

    {
        "lewis6991/gitsigns.nvim",
        config = function ()
            require("configs/gitsigns")
        end
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            require("configs/treesitter")
        end
    },

    {
        "crusj/bookmarks.nvim",
        branch = "main",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("configs/bookmarks")
        end
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("configs/autopairs")
        end
    },

    -- lsp plugins
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "onsails/lspkind.nvim",

    {
        "hrsh7th/nvim-cmp",
        config = function ()
            require("configs/nvim-cmp")
        end,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        }
    },

    {
        "nvimdev/lspsaga.nvim",
        config = function ()
            require("configs/lspsaga")
        end
    },

    {
        "Mr-LLLLL/interestingwords.nvim",
        config = function ()
            require("configs/interestingwords")
        end
    },

    {
        "RRethy/vim-illuminate",
        config = function ()
            require("configs/illuminate")
        end
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
        "j-hui/fidget.nvim",
        opts = {}
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
        },

        keys = require("configs/avante").keys,
        opts = require("configs/avante").opts
    },
})
