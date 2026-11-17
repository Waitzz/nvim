local is_ok, codecompanion = pcall(require, "codecompanion")
if not is_ok then
    return
end

vim.keymap.set(
    { "n", "v" },
    "<C-a>",
    "<cmd>CodeCompanionActions<cr>",
    { silent = true, desc = "CodeCompanion Actions" }
)
vim.keymap.set(
    { "n", "v" },
    "<LocalLeader>a",
    "<cmd>CodeCompanionChat Toggle<cr>",
    { silent = true, desc = "CodeCompanion Chat" }
)
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { silent = true, desc = "CodeCompanion Add Selection" })
vim.keymap.set(
    "n",
    "<LocalLeader>r",
    "<cmd>CodeCompanionCodeReview<cr>",
    { silent = true, desc = "CodeCompanion Review" }
)

vim.cmd([[cab cc CodeCompanion]])

codecompanion.setup({
    display = {
        chat = {
            window = {
                position = "right",
                width = 0.3,
                opts = {
                    number = false,
                },
            },

            input = {
                layout = "split",
                height = 8,
            },

            fold_context = true,
        },
    },

    interactions = {
        chat = {
            adapter = "opencode",
        },
        inline = {
            adapter = "opencode",
        },
    },

    adapters = {
        acp = {
            extend = {
                opencode = {
                    env = {
                        OPENCODE_CONFIG_CONTENT = vim.json.encode({
                            permission = {
                                edit = "ask",
                                bash = "allow",
                            },
                        }),
                    },
                },
            },
        },
    },
})
