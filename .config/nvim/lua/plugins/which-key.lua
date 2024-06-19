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
                breadcrumb = "»",
                separator = "›",
                group = "+"
            },
        })

        wk.register({ ["<leader>b"] = { name = "+Buffers" } }, { mode = "n" })
        wk.register({ ["<leader>d"] = { name = "+Trouble" } }, { mode = "n" })
        wk.register({ ["<leader>h"] = { name = "+Gitsigns" } }, { mode = { "n", "v" } })
        wk.register({ ["<leader>t"] = { name = "+Tabs" } }, { mode = "n" })
        wk.register({ ["<leader>f"] = { name = "+Telescope" } }, { mode = "n" })
    end
}
