-- commands
-- :SessionSave " saves or creates a session in the currently set `auto_session_root_dir`.
-- :SessionSave ~/my/custom/path " saves or creates a session in the specified directory path.
-- :SessionRestore " restores a previously saved session based on the `cwd`.
-- :SessionRestore ~/my/custom/path " restores a previously saved session based on the provided path.
-- :SessionRestoreFromFile ~/session/path " restores any currently saved session
-- :SessionDelete " deletes a session in the currently set `auto_session_root_dir`.
-- :SessionDelete ~/my/custom/path " deleetes a session based on the provided path.
-- :SessionPurgeOrphaned " removes all orphaned sessions with no working directory left.
-- :Autosession search
-- :Autosession delete
-- note: SessionDelete is useful is a session becomes broken, and fails to load

return {
    "rmagatti/auto-session",
    config = function()
        vim.opt.sessionoptions:append 'globals'
        require("auto-session").setup {
            log_level = "error",
            auto_session_suppress_dirs = { "~/", "~/proj", "~/Downloads", "/" },
            pre_save_cmds = {
                function()
                    vim.api.nvim_exec_autocmds('User', { pattern = 'SessionSavePre' })
                end,
            }
        }
    end,
}
