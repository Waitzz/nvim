local is_ok, render_markdown = pcall(require, "render-markdown")
if not is_ok then
    return
end

render_markdown.setup({
    file_types = { "markdown", "codecompanion" },
    overrides = {
        buflisted = {
            [false] = { enabled = false },
        },
        filetype = {
            codecompanion = {
                enabled = true,
                anti_conceal = {
                    enabled = true,
                    disabled_modes = { "n" },
                },
                win_options = {
                    concealcursor = { rendered = "n" },
                },
            },
        },
    },
})
