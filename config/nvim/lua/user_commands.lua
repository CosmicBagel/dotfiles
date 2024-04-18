-- -- -- user commands -- -- --
-- nice when reading help docs
-- keep the cursor centered (should rewrite as lua)
vim.api.nvim_create_user_command('CenterCursorEnable',
[[let &scrolloff=(winheight(win_getid())/2)+1 |
execute 'normal zz' |
augroup VCenterCursor |
  au! |
  au BufEnter,WinEnter,WinNew,VimResized,WinResized *
    let &scrolloff=(winheight(win_getid())/2)+1 |
augroup END
]],
{})

vim.api.nvim_create_user_command('CenterCursorDisable',
function()
    vim.api.nvim_clear_autocmds({group = "VCenterCursor"})
    vim.opt.scrolloff=10
end, {})
