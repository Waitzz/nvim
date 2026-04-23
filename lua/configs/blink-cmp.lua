local blink_ok, blink_cmp = pcall(require, "blink.cmp")
if not blink_ok then
    return
end

local luasnip_ok, luasnip = pcall(require, "luasnip.loaders.from_vscode")
if luasnip_ok then
    luasnip.lazy_load()
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
                if cmp.is_visible() then
                    return cmp.select_next()
                end
            end,
            "snippet_forward",
            function(cmp)
                if has_words_before() then
                    return cmp.insert_next()
                end
            end,
            "fallback",
        },

        ["<S-Tab>"] = {
            function(cmp)
                if cmp.is_visible() then
                    return cmp.select_prev()
                end
            end,
            "snippet_backward",
            "fallback",
        },

        ["<CR>"] = {
            "select_and_accept",
            "fallback",
        },
    },
    snippets = {
        preset = "luasnip",
    },
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },

        per_filetype = {
            ["AvanteInput"] = { "avante" },
            ["dap-repl"] = { "dap" },
        },

        providers = {
            avante = {
                module = "blink-cmp-avante",
                name = "Avante",
            },
            dap = {
                module = "blink-cmp-dap",
                name = "DAP",
            },
        },
    },
    completion = {
        documentation = { auto_show = true },
        accept = { auto_brackets = { enabled = true } },
        list = { selection = { preselect = false } },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    cmdline = {
        completion = {
            menu = { auto_show = true },
            list = { selection = { preselect = false } },
        },
    },
})
