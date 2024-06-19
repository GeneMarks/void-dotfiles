return {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
        local treesittercon = require("treesitter-context")
        treesittercon.setup({
            max_lines = 0,
            min_window_height = 10,
            multiline_threshold = 2,
        })

        -- Hide underline (bug?)
        vim.api.nvim_create_autocmd({ "ColorScheme" }, {
            pattern = "*",
            callback = function()
                vim.cmd [[ hi TreesitterContextBottom gui=none ]]
            end
        })

        vim.keymap.set("n", "[c", function()
            treesittercon.go_to_context(vim.v.count1)
        end, { desc = "Go to context", silent = true })
    end
}
