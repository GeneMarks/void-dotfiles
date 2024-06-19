return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function ()
        local servers = {
            "clangd",
            "jdtls",
            "tsserver",
            "eslint",
            "lua_ls",
            "tailwindcss"
        }

        -- Lsp keymaps
        vim.api.nvim_create_autocmd("LspAttach", {
            desc = "LSP actions",
            callback = function(event)
                vim.keymap.set("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", { desc = "Show information", buffer = event.buf })
                vim.keymap.set("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition", buffer = event.buf })
                vim.keymap.set("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", { desc = "Go to declaration", buffer = event.buf })
                vim.keymap.set("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", { desc = "Go to implementation", buffer = event.buf })
                vim.keymap.set("n", "go", "<CMD>lua vim.lsp.buf.type_definition()<CR>", { desc = "Go to type definition", buffer = event.buf })
                vim.keymap.set("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>", { desc = "Get references", buffer = event.buf })
                vim.keymap.set("n", "gs", "<CMD>lua vim.lsp.buf.signature_help()<CR>", { desc = "Get signature help", buffer = event.buf })
                vim.keymap.set("n", "<F2>", "<CMD>lua vim.lsp.buf.rename()<CR>", { desc = "Rename", buffer = event.buf })
                vim.keymap.set({"n", "x"}, "<F3>", "<CMD>lua vim.lsp.buf.format({async = true})<CR>", { desc = "Format", buffer = event.buf })
                vim.keymap.set("n", "<F4>", "<CMD>lua vim.lsp.buf.code_action()<CR>", { desc = "Code actions", buffer = event.buf })
            end
        })

        -- Mason config
        local function deep_merge(t1, t2)
            for k, v in pairs(t2) do
                if type(v) == "table" and type(t1[k]) == "table" then
                    deep_merge(t1[k], v) -- Recursively merge tables
                else
                    t1[k] = v -- Overwrite t1 with t2 value
                end
            end
        end

        local lspconfig = require("lspconfig")
        local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

        local handlers = {}
        for _, server in ipairs(servers) do
            local moduleName = "plugins.lsp.language-configs." .. server
            local success, module = pcall(require, moduleName)
            local config = { capabilities = lsp_capabilities or {} }

            if success then
                deep_merge(config, module)
            end

            handlers[server] = function()
                lspconfig[server].setup(config)
            end
        end

        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = servers,
            handlers = handlers
        })
    end
}
