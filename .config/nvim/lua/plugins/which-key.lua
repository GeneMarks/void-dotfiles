return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    config = function()
        local wk = require("which-key")
        wk.setup({
            icons = {
                mappings = false,
                breadcrumb = "»",
                separator = "›",
                group = "+"
            },
        })

        wk.add({ "<leader>b", group = "Buffers" })
        wk.add({ "<leader>d", group = "Trouble" })
        wk.add({ "<leader>h", group = "Gitsigns" })
        wk.add({ "<leader>t", group = "Tabs" })
        wk.add({ "<leader>f", group = "Telescope" })
    end
}
