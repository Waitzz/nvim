local is_ok, lspsaga = pcall(require, "lspsaga")
if not is_ok then
    return
end

vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", { silent = true, desc = "Goto Definition" })
vim.keymap.set("n", "gr", "<cmd>Lspsaga finder<cr>", { silent = true, desc = "Goto References" })
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", { silent = true, desc = "Hover Doc" })
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", { silent = true, desc = "Code Action" })
vim.keymap.set(
    "n",
    "<leader>cr",
    "<cmd>Lspsaga rename ++project<cr>",
    { silent = true, desc = "Code Rename (project)" }
)
vim.keymap.set("n", "gai", "<cmd>Lspsaga incoming_calls<cr>", { silent = true, desc = "Go At Incoming Calls" })
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { silent = true, desc = "Prev Diagnostic" })
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>", { silent = true, desc = "Next Diagnostic" })

lspsaga.setup({
    finder = {
        keys = {
            toggle_or_open = "<enter>",
            quit = "<esc>",
        },
    },

    outline = {
        layout = "float",
        keys = {
            toggle_or_jump = "<enter>",
            quit = "<esc>",
        },
    },

    callhierarchy = {
        keys = {
            edit = "<enter>",
            quit = "<esc>",
        },
    },

    diagnostic = {
        diagnostic_only_current = true,
    },

    rename = {
        keys = {
            quit = "<esc>",
        },
    },
})
