local m = {}

m.keys = {
    {
        "<leader>a+",
        function()
            local tree_ext = require("avante.extensions.nvim_tree")
            tree_ext.add_file()
        end,
        desc = "Select file in NvimTree",
        ft = "NvimTree",
    },

    {
        "<leader>a-",
        function()
            local tree_ext = require("avante.extensions.nvim_tree")
            tree_ext.remove_file()
        end,
        desc = "Deselect file in NvimTree",
        ft = "NvimTree",
    }
}

m.opts = {
    provider = "claude",
    mode = "legacy",

    providers = {
        claude = {
            endpoint = "http://ssaiproxy/api",
            model = "glm-4.6",
            timeout = 30000, -- Timeout in milliseconds
            extra_request_body = {
                temperature = 0.75,
                max_tokens = 20480,
            }
        }
    },

    selector = {
        exclude_auto_select = { "NvimTree" },
    }
}

return m
