if Snacks == nil then
    return
end

Snacks.setup({
    dashboard = {
        enabled = true,
        sections = {
            { section = "header" },
            { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
            { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
            { icon = " ", title = "Recent Files", section = "recent_files", cwd = true, indent = 2, padding = 1 },
            { section = "startup" },
        },
    },

    explorer = {
        enabled = true,
    },

    words = {
        enabled = true,
    },

    notifier = {
        enabled = true,
    },

    picker = {
        sources = {
            explorer = {
                layout = { layout = { position = "right" } },
                auto_close = true,
            },
        },
    },
})

-- picker
-- ,f group: find
vim.keymap.set("n", "<leader>ff", function()
    Snacks.picker.files()
end, { desc = "Find Files" })

vim.keymap.set("n", "<leader><space>", function()
    Snacks.picker.files()
end, { desc = "Find Files" })

vim.keymap.set("n", "<leader>fr", function()
    Snacks.picker.recent()
end, { desc = "Recent Files" })

vim.keymap.set("n", "<leader>fb", function()
    Snacks.picker.buffers()
end, { desc = "Buffers" })

vim.keymap.set("n", "<leader>,", function()
    Snacks.picker.buffers()
end, { desc = "Buffers" })

-- ,s group: search
vim.keymap.set("n", "<leader>/", function()
    Snacks.picker.grep()
end, { desc = "Grep" })

vim.keymap.set("n", "<leader>sg", function()
    Snacks.picker.grep()
end, { desc = "Grep" })

vim.keymap.set({ "n", "x" }, "<leader>sw", function()
    Snacks.picker.grep_word()
end, { desc = "Visual selection or word" })

vim.keymap.set("n", "<leader>ss", function()
    Snacks.picker.lsp_symbols()
end, { desc = "LSP Document Symbols" })

vim.keymap.set("n", "<leader>sS", function()
    Snacks.picker.lsp_workspace_symbols()
end, { desc = "LSP Workspace Symbols" })

-- terminal
vim.keymap.set({ "n", "t" }, "<F12>", function()
    Snacks.terminal.toggle(nil, { win = { style = "float", border = "rounded" } })
end, { desc = "Toggle Terminal" })

-- dashboard
vim.api.nvim_create_user_command("Dashboard", function()
    Snacks.dashboard()
end, {})

-- explorer
vim.keymap.set("n", "<leader>e", function()
    Snacks.explorer()
end, { desc = "File Explorer" })
