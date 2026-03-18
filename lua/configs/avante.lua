local m = {}

m.opts = {
    provider = "siliconflow",

    providers = {
        claude = {
            endpoint = "http://ssaiproxy/api",
            model = "glm-4.6",
            timeout = 30000, -- Timeout in milliseconds
            extra_request_body = {
                temperature = 0.75,
                max_tokens = 20480,
            },
        },

        siliconflow = {
            __inherited_from = "openai",
            api_key_name = "SILICONFLOW_API_KEY",
            endpoint = "https://api.siliconflow.cn/v1",
            model = "moonshotai/Kimi-K2-Thinking",
        },
    },

    input = {
        provider = "snacks",
    },

    selector = {
        provider = "snacks",
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
        "list_files", -- Built-in file operations
        "search_files",
        "read_file",
        "create_file",
        "rename_file",
        "delete_file",
        "create_dir",
        "rename_dir",
        "delete_dir",
        "bash", -- Built-in terminal access
    },
}

return m
