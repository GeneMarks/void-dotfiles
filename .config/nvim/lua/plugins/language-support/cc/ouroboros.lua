return {
    "jakemason/ouroboros.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    ft = { "c", "cpp" },
    config = function()
        require("ouroboros").setup({})

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "c", "cpp" },
            callback = function()
                vim.api.nvim_buf_set_keymap(0, "n", "<C-e>", "<CMD>Ouroboros<CR>", {
                    desc = "Switch h/cpp files",
                    noremap = true,
                    silent = true
                })
            end,
        })
    end
}
