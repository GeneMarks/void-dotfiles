return {
    "ramojus/mellifluous.nvim",
    name = "mellifluous",
    lazy = false,
    priority = 1000,
    config = function()
        require("mellifluous").setup({
            highlight_overrides = {
                light = function(hl, colors)
                    hl.set("Cursor", { bg = "#b8b8b8", fg = colors.bg })
                    hl.set("lCursor", { link = "Cursor" })
                    hl.set("CursorIM", { link = "Cursor" })
                end,
            }
        })
    end
}
