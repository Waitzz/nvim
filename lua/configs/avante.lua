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
    },

    -- system_prompt as function ensures LLM always has latest MCP server state
    -- This is evaluated for every message, even in existing chats
    system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        return hub and hub:get_active_servers_prompt() or ""
    end,
    -- Using function prevents requiring mcphub before it's loaded
    custom_tools = function()
        return {
            require("mcphub.extensions.avante").mcp_tool(),
        }
    end,

    disabled_tools = {
        "list_files",    -- Built-in file operations
        "search_files",
        "read_file",
        "create_file",
        "rename_file",
        "delete_file",
        "create_dir",
        "rename_dir",
        "delete_dir",
        "bash",         -- Built-in terminal access
    },
}

return m
