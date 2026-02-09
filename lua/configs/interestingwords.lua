local is_ok, interestingwords = pcall(require, "interestingwords")
if not is_ok then
    return
end

interestingwords.setup({
    colors = {
        "#EC7279",
        "#DEB974",
        "#A0C980",
        "#5DBBC1",
        "#6CB6EB",
        "#D38AEA",
    },
    search_key = false,
})
