return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-buffer",
        "L3MON4D3/LuaSnip",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        local lsjump = function(direction)
            return cmp.mapping(function(fallback)
                if luasnip.jumpable(direction) then
                    luasnip.jump(direction)
                else
                    fallback()
                end
            end, {"i", "s"})
        end

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
                ["<C-SPACE>"] = cmp.mapping.complete(),
                ["<C-l>"] = lsjump(1),
                ["<C-h>"] = lsjump(-1),
            }),
            -- preselect = "item",
            -- completion = {
            --     completeopt = "menu, menuone, noinsert"
            -- },
            -- window = {
            --     completion = cmp.config.window.bordered(),
            --     documentation = cmp.config.window.bordered(),
            -- },
            sources = {
                { name = "nvim_lsp" },
                { name = "buffer" },
            },
            formatting = {
                fields = { "abbr", "kind", "menu" },
                format = function(entry, item)
                    local source = entry.source.name
                    local formatted = {
                        nvim_lsp = "LSP",
                        buffer = "Buffer",
                        path = "Path",
                        cmdline = "CMD",
                    }
                    item.menu = " [" .. formatted[source] .. "]"

                    return item
                end,
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            experimental = {
                ghost_text = true,
            },
        })

        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" }
            },
            {
                {
                    name = "cmdline",
                    option = {
                        ignore_cmds = { "Man", "!" },
                    },
                }
            })
        })
    end
}
