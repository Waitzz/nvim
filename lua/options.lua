-- leader key
vim.g.mapleader = ","

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable trust color
vim.opt.termguicolors = true

-- common settings
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.virtualedit = "block,onemore"
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars = "tab:» ,trail:·,space:·"

-- tab settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- disable mouse
vim.opt.mouse = ""

-- split settings
vim.opt.splitbelow = true
vim.opt.splitright = true

-- search settings
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- cache settings
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.confirm = true

-- always show the signcolumn
vim.opt.signcolumn = "yes"

-- fold settings
local function buf_win_enter()
    local max = 0
    for i = 1, vim.api.nvim_buf_line_count(0) do
        if vim.fn.foldlevel(i) > max then
            max = vim.fn.foldlevel(i)
        end
    end
    vim.wo.foldlevel = max
end

function customer_foldtext()
    local indent = vim.fn.indent(vim.v.foldstart)
    return string.rep(" ", indent) .. "+-- " .. (vim.v.foldend - vim.v.foldstart + 1) .. " lines"
end

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.api.nvim_create_autocmd("BufWinEnter", {callback = buf_win_enter})
vim.opt.foldtext = "v:lua.customer_foldtext()"
vim.opt.fillchars = { fold = " " }
