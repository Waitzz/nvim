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
}

return m
