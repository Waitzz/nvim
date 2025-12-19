local is_ok, blink_cmp = pcall(require, "blink.cmp")
if not is_ok then
    return
end

blink_cmp.setup({
    keymap = {
        preset = "super-tab",

        ["<Tab>"] = {
            "select_next",
            "fallback"
        },

        ["<S-Tab>"] = {
            "select_prev",
            "fallback"
        },

        ["<CR>"] = {
            "accept",
            "fallback"
        }
    },
    sources = {
        default = { "avante", "lsp", "path", "snippets", "buffer" },
        providers = {
            avante = {
                module = "blink-cmp-avante",
                name = "Avante",
            }
        }
    },
    completion = {
        documentation = { auto_show = true },
        accept = { auto_brackets = { enabled = true } },
        list = { selection = { preselect = false } }
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
})

