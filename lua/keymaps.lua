local keymap_opts = {
    noremap = true, -- non-recursive
    silent = true, -- do not show message
}

vim.keymap.set("n", "<leader>t", "<cmd>Outline<CR>", keymap_opts)

-- delete default mapping from v0.10.1
vim.keymap.del("n", "grr", {})
vim.keymap.del("n", "gri", {})
vim.keymap.del("x", "gra", {})
vim.keymap.del("n", "gra", {})
vim.keymap.del("n", "grn", {})

-- delete default mapping from v0.11.2
vim.keymap.del("n", "grt", {})
