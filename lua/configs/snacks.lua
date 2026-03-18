if Snacks == nil then
    return
end

vim.keymap.set("n", "<leader>f", function()
    Snacks.picker.files()
end, { desc = "Find Files" })

vim.keymap.set("n", "<leader>g", function()
    Snacks.picker.grep()
end, { desc = "Grep" })

vim.keymap.set("n", "<leader>b", function()
    Snacks.picker.buffers()
end, { desc = "Buffers" })

vim.keymap.set({ "n", "x" }, "<leader>w", function()
    Snacks.picker.grep_word()
end, { desc = "Visual selection or word" })

vim.keymap.set("n", "<leader>s", function()
    Snacks.picker.lsp_workspace_symbols()
end, { desc = "LSP Workspace Symbols" })
