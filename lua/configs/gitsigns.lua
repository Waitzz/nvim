local is_ok, gitsigns = pcall(require, "gitsigns")
if not is_ok then
    return
end

local function map(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
end

local function on_attach_keymap()
    -- Navigation
    map("n", "]c", function()
        if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
        else
            gitsigns.nav_hunk("next")
        end
    end)

    map("n", "[c", function()
        if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
        else
            gitsigns.nav_hunk("prev")
        end
    end)
end

gitsigns.setup({
    sign_priority = 10,
    on_attach = on_attach_keymap,
})
