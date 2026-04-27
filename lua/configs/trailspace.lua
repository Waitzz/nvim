local is_ok, trailspace = pcall(require, "mini.trailspace")
if not is_ok then
    return
end

trailspace.setup({})

vim.api.nvim_create_user_command("MiniTrailspace", function()
    trailspace.trim()
end, {})
