return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({})

        local gs = package.loaded.gitsigns

        -- Navigation
        vim.keymap.set("n", "]h", function()
            if vim.wo.diff then return "]h" end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
        end, { desc = "Next hunk", expr = true })

        vim.keymap.set("n", "[h", function()
            if vim.wo.diff then return "[h" end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
        end, { desc = "Previous hunk", expr = true })

        -- Actions
        vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
        vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
        vim.keymap.set("v", "<leader>hs", function() gs.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end, { desc = "Stage hunk" })
        vim.keymap.set("v", "<leader>hr", function() gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end, { desc = "Reset hunk" })
        vim.keymap.set("n", "<leader>hS", gs.stage_buffer, { desc = "Stage buffer" })
        vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo stage" })
        vim.keymap.set("n", "<leader>hR", gs.reset_buffer, { desc = "Reset buffer" })
        vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
        vim.keymap.set("n", "<leader>hb", gs.toggle_current_line_blame, { desc = "Toggle line blame" })
        vim.keymap.set("n", "<leader>hd", gs.diffthis, { desc = "Diff this" })
        vim.keymap.set("n", "<leader>hl", gs.toggle_deleted, { desc = "Toggle deleted" })
    end
}
