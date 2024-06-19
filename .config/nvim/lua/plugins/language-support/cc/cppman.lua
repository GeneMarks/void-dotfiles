return {
    "madskjeldgaard/cppman.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
        require("cppman").setup({})
    end
}
