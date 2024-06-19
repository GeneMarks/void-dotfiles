return {
    "rmagatti/auto-session",
    opts = {
        log_level = "error",
        auto_session_allowed_dirs = {
            -- TODO
            -- "/Volumes/T7/Development/projects/*",
            "~/.dotfiles/*",
            "~/.local/share/nvim/sessions"
        },
        bypass_session_save_file_types = {
            "fugitive",
        },
    },
}
