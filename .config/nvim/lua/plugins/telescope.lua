return {
    "nvim-telescope/telescope.nvim", tag = "0.1.6",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "debugloop/telescope-undo.nvim",
        "rmagatti/session-lens",
        "rmagatti/auto-session",
    },
    config = function ()
        -- Configs
        local telescope = require("telescope")
        telescope.setup({
            extensions = {
                undo = {},
            },
        })

        -- Load extensions
        telescope.load_extension("undo")
        telescope.load_extension("session-lens")

        -- Keymaps
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Search buffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search help tags" })
        vim.keymap.set("n", "<leader>fu", "<CMD>Telescope undo<CR>", { desc = "Search undo history" })
        vim.keymap.set("n", "<leader>fs", "<CMD>SearchSession<CR>", { desc = "Search sessions" })
    end
}
