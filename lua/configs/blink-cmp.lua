local is_ok, blink_cmp = pcall(require, "blink.cmp")
if not is_ok then
    return
end

local has_words_before = function()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    if col == 0 then
        return false
    end
    local line = vim.api.nvim_get_current_line()
    return line:sub(col, col):match("%s") == nil
end

blink_cmp.setup({
    keymap = {
        preset = "super-tab",

        ["<Tab>"] = {
            function(cmp)
                if has_words_before() then
                    return cmp.insert_next()
                end
            end,
            "fallback"
        },

        ["<S-Tab>"] = {
            "insert_prev"
        },

        ["<CR>"] = {
            "select_and_accept",
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

