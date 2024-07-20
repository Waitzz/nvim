local is_ok, illuminate = pcall(require, "illuminate")
if not is_ok then
    return
end

illuminate.configure({
    providers = {
        "lsp",
        "treesitter"
    }
})
