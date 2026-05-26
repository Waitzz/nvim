local is_ok, sidekick = pcall(require, "sidekick")
if not is_ok then
    return
end

sidekick.setup({
    nes = { enabled = false },
})
