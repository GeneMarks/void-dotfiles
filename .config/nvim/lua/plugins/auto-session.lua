return {
    "rmagatti/auto-session",
    config = function()
        require("auto-session").setup()

        vim.keymap.set("n", "<leader>fs", "<CMD>SessionSearch<CR>", { desc = "Search sessions" })
    end
}
