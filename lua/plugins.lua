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
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = true,
    },

    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require("configs/dashboard")
        end,
        dependencies = {
            "ahmedkhalf/project.nvim",
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
        branch = 'main',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("configs/bookmarks")
        end
    },

    {
        "ahmedkhalf/project.nvim",
        config = function ()
            require("configs/project")
        end
    },

    -- lsp plugins
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
})
