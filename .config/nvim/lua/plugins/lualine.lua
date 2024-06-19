return {
    "nvim-lualine/lualine.nvim",
    opts = {
        options = {
            icons_enabled = false,
            section_separators = "",
            component_separators = "",
        },
        sections = {
            lualine_a = {},
            lualine_b = {"branch"},
            lualine_c = {
                {
                    "filename",
                    path = 1
                },
            },
            lualine_x = {"filetype"},
            lualine_y = {"location"},
            lualine_z = {}
        },
    }
}
