local is_ok, interestingwords = pcall(require, "interestingwords")
if not is_ok then
    return
end

interestingwords.setup({
    search_key = false
})
